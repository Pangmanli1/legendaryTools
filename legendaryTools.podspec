

Pod::Spec.new do |s|

  s.name         = "legendaryTools"
  s.version      = '0.0.2'
  s.summary      = "A set of tools for OC programming."

  s.homepage     = "https://github.com/Pangmanli1"
  s.license      = "MIT"
  s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  s.author             = { "Pangmanli1" => "530912338@qq.com" }
  s.social_media_url   = "https://weibo.com/u/2145247131"

  s.platform     = :ios
  s.source       = { :git => "https://github.com/Pangmanli1/legendaryTools.git", :tag => "0.0.2" }

  s.source_files  = "MLTools/MLTools/selectView/*.{h，m}"
  s.requires_arc = true

end
