import UIKit
import Foundation

// Manage a 2-tile stack view to keep its subviews as square as possible
open class DominoVC : UIViewController
{
    public let backgroundView = UIView()
    public let rotatorView = UIStackView()
    public let topLeftView = UIView()
    public let bottomRightView = UIView()

    override open func loadView() {
        super.loadView()
        backgroundView.backgroundColor = UIColor.white
        self.view = backgroundView
        let bgMargins = backgroundView.layoutMarginsGuide

        backgroundView.addSubview(rotatorView)
        rotatorView.translatesAutoresizingMaskIntoConstraints = false
        rotatorView.leadingAnchor.constraint(equalTo: bgMargins.leadingAnchor).isActive = true
        rotatorView.trailingAnchor.constraint(equalTo: bgMargins.trailingAnchor).isActive = true
        rotatorView.topAnchor.constraint(equalTo: bgMargins.topAnchor).isActive = true
        rotatorView.bottomAnchor.constraint(equalTo: bgMargins.bottomAnchor).isActive = true
        rotatorView.axis = .vertical // assume view is portrait, fix later?
        rotatorView.distribution = .fillEqually

        bottomRightView.backgroundColor = .white
        topLeftView.backgroundColor = .lightGray
        rotatorView.addArrangedSubview(topLeftView)
        rotatorView.addArrangedSubview(bottomRightView)
    }

    override open func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        rotatorView.axis = (size.width < size.height) ? .vertical : .horizontal
    }
}

// A blank slate and a stack of buttons below/right for controls
open class GameConsoleVC: DominoVC
{
    public let buttonStack = UIStackView()

    override open func loadView() {
        super.loadView()
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        let buttonWrapperMargins = bottomRightView.layoutMarginsGuide
        bottomRightView.addSubview(buttonStack)
        buttonStack.leadingAnchor.constraint(equalTo: buttonWrapperMargins.leadingAnchor).isActive = true
        buttonStack.trailingAnchor.constraint(equalTo: buttonWrapperMargins.trailingAnchor).isActive = true
        buttonStack.topAnchor.constraint(equalTo: buttonWrapperMargins.topAnchor, constant: 20).isActive = true
        buttonStack.bottomAnchor.constraint(equalTo: buttonWrapperMargins.bottomAnchor, constant: -20).isActive = true
        buttonStack.axis = .vertical
        buttonStack.alignment = .center
        buttonStack.distribution = .fillEqually
    }

    public func addButton(named title: String, action: Selector?, tinted color: UIColor = .black) -> UIButton {
        let newButton = UIButton()
        newButton.setTitleColor(color, for: .normal)
        newButton.setTitle(title, for: .normal)
        if let action = action {
            newButton.addTarget(self, action: action, for: .touchUpInside)
        }
        self.buttonStack.addArrangedSubview(newButton)
        return newButton
    }

    public func hideButtons() {
        self.bottomRightView.isHidden = true
    }

}

