//: [Previous](@previous)

// Created by Liz Marley
// March 2017

import UIKit
import PlaygroundSupport

let vc = TransformPuzzleVC()
vc.topLeftView.backgroundColor = UIColor.green
PlaygroundPage.current.liveView = vc
vc.hideButtons()

vc.start(puzzle: 0)

 let duck = vc.duck

// Edit the following line of code to align the ducks...
duck.transform = CGAffineTransform(translationX: 0, y: 0)

// Once you have solved puzzle 0, edit line 13 to try puzzle 1.

//: [Enough translating, let's rotate!](@next)
