import UIKit

class ViewController: UIViewController {
    let storyBrain = StoryBrain()
    var adventureView: AdventureView!
    override func loadView() {
        adventureView = AdventureView()
        view = adventureView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        adventureView.backgroundImageView.image = UIImage(named: "background")
        adventureView.choice1Button.addTarget(self, action: #selector(choiceMade(_:)), for: .touchUpInside)
        adventureView.choice2Button.addTarget(self, action: #selector(choiceMade(_:)), for: .touchUpInside)
        updateUI()
    }

    @objc func choiceMade(_ sender: UIButton) {
        storyBrain.nextNode(userChoice: sender.tag)
        updateUI()
    }

    func updateUI() {
        let currentStory = storyBrain.getCurrentStory()
        
        adventureView.storyLabel.text = currentStory.text
        adventureView.choice1Button.setTitle(currentStory.choice1, for: .normal)
        adventureView.choice2Button.setTitle(currentStory.choice2, for: .normal)
        adventureView.choice2Button.isHidden = currentStory.choice2.isEmpty
    }
}
