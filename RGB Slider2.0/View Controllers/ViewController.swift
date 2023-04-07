import UIKit

    // MARK: - Protocol
protocol ColorSelectionDelegate: AnyObject {
    func didSelectColor(_ color: UIColor)
}

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Outlets
    // View
    @IBOutlet weak var mainView: UIView!
    // Color Labels
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var lightLabel: UILabel!
    // Sliders
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var lightSlider: UISlider!
    // Text Field
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    @IBOutlet weak var lightTextField: UITextField!
    // Buttons
    @IBOutlet weak var doneButton: UIButton!

    //объявим делегат
    weak var delegate: ColorSelectionDelegate?
    //объявим цвет экрана
    var mainViewColor: UIColor!
    
        // MARK: - Lifecycle
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
//        redLabel.text = "0"
//        greenLabel.text = "0"
//        blueLabel.text = "0"
//        lightLabel.text = "255"
        
        // MARK: Slider
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        lightSlider.minimumTrackTintColor = .gray
        
        mainView.backgroundColor = mainViewColor
        
    }
    
        // MARK: - Functions
    // Метод делегата, вызываемый при нажатии на клавишу "Return"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Скрываем клавиатуру
        textField.resignFirstResponder()
        return true

    }
    
    //скрывае клавиатуру по тапу
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
            updateTextFields()

        }

        func updateTextFields() {
            redTextField.text = "\(Int(redSlider.value))"
            greenTextField.text = "\(Int(greenSlider.value))"
            blueTextField.text = "\(Int(blueSlider.value))"
            lightTextField.text = "\(Int(lightSlider.value))"

            redLabel.text = "\(Int(redSlider.value))"
            greenLabel.text = "\(Int(greenSlider.value))"
            blueLabel.text = "\(Int(blueSlider.value))"
            lightLabel.text = "\(Int(lightSlider.value))"

            didSelectColor()
        }


    private func didSelectColor() {

        mainView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value) / 255.0,
            green: CGFloat(greenSlider.value) / 255.0,
            blue: CGFloat(blueSlider.value) / 255.0,
            alpha: CGFloat(lightSlider.value) / 255.0)

    }
    

    // MARK: - View Action
    @IBAction func allColor (_ sender: UISlider) {
        updateTextFields()
    }
    
    //Добавим кнопку 'done' и добавим в нее МЕТОД ДЕЛЕГАТА 'didSelectColor'
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        delegate?.didSelectColor(mainView.backgroundColor ?? .white)
        dismiss(animated: true, completion: nil)
    }

}

    // MARK: - Alert
extension ViewController {
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text else { return }
        if let currentValue = Float(text), currentValue <= 255 {
            switch textField.tag {
            case 0:
                redSlider.setValue(currentValue, animated: true)
            case 1:
                greenSlider.setValue(currentValue, animated: true)
            case 2:
                blueSlider.setValue(currentValue, animated: true)
            case 3:
                lightSlider.setValue(currentValue, animated: true)
            default: break
            }
            
            didSelectColor()
            return
        }
        
      showAlert(title: "Wrong format!", message: "Please enter correct value")
    }
}
