//
//  ColorView.swift
//  RGB Slider
//
//  Created by Viktor Teslenko on 22.03.2023.
//

import UIKit

class ColorView: UIViewController {

    
    @IBOutlet var changeColorBotton: UIButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        changeColorBotton.layer.cornerRadius = 10
    }
 
}
