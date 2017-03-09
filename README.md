# SlidingContainer

<p align="left">
<a href="https://travis-ci.org/xmartlabs/SlidingContainer"><img src="https://travis-ci.org/xmartlabs/SlidingContainer.svg?branch=master" alt="Build status" /></a>
<img src="https://img.shields.io/badge/platform-iOS-blue.svg?style=flat" alt="Platform iOS" />
<a href="https://developer.apple.com/swift"><img src="https://img.shields.io/badge/swift3-compatible-4BC51D.svg?style=flat" alt="Swift 3 compatible" /></a>
<a href="https://github.com/Carthage/Carthage"><img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat" alt="Carthage compatible" /></a>
<a href="https://cocoapods.org/pods/XLActionController"><img src="https://img.shields.io/cocoapods/v/SlidingContainer.svg" alt="CocoaPods compatible" /></a>
<a href="https://raw.githubusercontent.com/xmartlabs/SlidingContainer/master/LICENSE"><img src="http://img.shields.io/badge/license-MIT-blue.svg?style=flat" alt="License: MIT" /></a>
</p>

By [Xmartlabs SRL](http://xmartlabs.com).

## Introduction

XLSlidingContainer is a Custom Container Controller that embeds two independent ViewControllers at the same time. One appears at the top half of the screen (we call it upper) and the other shows at the bottom one(lower). In the middle there is a bar that separates them and that can be dragged up and down to maximize or minimize each of the controllers. When the bar is dragged up the upper ViewController will minimize and the lower one will maximize. When it is dragged down it behaves the other way around.

<img src="./example.gif" width="300"/>

## Usage
The embedded controllers have to conform to the ContainedViewController protocol to be informed of changes to their display size. This might be of interest to them as they might want to change their appearance and layout when that happens. These functions are optional but will surely be defined in most cases:
```swift
  func didMinimizeControllerWith(diff: CGFloat)

  func didMaximizeControllerWith(diff: CGFloat)

  func updateFrameFor(heightPercentaje yPct: CGFloat, absolute diff: CGFloat)
```

The parameter diff stands for the absolute amounts of points the dragbar moved from the previous call while the "y" parameter in the third function is the percentage of the position of the Dragbar. This percentage is 0 when the controller is minimized and 100 when the controller is maximized.

SliderViewController has a presenter and a delegate property. After instantiating this custom controller a presenter -from where the sub-controllers will be retrieved- must be set. Optionally you can change the Dragbar changing the `dragVar` property on the controller as shown in the examples.

For customization reasons there is a view outlet (called navView) in the XLSliderViewController that can be linked to a view if you are working on a storyboard. Otherwise the root view of the controller is used. With this feature it is possible to change the margins of the main view.

## Movement Types

Currently there are two movements predefined in MovementType which are `.push` and `.hideUpperPushLower` both push the lower view out of screen while the latter hides the upper view and the former pushes it.

## Requirements

* iOS 9.0+
* Xcode 8.0+

## Getting involved

* If you **want to contribute** please feel free to **submit pull requests**.
* If you **have a feature request** please **open an issue**.
* If you **found a bug** or **need help** please **check older issues, [FAQ](#faq) and threads on [StackOverflow](http://stackoverflow.com/questions/tagged/XLSlidingContainer) (Tag 'SlidingContainer') before submitting an issue.**.

Before contribute check the [CONTRIBUTING](https://github.com/xmartlabs/SlidingContainer/blob/master/CONTRIBUTING.md) file for more info.

If you use **SlidingContainer** in your app We would love to hear about it! Drop us a line on [twitter](https://twitter.com/xmartlabs).

## Examples

Follow these 3 steps to run Example project: Clone SlidingContainer repository, open SlidingContainer workspace and run the *Example* project.

You can also experiment and learn with the *SlidingContainer Playground* which is contained in *SlidingContainer.workspace*.

## Installation

#### CocoaPods

[CocoaPods](https://cocoapods.org/) is a dependency manager for Cocoa projects.

To install SlidingContainer, simply add the following line to your Podfile:

```ruby
pod 'XLSlidingContainer', '~> 2.0'
```

#### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a simple, decentralized dependency manager for Cocoa.

To install SlidingContainer, simply add the following line to your Cartfile:

```ogdl
github "xmartlabs/XLSlidingContainer" ~> 2.0
```

## Author

* [Xmartlabs SRL](https://github.com/xmartlabs) ([@xmartlabs](https://twitter.com/xmartlabs))


# Change Log

This can be found in the [CHANGELOG.md](CHANGELOG.md) file.
