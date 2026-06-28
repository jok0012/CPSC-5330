import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var usdTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var eurSwitch: UISwitch!
    @IBOutlet weak var gbpSwitch: UISwitch!
    @IBOutlet weak var jpySwitch: UISwitch!
    @IBOutlet weak var cadSwitch: UISwitch!
    var validUsdAmount: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        errorMessageLabel.isHidden = true
    }
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let text = usdTextField.text, !text.isEmpty, let amount = Int(text) else {
            errorMessageLabel.text = "Error: Please enter a valid integer amount."
            errorMessageLabel.isHidden = false
            return
        }
        errorMessageLabel.isHidden = true
        validUsdAmount = amount
        performSegue(withIdentifier: "showResultsSegue", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResultsSegue" {
            if let destinationVC = segue.destination as? ResultViewController {
                destinationVC.usdAmount = validUsdAmount
                destinationVC.wantsEUR = eurSwitch.isOn
                destinationVC.wantsGBP = gbpSwitch.isOn
                destinationVC.wantsJPY = jpySwitch.isOn
                destinationVC.wantsCAD = cadSwitch.isOn
            }
        }
    }
}
