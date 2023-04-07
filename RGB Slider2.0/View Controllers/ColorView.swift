import UIKit

class ColorView: UIViewController {
    
    // MARK: - Buttons
    @IBOutlet var changeColorBotton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        changeColorBotton.layer.cornerRadius = 15
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! ViewController
        viewController.delegate = self
        viewController.mainViewColor = view.backgroundColor
    }
    
}

// MARK: - Extension
extension ColorView: ColorSelectionDelegate {
    func didSelectColor(_ color: UIColor) {
        // устанавливаем цвет фона экрана
        view.backgroundColor = color
    }
}
