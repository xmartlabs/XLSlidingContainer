//
//  SlidingContainerViewController.swift
//  SlidingContainer
//
//  Copyright (c) 2017 Xmartlabs ( http://xmartlabs.com )
//
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

import UIKit

public enum MovementType {

    case push
    case hideUpperPushLower

}

public protocol ContainedViewController {

    func didMinimizeControllerWith(diff: CGFloat)

    func didMaximizeControllerWith(diff: CGFloat)

    func updateFrameFor(heightPercentaje yPct: CGFloat, absolute diff: CGFloat)

    var viewController: UIViewController { get }

}

public extension ContainedViewController where Self: UIViewController {

    public var viewController: UIViewController {
        return self
    }

    func didMinimizeControllerWith(diff: CGFloat) {}

    func didMaximizeControllerWith(diff: CGFloat) {}

    func updateFrameFor(heightPercentaje yPct: CGFloat, absolute diff: CGFloat) {}

}

public protocol SlidingContainerPresenter: class {

    var movementType: MovementType { get }

    func lowerController(for slidingContainer: SlidingContainerViewController) -> ContainedViewController

    func upperController(for slidingContainer: SlidingContainerViewController) -> ContainedViewController

    func upperViewMinHeight(for slidingContainer: SlidingContainerViewController) -> CGFloat

    func lowerViewMinHeight(for slidingContainer: SlidingContainerViewController) -> CGFloat

    func upperExtraDraggableArea(for slidingContainer: SlidingContainerViewController) -> CGFloat

    func lowerExtraDraggableArea(for slidingContainer: SlidingContainerViewController) -> CGFloat

}

public extension SlidingContainerPresenter {

    func lowerViewMinHeight(for slidingContainer: SlidingContainerViewController) -> CGFloat {
        return (slidingContainer.navView?.frame.height ?? 0) / 5
    }

    func upperViewMinHeight(for slidingContainer: SlidingContainerViewController) -> CGFloat {
        return (slidingContainer.navView?.frame.height ?? 0) / 4
    }

    func upperExtraDraggableArea(for slidingContainer: SlidingContainerViewController) -> CGFloat {
        return 15.0
    }

    func lowerExtraDraggableArea(for slidingContainer: SlidingContainerViewController) -> CGFloat {
        return 15.0
    }
}

public protocol SlidingContainerDelegate: class {

    func slidingContainerDidBeginDrag(_ slidingContainer: SlidingContainerViewController)

    func slidingContainerDidEndDrag(_ slidingContainer: SlidingContainerViewController)

}

public extension SlidingContainerDelegate {

    func slidingContainerDidBeginDrag(_ slidingContainer: SlidingContainerViewController) {}

    func slidingContainerDidEndDrag(_ slidingContainer: SlidingContainerViewController) {}

}

open class SlidingContainerViewController: UIViewController, UIGestureRecognizerDelegate {

    static open let velTreshHold = 4000.0

    @IBOutlet open weak var dragView: UIView?

    @IBOutlet open weak var navView: UIView?

    public weak var presenter: SlidingContainerPresenter!

    public weak var delegate: SlidingContainerDelegate!

    private var upperController: ContainedViewController!

    private var lowerController: ContainedViewController!

    private let upperView: UIView = UIView()

    private let lowerView: UIView = UIView()

    private var panDirection: Int = 0

    private var initialPositionSetUp = false

    private var isDragging = false

    private var lastChange = 0.0

    private var dragHeight: CGFloat {
        return dragView?.frame.height ?? 42
    }

