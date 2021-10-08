#
# Be sure to run `pod lib lint SwiftShareModule.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftShareModule'
  s.version          = '0.1.0'
  s.summary          = 'A short description of SwiftShareModule.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/2360219637/SwiftShareModule'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '2360219637' => 'chenzhichao.vip@bytedance.com' }
  s.source           = { :git => 'https://github.com/2360219637/SwiftShareModule.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.swift_version = "5.0"
  s.static_framework = true
  s.source_files = 'SwiftShareModule/Classes/**/*'
end
