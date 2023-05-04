# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

source 'https://cdn.cocoapods.org/'

# 集成React native配置
require_relative '../node_modules/react-native/scripts/react_native_pods'
require_relative '../node_modules/@react-native-community/cli-platform-ios/native_modules'


target 'xxshop' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # 集成React native配置
  config = use_native_modules!
  use_react_native!(:path => config["reactNativePath"])

  pod 'Masonry', '1.1.0'
end
