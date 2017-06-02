//: [Previous](@previous)

import UIKit
import PlaygroundSupport

let vc = TransformPuzzleVC()
PlaygroundPage.current.liveView = vc
vc.hideButtons()

vc.start(puzzle: 2)

let duck = vc.duck

//: Edit the following line of code to get the duck aligned with its shadow.
duck.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 1/4)

//: Where did the 4 and the pi come from? These angles are in radians. If you think in degrees, [here's a conversion chart](https://commons.wikimedia.org/wiki/File:Unit_circle_angles_color.svg).


//: [Next](@next)
