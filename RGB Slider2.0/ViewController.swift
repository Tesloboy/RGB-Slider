//
//  ViewController.swift
//  RGB Slider
//
//  Created by Viktor Teslenko on 22.02.2023.
//
//Сделайте приложение в котором можно менять цвет заливки вью, при помощи слайдеров. Значение каждого слайдера должно отображаться в соответствующем лейбле.Цвет слева от бегунка слайдера должен соответствовать тому цвету, за который он отвечает.

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

        // MARK: - View
    @IBOutlet weak var mainView: UIView!
        // MARK: - Color Labels
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var lightLabel: UILabel!
        // MARK: - Sliders
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var lightSlider: UISlider!
        // MARK: - Text Field
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    @IBOutlet weak var lightTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Назначаем делегатом текстового поля текущий экземпляр ViewController
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        lightTextField.delegate = self
        
        // MARK: View
        mainView.layer.cornerRadius = 10
        
        // MARK: Label
        redLabel.text = "0"
        greenLabel.text = "0"
        blueLabel.text = "0"
        lightLabel.text = "255"
        
        // MARK: Slider
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        lightSlider.minimumTrackTintColor = .gray
    }
    
    // Метод делегата, вызываемый при нажатии на клавишу "Return"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Скрываем клавиатуру
        textField.resignFirstResponder()
        return true

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // Метод делегата, вызываемый при изменении текста в поле
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text, let value = Int(text) else {
            return
        }
        
        // Ограничиваем значение в диапазоне от 0 до 255
        let clampedValue = max(0, min(value, 255))
        
        // Обновляем значение соответствующего слайдера
        switch textField {
        case redTextField:
            redSlider.value = Float(clampedValue)
        case greenTextField:
            greenSlider.value = Float(clampedValue)
        case blueTextField:
            blueSlider.value = Float(clampedValue)
        case lightTextField:
            lightSlider.value = Float(clampedValue)
        default:
            break
        }
        
        func updateTextFields() {
            redTextField.text = "\(Int(redSlider.value))"
            greenTextField.text = "\(Int(greenSlider.value))"
            blueTextField.text = "\(Int(blueSlider.value))"
            lightTextField.text = "\(Int(lightSlider.value))"
        }
        
        
        
    }
    
    // MARK: View Action
    @IBAction func allColor (_ sender: UISlider) {
        redLabel.text = String(Int(redSlider.value))
        redTextField.text = String(Int(redSlider.value))
        
        greenLabel.text = String(Int(greenSlider.value))
        greenTextField.text = String(Int(greenSlider.value))
        
        blueLabel.text = String(Int(blueSlider.value))
        blueTextField.text = String(Int(blueSlider.value))
        
        lightLabel.text = String(Int(lightSlider.value))
        lightTextField.text = String(Int(lightSlider.value))
        
        mainView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value/255),
            green: CGFloat(greenSlider.value/255),
            blue: CGFloat(blueSlider.value/255),
            alpha: CGFloat(lightSlider.value/255))
    }
    
    
}

