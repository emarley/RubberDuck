import UIKit
import Foundation

public class TransformPuzzleVC: GameConsoleVC
{
    public let duck = UIImageView(image: #imageLiteral(resourceName: "Duck.png"))
    let goal = UIImageView(image: #imageLiteral(resourceName: "Goal.png"))
    let message = UILabel()
    let success = UILabel()
    let nextPuzzleButton = UIButton()
    let finalLabel = UILabel()

    var queue: [CGAffineTransform] = []
    var currentPuzzleIndex = 0

    let puzzles: [Puzzle] = [
        Puzzle(startPoint: CGPoint(x: 20, y: 200),
               goalTransform: CGAffineTransform(translationX: 240, y:0),
               message: "Tap 'Translate X' to move the duck to its shadow."),
        Puzzle(startPoint: CGPoint(x: 100, y: 30),
               goalTransform: CGAffineTransform(translationX: 0, y: 160),
               message: "'Translate Y' will move the duck vertically."),
        Puzzle(startPoint: CGPoint(x: 100, y: 100),
               goalTransform: CGAffineTransform(rotationAngle: CGFloat.pi),
               message: "Enough positive or negative rotation can turn the duck upside down."),
        Puzzle(startPoint: CGPoint(x: 160, y: 160), goalTransform: CGAffineTransform(translationX: 80, y: 80).rotated(by: CGFloat.pi*7/4),
               message: "Now combine all your skills. But watch out, order matters!")
    ]

    override public func loadView() {
        super.loadView()
        duck.frame.size = CGSize(width: 50, height: 30)
        duck.contentMode = .scaleAspectFit
        goal.frame.size = CGSize(width: 50, height: 30)
        goal.contentMode = .scaleAspectFit

        setupSuccessViews()
        setupButtons()
        self.topLeftView.addSubview(message)
        message.translatesAutoresizingMaskIntoConstraints = false
        message.leftAnchor.constraint(equalTo: topLeftView.leftAnchor, constant: 20).isActive = true
        message.rightAnchor.constraint(lessThanOrEqualTo: topLeftView.rightAnchor, constant: -20).isActive = true
        message.bottomAnchor.constraint(equalTo: topLeftView.bottomAnchor).isActive = true
        message.numberOfLines = 0
        message.text = "Rubber Duck Debugging CGAffineTransforms"
        message.textAlignment = .center
    }

    func setupSuccessViews() {
        self.topLeftView.addSubview(success)
        success.translatesAutoresizingMaskIntoConstraints = false
        success.centerXAnchor.constraint(equalTo: topLeftView.centerXAnchor).isActive = true
        success.centerYAnchor.constraint(equalTo: topLeftView.centerYAnchor).isActive = true
        success.text = "Success!"
        success.backgroundColor = topLeftView.backgroundColor
        success.font = UIFont.systemFont(ofSize: 36)
        success.isHidden = true

        self.topLeftView.addSubview(nextPuzzleButton)
        nextPuzzleButton.setTitle("Next Puzzle", for: .normal)
        nextPuzzleButton.translatesAutoresizingMaskIntoConstraints = false
        nextPuzzleButton.centerXAnchor.constraint(equalTo: topLeftView.centerXAnchor).isActive = true
        nextPuzzleButton.topAnchor.constraint(greaterThanOrEqualTo: success.bottomAnchor).isActive = true
        nextPuzzleButton.heightAnchor.constraint(equalToConstant: 44)
        nextPuzzleButton.isHidden = true
        nextPuzzleButton.addTarget(self, action: #selector(self.startNextPuzzle), for: .touchUpInside)

        self.topLeftView.addSubview(finalLabel)
        finalLabel.text = "You have solved all the puzzles."
        finalLabel.translatesAutoresizingMaskIntoConstraints = false
        finalLabel.centerXAnchor.constraint(equalTo: topLeftView.centerXAnchor).isActive = true
        finalLabel.topAnchor.constraint(equalTo: success.bottomAnchor, constant: 10).isActive = true
        finalLabel.isHidden = true
    }

    public func start() {
        self.start(puzzle: currentPuzzleIndex)
    }

    public func start(puzzle index: Int) {
        let currentPuzzle = puzzles[index]
        queue = []
        duck.isHidden = false
        goal.isHidden = false
        duck.transform = CGAffineTransform.identity
        duck.frame.origin = currentPuzzle.startPoint
        goal.transform = CGAffineTransform.identity
        goal.frame.origin = currentPuzzle.startPoint
        goal.transform = currentPuzzle.goalTransform
        message.text = currentPuzzle.message
        success.isHidden = true
        nextPuzzleButton.isHidden = true
        self.topLeftView.addSubview(goal)
        self.topLeftView.addSubview(duck)
    }

    func enqueue(_ transform: CGAffineTransform) {
        queue.append(transform)
        duck.transform = queue.reduce(CGAffineTransform.identity, {$0.concatenating($1)})
        self.backgroundView.setNeedsLayout()
    }

    // Button Actions
    func setupButtons() {
        _ = self.addButton(named: "Translate X", action: #selector(self.translateX))
        _ = self.addButton(named: "Translate Y", action: #selector(self.translateY))
        _ = self.addButton(named: "Rotate +", action: #selector(self.rotatePlus))
        _ = self.addButton(named: "Rotate -", action: #selector(self.rotateMinus))
        _ = self.addButton(named: "", action: nil) //spacer
        _ = self.addButton(named: "Reset", action: #selector(self.reset), tinted: .red)
    }

    func translateX() {
        enqueue(CGAffineTransform(translationX: 80, y: 0))
    }

    func translateY() {
        enqueue(CGAffineTransform(translationX: 0, y: 80))
    }

    func rotatePlus() {
        enqueue(CGAffineTransform(rotationAngle: CGFloat.pi/4))
    }

    func rotateMinus() {
        enqueue(CGAffineTransform(rotationAngle: -CGFloat.pi/4))
    }

    func reset() {
        queue = []
        duck.transform = CGAffineTransform.identity
        self.backgroundView.setNeedsLayout()
    }

    func startNextPuzzle() {
        currentPuzzleIndex += 1
        if currentPuzzleIndex <= puzzles.count {
            start()
        }
    }

    override public func viewDidLayoutSubviews() {
        if (duck.transform.kindaEquals(transform: goal.transform)) {
            var viewsToReveal: [UIView] = [success]
            var viewsToHide: [UIView] = []
            if (currentPuzzleIndex + 1 < puzzles.count) {
                viewsToReveal.append(nextPuzzleButton)
                viewsToHide.append(duck)
                viewsToHide.append(goal)
            } else {
                viewsToReveal.append(finalLabel)
                viewsToHide.append(contentsOf: buttonStack.subviews)
                viewsToHide.append(message)
            }
            for v in viewsToReveal {
                v.alpha = 0.0
                v.isHidden = false
            }
            for v in viewsToHide {
                v.isHidden = true
            }
            UIView.animate(withDuration: 1.0) {
                for v in viewsToReveal {
                    v.alpha = 1.0
                }
            }
        }
    }
    
}

