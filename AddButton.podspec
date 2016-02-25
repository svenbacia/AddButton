#
# Be sure to run `pod lib lint AddButton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "AddButton"
  s.version          = "0.1.0"
  s.summary          = "AddButton is a simple button which has two states. One will display an add sign, the other a checkmark."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description      = <<-DESC
  AddButton is a simple UIButton which can be used in situations where an item can be added to a collection for example. The button has two states. One displays an add sign the other a checkmark.
                       DESC

  s.homepage         = "https://github.com/svenbacia/AddButton"
  s.license          = 'MIT'
  s.author           = { "Sven Bacia" => "sven.bacia@gmail.com" }
  s.source           = { :git => "https://github.com/svenbacia/AddButton.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/svenbacia'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'AddButton' => ['Pod/Assets/*.png']
  }
end
