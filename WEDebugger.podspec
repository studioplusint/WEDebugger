Pod::Spec.new do |s|
  s.name         = "WEDebugger"
  s.version      = "0.0.1"
  s.summary      = "Light weight debugger tool."

  s.description  = "Simple and light weight debugger tool which display session logs."

  s.homepage     = "https://github.com/Ekhoo/WEDebugger"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Lucas Ortis" => "me@lucas-ortis.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/Ekhoo/WEDebugger.git", :tag => s.version.to_s }
  s.source_files = "Source/*.{h,m}"
  s.requires_arc = true
  s.dependency "Masonry", "~> 0.6.4"
end
