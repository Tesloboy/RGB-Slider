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
        //mainView = UIColor(red: , green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>)
        
        // MARK: Label
        
        redLabel.text = ""
        greenLabel.text = ""
        blueLabel.text = ""
        
        
        // MARK: Slider
        // red
        var redSliderValue = redSlider.value
        redSlider.value = 0
        redSlider.minimumValue = 0
        redSlider.maximumValue = 255
        redSlider.minimumTrackTintColor = .red
        // green
        var greenSliderValue = greenSlider.value
        greenSlider.value = 0
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 255
        greenSlider.minimumTrackTintColor = .green
        //blue
        var blueSliderValue = blueSlider.value
        blueSlider.value = 0
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 255
        blueSlider.minimumTrackTintColor = .blue
        
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
        mainView.backgroundColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: 1)
    }
    @IBAction func greenSliderViewAction(_ sender: Any) {
        //greenLabel.text = String(Int(greenSlider.value))
        //mainView.backgroundColor = UIColor(red: 0, green: CGFloat(greenSlider.value/255), blue: 0, alpha: 1)
        redLabel.text = String(Int(redSlider.value))
        greenLabel.text = String(Int(greenSlider.value))
        blueLabel.text = String(Int(blueSlider.value))
        mainView.backgroundColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: 1)
    }
    @IBAction func blueSliderViewAction(_ sender: Any) {
        //blueLabel.text = String(Int(blueSlider.value))
        //mainView.backgroundColor = UIColor(red: 0, green: 0, blue: CGFloat(blueSlider.value/255), alpha: 1)
        redLabel.text = String(Int(redSlider.value))
        greenLabel.text = String(Int(greenSlider.value))
        blueLabel.text = String(Int(blueSlider.value))
        mainView.backgroundColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: 1)
    }
 // MARK: Color Action
    func someOfColor (_ sender: Any) {
        //mainView.backgroundColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: 1)
    }
    
}

