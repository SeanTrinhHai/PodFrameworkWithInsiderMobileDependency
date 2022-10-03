Pod::Spec.new do |s|
  s.name             = 'SDKWithVungle'
  s.version          = '1.0.0'
  s.summary          = 'summary'
  s.description      = <<-DESC
description
                       DESC
  s.homepage         = 'https://homepage.com'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'SDKWithVungle' => 'SDKWithVungle' }
  s.source           = { :git => 'git@github.com:bryanboyko/PodFrameworkWithVungleDependency.git', :tag => s.version.to_s }
  s.swift_version    = "4.0"

  s.requires_arc     = true
  s.platform         = :ios, '11.0'
  s.static_framework = true

  s.subspec 'InsiderMobile' do |d|
    d.dependency 'InsiderMobile', '11.0'
    d.source_files = ['SDKWithVungle/UmbrellaHeader/*.{h,m,swift}']
    d.source_files = ['SDKWithVungle/ThirdParty/*.swift', 'SDKWithVungle/ThirdParty/Vungle/**/*']
    d.xcconfig = { 'SWIFT_INCLUDE_PATHS' => '$(PODS_TARGET_SRCROOT)/SDKWithVungle/ThirdParty/Vungle/ModuleMap' }
    d.preserve_paths = 'SDKWithVungle/ThirdParty/Vungle/ModuleMap/module.modulemap'
  end

end
