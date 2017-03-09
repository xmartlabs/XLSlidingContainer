Pod::Spec.new do |s|
  s.name             = "XLSlidingContainer"
  s.version          = "2.0.0"
  s.summary          = "A short description of SlidingContainer."
  s.homepage         = "https://github.com/xmartlabs/XLSlidingContainer"
  s.license          = { type: 'MIT', file: 'LICENSE' }
  s.author           = { "Xmartlabs SRL" => "swift@xmartlabs.com" }
  s.source           = { git: "https://github.com/xmartlabs/SlidingContainer.git", tag: s.version.to_s }
  s.social_media_url = 'https://twitter.com/xmartlabs'
  s.ios.deployment_target = '9.0'
  s.requires_arc = true
  s.ios.source_files = 'SlidingContainer/Sources/**/*.{swift}'
  s.ios.frameworks = 'UIKit', 'Foundation'

end
