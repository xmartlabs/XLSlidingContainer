#XLSlidingContainer
-----------

XLSlidingContainer is a Custom Container Controller that embeds two independent ViewControllers at the same time. One appears at the top half of the screen (we call it upper) and the other shows at the bottom one(lower). In the middle there is a bar that separates them and that can be dragged up and down to maximize or minimize each of the controllers.
When the bar is dragged up the upper ViewController will minimize and the lower one will maximize. When it is dragged down it behaves the other way around. 

The embedded controllers have to conform to the XLSliderController protocol to be informed of changes to their display size. This might be of interest to them as they might want to change their appearance and layout when that happens.

XLSliderViewController has a datasource and a delegate property. After instantiating this custom controller a datasource -from where the subcontrollers will be retrieved- must be set. The datasource must also define the type of movement the dragbar should behave like. Optionally you can change the Dragbar implementing the function "getDragView" as shown in the "HideUpper" example.

The delegate is optional and should just be set to change the proportions each subcontroller get.

For customization reasons there is a view outlet (called navView) in the XLSliderViewController that can be linked to a view if you are working on a storyboard. Otherwise the root view of the controller is used. With this feature it is possible to change the margins of the main view. 

####Movement types
Currently there are two movements predefined in XLSlidingContainer which are XLSliderMovementTypePush and XLSliderMovementTypeHideUpperPushLower; both push the lower view out of screen while one hides the upper view and the other pushes it.
To create a movement that hides the lower view look at the "Instagramlike" example which sets the contentOffset property of its view to scroll up and down according to the Dragbars move.

#####Screenshot of an example using XLSlidingContainer
![Screenshot of Example](Slider/images/XLSliderDemo.gif)

##Examples

####Instagramlike

This example works in a similar way to the Instagram App where you have images in one controller at the bottom of the screen and another controller at the top of the screen.
This In this case we show static images (flags) in the lower ViewController and a ScrollView image in the upper view.
The Dragbar's behavior is defined to hide the lower view and to push the upper view out of screen when they get minimized.
In fact the ViewController at the bottom of the screen is a CollectionViewController and therefore we define custom CollectionViewLayout and CollectionViewCell classes.

####HideUpper

This example shows another behavior for the Dragbar. In this case the lower ViewController gets pushed out of screen while the upper ViewController hides when minimized.
Here we have a navigation Controller embedded at the top and the same ScrollViewController from the previous example at the bottom.
The root ViewController of the navigation Controller has a simple static Tableview whose rows are country and clicking on them will produce a segue to another controller containing the flag of the country.

Installation
-------------

The easiest way to use `XLSlidingContainer` in your app is via [CocoaPods](http://cocoapods.org/ "CocoaPods").

1. Add the following line in the project's Podfile file:
`pod 'XLSlidingContainer', '~> 1.0.0'`.
2. Run the command `pod install` from the Podfile folder directory.


Customization
--------------

The most interesting customizable features are:

* You can change the margins of the main view by linking the "navView" property to a view in your Storyboard.
* The minimum space each controller gets.
* The behavior of the controllers when their layout changes.
* The appearance of the Dragbar.



Requirements
-------------

* iOS 7.0 and above
* ARC


Release Notes
--------------

Version 1.0.0 (cocoaPod)

* Initial release


Contributors
-------------
* Mathias Claassen  [mathias@xmartlabs.com](mailto:mathias@xmartlabs.com)
* Santiago Fernandez - [@\_\_pera\_\_](http://twitter.com/__pera__)


XLSlidingContainer was inspired by [Instagram](https://itunes.apple.com/EN/app/instagram/id389801252?mt=8) app.

Contact
--------

Any suggestion or question? Please create a Github issue or reach us out.

[xmartlabs.com](http://xmartlabs.com).
[@xmartlabs](http://twitter.com/xmartlabs "@xmartlabs")
