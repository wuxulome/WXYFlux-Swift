#
# Be sure to run `pod lib lint WXYFlux-Swift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "WXYFlux-Swift"
  s.version          = "0.0.1"
  s.summary          = " "

  s.description      = " "

  s.homepage         = "https://github.com/wuxulome/WXYFlux-Swift.git"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "wuxu" => "wuxulome@gmail.com" }
  s.source           = { :git => "https://github.com/wuxulome/WXYFlux-Swift.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.ios.deployment_target = "8.0"
  s.requires_arc = true

  s.source_files = 'WXYFlux-Swift/*.{h,m}'

  s.frameworks = 'Foundation'
  
end
