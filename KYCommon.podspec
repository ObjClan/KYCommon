Pod::Spec.new do |s|

  s.name         = "KYCommon"
  s.version      = "1.0.4"
  s.summary      = "KYCommon"
  s.description  = <<-DESC
                   该库封装常用工具类
                   DESC
  #开启ARC
  s.requires_arc = true
  s.platform     = :ios, "9.0"
  s.ios.deployment_target = '9.0'

  s.homepage     = "https://github.com/ObjClan/KYCommon"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author             = { "ObjClan" => "ObjClan@gmail.com" }
  s.source       = { :svn => 'https://github.com/ObjClan/KYCommon.git', :tag => "#{s.version}" }
  #支持的框架
  s.frameworks   = "UIKit", "Foundation", "CoreTelephony"
  s.library      = 'z', 'c++'
  #依赖第三方库
  s.dependency   'FCUUID', '~> 1.3.1'
  s.dependency   'UICKeyChainStore', '~> 2.1.2'
  s.dependency   'Reachability','~> 3.2'
  s.pod_target_xcconfig = { "HEADER_SEARCH_PATHS" => "${PODS_ROOT}/Headers/Public/KYCommon/**"}

  s.source_files = 'KYCommon/Classes/*'
  s.subspec 'Category' do |ss|   
    ss.source_files = 'KYCommon/Classes/Category/*'
    ss.subspec 'NSObject' do |sss| 
      sss.source_files = 'KYCommon/Classes/Category/NSObject/*'
    end
    ss.subspec 'UIKit' do |sss| 
      sss.source_files = 'KYCommon/Classes/Category/UIKit/*'
    end
  end

  spec.resources = ["KYCommon/Classes/Resource/*.plist"]
end
