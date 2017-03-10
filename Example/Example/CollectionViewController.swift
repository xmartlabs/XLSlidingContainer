//
//  CollectionViewController.swift
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

class CollectionViewController: UICollectionViewController, ContainedViewController {

    let reuseIdentifier = "Cell"

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(
            MyImageCollectionViewCell.self,
            forCellWithReuseIdentifier: reuseIdentifier
        )
    }

    func didMinimizeControllerWith(diff: CGFloat) {
        view.alpha = 0.3
        let currentOffset = collectionView!.contentOffset.y
        collectionView!
            .setContentOffset(
                CGPoint(
                    x: 0,
                    y: min(
                        diff + currentOffset,
                        max(
                            0,
                            collectionView!.contentSize.height - view.frame.size.height
                    )
                )),
                animated: false)
    }

    func didMaximizeControllerWith(diff: CGFloat) {
        view.alpha = 1.0
        let currentOffset = collectionView!.contentOffset.y
        collectionView!
            .setContentOffset(
                CGPoint(
                    x: 0,
                    y: max(0, currentOffset - diff)),
                animated: false
        )
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
        ) -> Int {
        return 24
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
        ) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: reuseIdentifier,
                for: indexPath
            ) as? MyImageCollectionViewCell
            else { return UICollectionViewCell() }
        let image = UIImage(named: "flag_\(indexPath.item)")!
        cell.setImage(image: image)

        return cell
    }

}
