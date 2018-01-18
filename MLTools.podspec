Pod::Spec.new do |s|

  s.name         = "MLTools"
  s.version      = "0.0.1"
  s.summary      = "多标签"
  s.description  = <<-DESC
                    MLTools is mainly contains a tool to create autolayout labels,多标签自动布局,目前只支持两行
                   DESC

  s.homepage     = "https://github.com/Pangmanli1"
  s.license      = "MIT"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Pangmanli1" => "530912338@qq.com" }
  s.social_media_url   = "https://weibo.com/u/2145247131"

  s.platform     = :ios
  s.source       = { :git => "https://github.com/Pangmanli1/legendaryTools.git", :tag => "0.0.1" }

  s.source_files  = 'MLTools/MLTools/Tools/*.{h,m}'
  s.requires_arc = true


end
