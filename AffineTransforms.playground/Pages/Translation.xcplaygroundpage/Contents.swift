//: [Previous](@previous)

import UIKit
import PlaygroundSupport

let vc = TransformPuzzleVC()
vc.topLeftView.backgroundColor = UIColor.green
PlaygroundPage.current.liveView = vc
vc.hideButtons()

vc.start(puzzle: 0)

 let duck = vc.duck

//: Edit the following line of code to align the ducks...
duck.transform = CGAffineTransform(translationX: 0, y: 0)

//: Once you've got your duck to its shadow, tap `Next` to move on to the next coding challenge.

//: [Next](@next)
