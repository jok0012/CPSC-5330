import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var agencyLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    var mission: Mission?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let missionData = mission {
            nameLabel.text = missionData.name
            yearLabel.text = "Launch Year: \(missionData.year)"
            agencyLabel.text = "Agency: \(missionData.agency)"
            detailsLabel.text = missionData.details
        }
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
