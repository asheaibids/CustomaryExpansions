#
# Be sure to run `pod lib lint customaryExpansions.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'customaryExpansions'
  s.version          = '0.6.0'
  s.summary          = 'Custom classes and extensions for iOS apps.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Tailored classes, extensions: tableview, collectionview, label, button, view, etc...
                       DESC

  s.homepage         = 'https://github.com/asheaibids/customaryExpansions'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'asheaibids' => 'a.sheaib@ids.com.lb' }
  s.source           = { :git => 'https://github.com/asheaibids/customaryExpansions.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

  s.source_files = 'Classes/**/*.swift'
  
  # s.resource_bundles = {
  #   'customaryExpansions' => ['customaryExpansions/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
    s.frameworks = 'UIKit'
    s.swift_versions = '4.0'
  # s.dependency 'AFNetworking', '~> 2.3'
end
