Pod::Spec.new do |s|
  s.name         = "FSViewToImage"
  s.version      = "0.0.2"
  s.summary      = "FSViewToImage,make view to image"
  s.homepage         = 'https://github.com/fuchina/FSViewToImage'
  s.description  = <<-DESC
	将视图转化为图片的工具类,a tool to change UIView to Image.
                   DESC

  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author             = { "fudongdong" => "1245102331@qq.com" }
  s.platform     = :ios, "8.0"
  s.source           = { :git => 'https://github.com/fuchina/FSViewToImage.git', :tag => s.version.to_s }
  s.source_files = 'FSViewToImage/Classes/*'
  s.requires_arc = true
  s.frameworks = 'UIKit'

end
