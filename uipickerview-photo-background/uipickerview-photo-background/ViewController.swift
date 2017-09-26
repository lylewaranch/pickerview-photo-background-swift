//
//  ViewController.swift
//  uipickerview-photo-background
//
//  Created by Lyle Waranch on 9/25/17.
//  Copyright © 2017 Lyle Waranch. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let categories = ["Country","Modern","Industrial","Traditional","Skylines","Graffiti walls", "Train tracks", "Gardens", "Docks", "Farms"] //UIPicker categories
    let images = ["country", "modern", "industrial", "traditional", "skylines", "graffiti", "traintracks", "gardens", "docks", "farms"] //names of image assets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var UIPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIPicker.dataSource = self
        UIPicker.delegate = self
        self.imageView.image = UIImage(named:images[0]) //set background to first image in image set
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        let currentImage = images[row]
        let toImage = UIImage(named:currentImage)
        UIView.transition(with: self.imageView,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: {
                            self.imageView.image = toImage
                          },
                          completion: nil)
        
    }
}
