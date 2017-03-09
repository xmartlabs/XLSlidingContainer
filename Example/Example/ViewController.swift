//
//  ViewController.swift
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
import SlidingContainer

class ViewController: SlidingContainerViewController, SlidingContainerDelegate, SlidingContainerPresenter {

    override func viewDidLoad() {
        presenter = self
        delegate = self
        dragView = Bundle.main.loadNibNamed("DragView", owner: self, options: nil)?.first as? UIView

        super.viewDidLoad()
    }

    let movementType: MovementType = .push

    func lowerController(for slidingContainer: SlidingContainerViewController) -> ContainedViewController {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.itemSize = CGSize(width: 90, height: 60)
        collectionViewLayout.scrollDirection = .vertical
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 15, left: 10, bottom: 15, right: 10)
        collectionViewLayout.minimumLineSpacing = 15
        let controller = CollectionViewController(collectionViewLayout:collectionViewLayout)
        return controller
    }

    func upperController(for slidingContainer: SlidingContainerViewController) -> ContainedViewController {
        let viewController = ScrollViewController()
        return viewController
    }

}
