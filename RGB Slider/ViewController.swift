//
//  ViewController.swift
//  RGB Slider
//
//  Created by Viktor Teslenko on 22.02.2023.
//
//Сделайте приложение в котором можно менять цвет заливки вью, при помощи слайдеров. Значение каждого слайдера должно отображаться в соответствующем лейбле.Цвет слева от бегунка слайдера должен соответствовать тому цвету, за который он отвечает.

import UIKit

class ViewController: UIViewController {

    // View
    @IBOutlet var mainView: UIView!
    // Color Labels
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    // Sliders
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: View
        
        
        // MARK: Label
        
        redLabel.text = ""
        greenLabel.text = ""
        blueLabel.text = ""
        
        
        // MARK: Slider
        // red
        redSlider.value = 0
        redSlider.minimumValue = 0
        redSlider.maximumValue = 255
        redSlider.minimumTrackTintColor = .red
        // green
        greenSlider.value = 0
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 255
        greenSlider.minimumTrackTintColor = .green
        //blue
        blueSlider.value = 0
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 255
        blueSlider.minimumTrackTintColor = .blue
    }


    
    
}

