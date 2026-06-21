import Foundation

struct StoryNode {
    let text: String
    let choice1: String
    let choice2: String
    let destination1: Int
    let destination2: Int
}

class StoryBrain {
    let stories = [
        // Node 0: Layer 1 (Start)
        StoryNode(text: "You wake up in a dark forest. Two paths stand before you. One emits a faint red glow. The other is speckled with shimmering traces of sea salt.", choice1: "Walk the Red Path", choice2: "Walk the Salt Path", destination1: 1, destination2: 2),
        
        // Node 1: Layer 2 (Red Path)
        StoryNode(text: "Your path takes you to a sweltering cave smoldering with ashes. A sleeping lava golem blocks your path. Do you try to sneak past it or attack it while it sleeps?", choice1: "Attempt to sneak past", choice2: "Attack it while it sleeps", destination1: 3, destination2: 4),
        // Node 2: Layer 2 (Salt  Path)
        StoryNode(text: "You path takes you to a foggy shoal with a pirate ship. The captain offers you a ride if you give up your gold.", choice1: "Pay the captain your gold", choice2: "Refuse and fight your way out", destination1: 5, destination2: 6),
        
        // Node 3: Layer 3 (Ending 1 - Unsuccessful)
        StoryNode(text: "You trip on a rock while feeling around in the dim glow. The golem wakes up and crushes you. GAME OVER.", choice1: "Restart Adventure", choice2: "", destination1: 0, destination2: 0),
        // Node 4: Layer 3 (Ending 2 - Successful)
        StoryNode(text: "You strike the golem's weak point! It shatters, revealing a hidden exit back to the surface. YOU WIN!", choice1: "Restart Adventure", choice2: "", destination1: 0, destination2: 0),
        // Node 5: Layer 3 (Ending 3 - Successful)
        StoryNode(text: "The captain takes your gold with a grin, but honors his word. You sail to freedom. YOU WIN!", choice1: "Restart Adventure", choice2: "", destination1: 0, destination2: 0),
        // Node 6: Layer 3 (Ending 4 - Unsuccessful)
        StoryNode(text: "The pirate captain gets angry and throws you into the brig forever. GAME OVER.", choice1: "Restart Adventure", choice2: "", destination1: 0, destination2: 0)
    ]
    var currentNodeIndex = 0
    func getCurrentStory() -> StoryNode {
        return stories[currentNodeIndex]
    }
    func nextNode(userChoice: Int) {
        let currentStory = stories[currentNodeIndex]
        if userChoice == 1 {
            currentNodeIndex = currentStory.destination1
        }
        else {
            currentNodeIndex = currentStory.destination2
        }
    }
}
