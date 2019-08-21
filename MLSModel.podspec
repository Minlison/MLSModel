
Pod::Spec.new do |s|

  s.name         = "MLSModel"
  s.version      = "1.0.0"
  s.summary      = "统一模型管理"
  s.description  = <<-DESC
                    统一管理模型，提供便捷方法
                   DESC

  s.homepage     = "http://www.minlison.cn"
  s.license      = "MIT"
  s.author       = { "Minlison" => "yuanhang.1991@163.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/Minlison/MLSModel.git", :tag => "v#{s.version}" }
  s.documentation_url = "https://minlison.cn/article/mlsmodel"
  s.requires_arc = true
  s.static_framework = true
  s.default_subspec = 'Core'
  
  s.subspec 'Core' do |ss|
    ss.source_files  = "Classes/Core/**/*.{h,m}"
    ss.public_header_files = "Classes/Core/**/*.h"
    ss.dependency 'MLSModel/MLSYYModelModify'
  end
  s.subspec 'MLSYYModelModify' do |ss|
    ss.source_files  = "Classes/YYModelModify/**/*.{h,m}"
    ss.public_header_files = "Classes/YYModelModify/**/NSObject+MLSYYModel.h"
    
  end
#  s.subspec 'Mock' do |ss|
#    ss.source_files  = "Classes/Mock/**/*.{h,m}"
#    ss.public_header_files = "Classes/Mock/**/*.h"
#  end
end
