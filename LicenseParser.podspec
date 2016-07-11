#
# Be sure to run `pod lib lint LicenseParser.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "LicenseParser"
  s.version          = "0.5.6"
  s.summary          = "Driver's License Parser for US Licenses implementing the AAMVA PDF-417 standard."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Easily parse the information within PDF-417 barcodes found on the back of
  US and Canadian driver's licenses adhering to the AAMVA Version 8
  standard.
                       DESC

  s.homepage         = "https://github.com/sealz/license-parser"
  s.license          = 'MIT'
  s.author           = { "Clayton LZ" => "clayton@hauz.io" }
  s.source           = { :git => "https://github.com/sealz/license-parser.git", :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.source_files = 'LicenseParser/Classes/**/*'
end
