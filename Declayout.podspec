Pod::Spec.new do |spec|

  spec.name         = "Declayout"
  spec.version      = "1.2.0"
  spec.summary      = "Write simple and declarative-ish Auto Layout constraints with Swift."
  spec.homepage     = "https://github.com/overheardswift/Declayout"
  spec.license      = "MIT"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Bayu Kurniawan" => "bayu@overheardswift.com" }
  spec.social_media_url   = "https://twitter.com/overheardswift"
  spec.platform     = :ios
  spec.ios.deployment_target = "11.0"
  spec.swift_version = "5.0"
  spec.source       = { :git => "https://github.com/overheardswift/Declayout.git", :tag => "#{spec.version}" }
  spec.source_files  = "Declayout/**/*.swift"

end
