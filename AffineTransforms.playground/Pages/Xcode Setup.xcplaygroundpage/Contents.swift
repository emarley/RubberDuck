/*:
 ## iPad Setup Instructions

 * Tap 'Run My Code' in the lower right corner to split the screen and see a graphic view with a duck.

 * When you're finished with each page, tap the red 'Next' in the bottom left to move on to the next exercise. (You should skip the Xcode Setup instructions and tap 'Next' now.)

 ## Xcode Setup Instructions

 * If you are running Xcode 8.3 (or newer?), quit Xcode, run the following command in Terminal, and then relaunch Xcode.

 ```
 defaults write com.apple.dt.xcode IDEPlaygroundDisableSimulatorAlternateFramebuffer -bool YES
 ```

 * **View > Assistant Editor > Show Assistant Editor**

 * At the top of the Assistant Editor, choose **Timeline** (not **Manual**). You should see a duck on the right hand half of your screen.
 * When you're finished with each page, click the blue 'Next' in the bottom left to move on to the next exercise. (Hey, look, here's one of those 'Next' buttons now!)

 [Next](@next)
 */

import PlaygroundSupport
import UIKit
let duckView = UIImageView(image: #imageLiteral(resourceName: "Duck.png"))
duckView.backgroundColor = .blue
PlaygroundPage.current.liveView = duckView
