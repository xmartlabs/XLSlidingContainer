Pod::Spec.new do |s|
  s.name         = "XLSlidingContainer"
  s.version      = "1.0.0"
  s.summary      = "Custom Container Controller to embed two independent sub controllers at the same time similar to the Instagram App."
  s.homepage     = "https://github.com/xmartlabs/XLSlidingContainer"
  s.license      = "MIT"
  s.authors            = { "Mathias Claassen" => "mathias@xmartlabs.com" , "Santiago Fernandez" => "santiagofm@xmartlabs.com"}
  s.social_media_url   = "http://twitter.com/xmartlabs"
  s.platform     = :ios, "7.0"
  s.source       = { :git => 'https://github.com/xmartlabs/XLSlidingContainer.git', :tag => 'v1.0.0' }
  s.source_files  = "XLSlidingContainer/*.{h,m}"
  s.ios.frameworks = 'UIKit', 'Foundation', 'CoreGraphics'
  s.requires_arc = true
end
