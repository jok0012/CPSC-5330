import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var eurLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var cadLabel: UILabel!

    var usdAmount: Int = 0
    var wantsEUR = false
    var wantsGBP = false
    var wantsJPY = false
    var wantsCAD = false
    
    private let converter = CurrencyConverterModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        displayResults()
    }

    private func displayResults() {
        if wantsEUR, let result = converter.convert(usdAmount: usdAmount, to: "EUR") {
            eurLabel.text = "EUR: \(String(format: "%.2f", result))"
            eurLabel.isHidden = false
        }
        else {
            eurLabel.isHidden = true }
        
        if wantsGBP, let result = converter.convert(usdAmount: usdAmount, to: "GBP") {
            gbpLabel.text = "GBP: \(String(format: "%.2f", result))"
            gbpLabel.isHidden = false
        }
        else {
            gbpLabel.isHidden = true }
        
        if wantsJPY, let result = converter.convert(usdAmount: usdAmount, to: "JPY") {
            jpyLabel.text = "JPY: \(String(format: "%.2f", result))"
            jpyLabel.isHidden = false
        }
        else { jpyLabel.isHidden = true }
        
        if wantsCAD, let result = converter.convert(usdAmount: usdAmount, to: "CAD") {
            cadLabel.text = "CAD: \(String(format: "%.2f", result))"
            cadLabel.isHidden = false
        } else {
            cadLabel.isHidden = true }
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)}
}
