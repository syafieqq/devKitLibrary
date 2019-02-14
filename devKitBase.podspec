Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '10.0'
s.name = "devKitBase"
s.summary = "devKitBase lets a user use basic function, such as call, message, email, basic alert etc."
s.requires_arc = true

# 2
s.version = "0.2.1"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "Megat Syafiq" => "syafiqq95@gmail.com" }

# 5 - Replace this URL with your own GitHub page's URL (from the address bar)
s.homepage = "https://github.com/syafieqq/devKitLibrary"

# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/syafieqq/devKitLibrary.git",
:tag => "#{s.version}" }

# 7
s.framework = "UIKit"
s.dependency 'Alamofire'
s.dependency 'SDWebImage'
s.dependency 'Material'
s.dependency 'ReachabilitySwift'
s.dependency 'IQKeyboardManager'
s.dependency 'lottie-ios'
s.dependency 'SwiftyJSON'
s.dependency 'NVActivityIndicatorView'

# 8
s.source_files = "devKitbase/**/*.{swift}"

# 9
s.resources = "devKitBase/**/*.{png,jpeg,jpg,otf,ttf}"

# 10
s.swift_version = "4.2"

end
