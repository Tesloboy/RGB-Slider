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
    @IBOutlet var lightLabel: UILabel!
    // Sliders
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet var lightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: View
        mainView.layer.cornerRadius = 10
        
        // MARK: Label
        redLabel.text = ""
        greenLabel.text = ""
        blueLabel.text = ""
        lightLabel.text = ""
        
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
        blueSlider.value =  0
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 255
        blueSlider.minimumTrackTintColor = .blue
        //Light
        lightSlider.value = 255
        lightSlider.minimumValue = 0
        lightSlider.maximumValue = 255
        lightSlider.minimumTrackTintColor = .gray
        
        ///mainView = UIColor(red: 0/255, green: 0/255, blue: 65/255, alpha: 1)
        
//        var mainViewColor = UIColor(red: CGFloat(redSliderValue), green: CGFloat(greenSliderValue), blue: CGFloat(blueSliderValue), alpha: 1)
//        mainView = UIView(mainViewColor)

//        mainView.backgroundColor = UIColor(red: CGFloat(redSliderValue), green: CGFloat(greenSliderValue), blue: CGFloat(blueSliderValue), alpha: 1)

        
    }

// MARK: View Action
    @IBAction func redSliderViewAction(_ sender: Any) {
        redLabel.text = String(Int(redSlider.value))
        greenLabel.text = String(Int(greenSlider.value))
        blueLabel.text = String(Int(blueSlider.value))
        lightLabel.text = String(Int(lightSlider.value))
        
        mainView.backgroundColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: CGFloat(lightSlider.value/255))
    }
    @IBAction func greenSliderViewAction(_ sender: Any) {
        redLabel.text = String(Int(redSlider.value))
        greenLabel.text = String(Int(greenSlider.value))
        blueLabel.text = String(Int(blueSlider.value))
        lightLabel.text = String(Int(lightSlider.value))
        
        mainView.backgroundColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: CGFloat(lightSlider.value/255))
    }
    @IBAction func blueSliderViewAction(_ sender: Any) {
        redLabel.text = String(Int(redSlider.value))
        greenLabel.text = String(Int(greenSlider.value))
        blueLabel.text = String(Int(blueSlider.value))
        lightLabel.text = String(Int(lightSlider.value))
        
        mainView.backgroundColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: CGFloat(lightSlider.value/255))
    }
    @IBAction func lightSliderViewAction(_ sender: Any) {
        redLabel.text = String(Int(redSlider.value))
        greenLabel.text = String(Int(greenSlider.value))
        blueLabel.text = String(Int(blueSlider.value))
        lightLabel.text = String(Int(lightSlider.value))
        
        mainView.backgroundColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: CGFloat(lightSlider.value/255))
    }
}

