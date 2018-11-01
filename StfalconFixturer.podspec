  Pod::Spec.new do |s|

  s.platform = :ios
  s.ios.deployment_target = '12.0'
  s.name = "StfalconFixturer"
  s.summary = "A simple light-weight way to add autofilling fixtures to UITextFields debug."
  s.requires_arc = true

  s.version = "0.1.0"
  s.license = { :type => "Apache License, Version 2.0", :file => "LICENSE" }
  s.author = { "Alex Frankiv" => "oleksandr.frankiv@stfalcon.com" }
  s.homepage = "https://github.com/stfalcon-studio/StfalconFixturer-ios"
  s.source = { :git => "https://github.com/stfalcon-studio/StfalconFixturer-ios.git",
               :tag => "#{s.version}" }

  s.framework = "UIKit"

  s.source_files = "StfalconFixturer/**/*.{swift}"
  s.resources = "StfalconFixturer/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}"

  s.swift_version = "4.2"

  end