    open override func viewDidLoad() {
        super.viewDidLoad()

        upperController = presenter.upperController(for: self)
        lowerController = presenter.lowerController(for: self)

        addChildViewController(upperController.viewController)
        addChildViewController(lowerController.viewController)

        navView = navView ?? view

        let dView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 42))
        dView.backgroundColor = .darkGray
        dragView = dragView ?? dView

        navView?.addSubview(upperView)
        navView?.addSubview(dragView!)
        navView?.addSubview(lowerView)

        upperView.addSubview(upperController.viewController.view)
        lowerView.addSubview(lowerController.viewController.view)

        lowerController.didMinimizeControllerWith(diff: getMovementDifference())
        upperController.didMaximizeControllerWith(diff: getMovementDifference())

        lowerController.viewController.didMove(toParentViewController: self)
        upperController.viewController.didMove(toParentViewController: self)

        let panGesture = UIPanGestureRecognizer(
            target: self,
            action: #selector(self.panDragView(sender:))
        )
        panGesture.delegate = self
        panGesture.delaysTouchesBegan = false
        panGesture.delaysTouchesEnded = false
        panGesture.cancelsTouchesInView = false
        navView?.addGestureRecognizer(panGesture)
    }

    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if !initialPositionSetUp {
            initialPositionSetUp = true
            drawViews()
        }
        lowerController.viewController.view.frame = frameForLowerController()
        upperController.viewController.view.frame = frameForUpperController()
    }

    private func getMovementDifference() -> CGFloat {
        guard let navView = navView else { return 0 }
        let diff = navView.frame.height - presenter.upperViewMinHeight(for: self) - presenter.lowerViewMinHeight(for: self) - (dragView?.frame.height ?? 42)
        return diff
    }

    // MARK: Frame Management

    private func drawViews() {
        guard let navView = navView else { return }
        let navHeight = navView.frame.height
        let navWidth = navView.frame.width
        let middle = CGRect(
            x: 0,
            y: navHeight - presenter.lowerViewMinHeight(for: self) - dragHeight,
            width: navWidth,
            height: dragHeight
        )
        let upper = CGRect(
            x: 0,
            y: 0,
            width: navWidth,
            height: navHeight - presenter.lowerViewMinHeight(for: self) - dragHeight
        )
        let lower = CGRect(
            x: 0,
            y: navHeight - presenter.lowerViewMinHeight(for: self),
            width: navWidth,
            height: presenter.lowerViewMinHeight(for: self)
        )

        upperView.frame = upper
        dragView?.frame = middle
        lowerView.frame = lower
    }

    private func frameForLowerController() -> CGRect {
        let lower = CGRect(
            x: 0,
            y: 0,
            width: lowerView.frame.width,
            height: lowerView.frame.height
        )
        return lower
    }

    private func frameForUpperController() -> CGRect {
        let upper = CGRect(
            x: 0,
            y: 0,
            width: upperView.frame.width,
            height: upperView.frame.height
        )
        return upper
    }

    private func updateViews(with translation: CGPoint, forState state: UIGestureRecognizerState) {
        var f0 = dragView?.frame ?? .zero
        var f1 = upperView.frame
        var f2 = lowerView.frame

        switch presenter.movementType {
        case .hideUpperPushLower:
            if state == .ended {
                if shouldHideBottomView() {
                    f2.size.height = presenter.lowerViewMinHeight(for: self)
                    f2.origin.y = (navView?.frame.height ?? 0) - presenter.lowerViewMinHeight(for: self)
                    f0.origin.y = f2.origin.y - f0.size.height
                    f1.size.height = f0.origin.y
                } else {
                    f1.size.height = presenter.upperViewMinHeight(for: self)
                    f0.origin.y = f1.origin.y + f1.size.height
                    f2.size.height = (navView?.frame.height ?? 0) - f0.size.height - presenter.upperViewMinHeight(for: self)
                    f2.origin.y = f0.origin.y + f0.size.height
                }
            } else {
                f1.size.height += translation.y
                f0.origin.y += translation.y
                f2.size.height -= translation.y
                f2.origin.y += translation.y
            }
        case .push:
            if state == .ended {
                if shouldHideBottomView() {
                    f2.size.height = presenter.lowerViewMinHeight(for: self)
                    f2.origin.y = (navView?.frame.height ?? 0) - presenter.lowerViewMinHeight(for: self)
                    f0.origin.y = f2.origin.y - f0.size.height
                    f1.origin.y = 0
                } else {
                    f1.origin.y = presenter.upperViewMinHeight(for: self) - f1.size.height
                    f0.origin.y = f1.origin.y + f1.size.height
                    f2.origin.y = f0.origin.y + f0.size.height
                    f2.size.height = (navView?.frame.height ?? 0) - f0.size.height - presenter.upperViewMinHeight(for: self)
                }
            } else {
                f1.origin.y += translation.y
                f0.origin.y += translation.y
                f2.size.height -= translation.y
                f2.origin.y += translation.y
            }
        }

        lowerView.frame = f2
        upperView.frame = f1
        dragView?.frame = f0

        lowerController.viewController.view.frame = frameForLowerController()
        upperController.viewController.view.frame = frameForUpperController()
    }

    private func shouldHideBottomView() -> Bool {
        guard let navHeight = navView?.frame.height else {
            return false
        }
        return panDirection > 0 || (panDirection == 0 && ((dragView?.frame.origin.y ?? 0) > 0.5 * navHeight))
    }

    func panDragView(sender: UIPanGestureRecognizer) {
        let location = sender.location(in: navView)
        var frame = dragView?.frame ?? .zero

        if sender.state == .began {
            frame.origin.y = max(frame.origin.y - presenter.upperExtraDraggableArea(for: self), 0)
            frame.size.height = frame.size.height + presenter.lowerExtraDraggableArea(for: self) + presenter.upperExtraDraggableArea(for: self)
        }

        if sender.state == .changed {
            lastChange = Double(CFAbsoluteTimeGetCurrent())
        }

        var dy = sender.translation(in: navView)
        sender.setTranslation(.zero, in: navView)

        guard frame.contains(location) || isDragging else {
            return
        }

        if !isDragging {
            isDragging = true
            delegate.slidingContainerDidEndDrag(self)
        }

        if sender.state == .ended {
            let curTime = Double(CFAbsoluteTimeGetCurrent())
            let timeElapsed = curTime - lastChange
            var velocity = abs(Double(panDirection)) / timeElapsed
            velocity = velocity > SlidingContainerViewController.velTreshHold ? SlidingContainerViewController.velTreshHold : velocity
            var realVelocity = Double(velocity / SlidingContainerViewController.velTreshHold)
            realVelocity = realVelocity < 0.1 ? 0.1 : realVelocity

            isDragging = false
            delegate.slidingContainerDidEndDrag(self)

            let actualPos = lowerView.frame.origin.y
            let lowerContDiff = (navView?.frame.height ?? 0) - presenter.lowerViewMinHeight(for: self) - actualPos
            let upperContDif = actualPos - presenter.upperViewMinHeight(for: self) - (dragView?.frame.height ?? 42)

            if
                let navHeight = navView?.frame.height,
                panDirection > 0 || (panDirection == 0 && (dragView?.frame.origin.y ?? 0) > 0.5 * navHeight)
            {
                let speed = 0.9 - (realVelocity / 2)
                UIView.animate(
                    withDuration: speed,
                    delay: 0.0,
                    usingSpringWithDamping: CGFloat(speed),
                    initialSpringVelocity: 1.0,
                    options: .curveEaseInOut,
                    animations: { [weak self] in
                        guard let `self` = self else { return }
                        self.updateViews(with: dy, forState: sender.state)
                        self.upperController.didMaximizeControllerWith(diff: lowerContDiff)
                        self.lowerController.didMinimizeControllerWith(diff: lowerContDiff)
                    },
                    completion: nil
                )
            } else {
                let speed = 0.9 - (realVelocity / 2)
                UIView.animate(
                    withDuration: speed,
                    delay: 0.0,
                    usingSpringWithDamping: CGFloat(speed),
                    initialSpringVelocity: 1.0,
                    options: .curveEaseInOut,
                    animations: { [weak self] in
                        guard let `self` = self else { return }
                        self.updateViews(with: dy, forState: sender.state)
                        self.lowerController.didMaximizeControllerWith(diff: upperContDif)
                        self.upperController.didMinimizeControllerWith(diff: upperContDif)
                    },
                    completion: nil
                )
            }
            return
        }

        if dy.y > 0 {
            let xx = (navView?.frame.height ?? 0) - lowerView.frame.origin.y + dy.y
            if xx <= presenter.lowerViewMinHeight(for: self) {
                dy.y = (navView?.frame.height ?? 0) - lowerView.frame.origin.y - presenter.lowerViewMinHeight(for: self)

            }
        } else if upperView.frame.origin.y + upperView.frame.height + dy.y <= presenter.upperViewMinHeight(for: self) {
            dy.y = presenter.upperViewMinHeight(for: self) - upperView.frame.height - upperView.frame.origin.y
        }

        updateViews(with: dy, forState: sender.state)

        let first = (dragView?.frame.origin.y ?? 0) - presenter.upperViewMinHeight(for: self)
        let second = (navView?.frame.height ?? 0) - presenter.upperViewMinHeight(for: self) - presenter.lowerViewMinHeight(for: self) - (dragView?.frame.height ?? 42)
        let yPct = 100 * (first / second)
        upperController.updateFrameFor(heightPercentaje: yPct, absolute: dy.y)
        lowerController.updateFrameFor(heightPercentaje: 100 - yPct, absolute: dy.y)

        panDirection = Int(dy.y)
    }

    private func reloadLowerViewController() {
        lowerController.viewController.willMove(toParentViewController: nil)
        lowerView.removeFromSuperview()
        lowerController.viewController.removeFromParentViewController()

        lowerController = presenter.lowerController(for: self)
        addChildViewController(lowerController.viewController)
        lowerView.addSubview(lowerController.viewController.view)
        lowerController.didMinimizeControllerWith(diff: getMovementDifference())
    }

    private func reloadUpperViewController() {
        upperController.viewController.willMove(toParentViewController: nil)
        upperView.removeFromSuperview()
        upperController.viewController.removeFromParentViewController()
        
        upperController = presenter.upperController(for: self)
        addChildViewController(upperController.viewController)
        upperView.addSubview(upperController.viewController.view)
        upperController.didMinimizeControllerWith(diff: getMovementDifference())
    }
    
    open func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
