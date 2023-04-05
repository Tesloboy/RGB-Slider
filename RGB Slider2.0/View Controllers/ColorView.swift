import UIKit

class ColorView: UIViewController {
    
    // MARK: -Properties
    var selectColor: UIColor?
    
        // MARK: - Buttons
    @IBOutlet var changeColorBotton: UIButton!
    
        // MARK: - View from VC
    @IBOutlet weak var mainView: UIView!

    
        // MARK: -Lifecycle
    override func viewDidLoad() {
    super.viewDidLoad()
        changeColorBotton.layer.cornerRadius = 10
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
    
        // MARK: - Private metods
    private func setupUI() {
        guard let selectColor = selectColor else { return }
        //устанавливаем цвет фона экрана
        view.backgroundColor = selectColor
        
        //устанавливаем цвет mainView
        mainView.backgroundColor = selectColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? ViewController {
            viewController.delegate = self
        } else if let colorView = segue.destination as? ColorView, let selectedColor = sender as? UIColor {
            colorView.selectColor = selectedColor
            colorView.setupUI()
        }
    }

}


extension ColorView: ColorSelectionDelegate {
    func didSelectColor(color newColor: UIColor) {
        // устанавливаем цвет фона экрана
        view.backgroundColor = newColor
    }
}
