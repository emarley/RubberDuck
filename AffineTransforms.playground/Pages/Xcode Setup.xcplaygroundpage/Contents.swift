/*:
  ## Xcode Setup Instructions
 (If you are on an iPad, please tap `Next` at the bottom of this page to get on with the playground.)
 
 * Click on this text, then open the **Editor** menu and choose **Show Rendered Markup**. This text should stop looking like markdown or code comments.
 
 * **View > Assistant Editor > Show Assistant Editor**
 
 * At the top of the Assistant Editor, choose **Timeline** (not **Manual**). You should see a duck on the right hand half of your screen.
 
 * If you are running Xcode 8.3 (or newer?), quit Xcode, run the following command in Terminal, and then relaunch Xcode.
 
```
 defaults write com.apple.dt.xcode IDEPlaygroundDisableSimulatorAlternateFramebuffer -bool YES
```
 [Next](@next)
 */

import PlaygroundSupport
import UIKit
let duckView = UIImageView(image: #imageLiteral(resourceName: "Duck.png"))
duckView.backgroundColor = .blue
PlaygroundPage.current.liveView = duckView
