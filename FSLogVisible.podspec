Pod::Spec.new do |s|
  s.name         = "FSLogVisible"
  s.version      = "0.0.1"
  s.summary      = "A short description of FSLogVisible."
  s.description  = <<-DESC
	将视图转化为图片的工具类,a tool to change UIView to Image.
                   DESC

  s.license      = "MIT (example)"
  s.author             = { "fudongdong" => "1245102331@qq.com" }
  s.platform     = :ios, "8.0"
  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.requires_arc = true

end
