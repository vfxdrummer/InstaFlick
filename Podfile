platform :ios, '9.0'

project './InstaFlick/InstaFlick.xcodeproj'

def myPods
  use_frameworks!
  pod 'SDWebImage'
  pod 'RDImageViewerController', '1.0.2'
  
  # JSON / Networking
  source 'https://github.com/CocoaPods/Specs.git'
  use_frameworks!
  pod 'Alamofire'
  pod 'SwiftyJSON'  
use_frameworks!

end

target 'InstaFlick' do
  myPods
end
target 'InstaFlickTests' do
  myPods
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['ENABLE_BITCODE'] = 'NO'
    end
  end
end
