
Pod::Spec.new do |spec|
  spec.name         = 'iOS_Category'
  spec.version      = '1.0.0'
  spec.license      = ""
  spec.homepage     = 'https://github.com/zhanglexiaoge/ZLTest.git'
  spec.authors      = { 'zl' => '759908500@qq.com' }
  spec.summary      = 'ARC and GCD Compatible Reachability Class for iOS and OS X.'
  spec.source       = { :git => 'https://github.com/zhanglexiaoge/ZLTest.git', :tag => 'v1.0.0' }
  spec.source_files = 'Sanbox/Sanbox/Classes/*.{h,m}'
  spec.framework    = 'UIKit'
  spec.osx.framework  = 'AppKit'
  spec.ios.deployment_target  = '9.0'
  spec.osx.deployment_target  = '10.10'
end