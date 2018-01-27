# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Singapore PSI' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Singapore PSI

  pod 'HandyJSON','4.0.0-beta.1'
  pod 'Alamofire'
  pod 'ARSLineProgress'
  pod 'GoogleMaps'
  
end

def testing_pods
    pod 'Quick'
    pod 'Nimble'
end

target 'SingaporePSITests' do
    use_frameworks!
    inherit! :search_paths

    testing_pods
    pod 'HandyJSON','4.0.0-beta.1'

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        if target.name == 'Quick' || target.name == 'Nimble'
            print "Changing Quick swift version to 3.2\n"
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '3.2'
            end
        end
    end
end
