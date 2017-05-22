//: [Previous](@previous)

// Created by Liz Marley
// March 2017

import UIKit
import PlaygroundSupport

let vc = TransformPuzzleVC()
PlaygroundPage.current.liveView = vc
vc.hideButtons()

vc.start(puzzle: 3)

let duck = vc.duck

// 'Identity' means something that can be combined with other elements without changing them. Like adding 0 or multipying by 1.
var transform = CGAffineTransform.identity

// The combining of two transforms together is 'concatenating'.
transform = transform.concatenating(CGAffineTransform(translationX: 0, y: 0))
transform = transform.concatenating(CGAffineTransform(rotationAngle: CGFloat.pi * 0/4))

duck.transform = transform

// If you get stuck, maybe go back and try this puzzle in the first playground page again?

//: [Now what?](@next)
