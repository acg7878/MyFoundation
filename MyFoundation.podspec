Pod::Spec.new do |s|
  s.name         = 'MyFoundation'
  s.version      = '0.1.0'
  s.summary      = 'My iOS Foundation library'
  s.description  = 'A collection of useful utilities and macros for iOS development'

  s.homepage     = 'https://github.com/yourusername/MyFoundation'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Derek' => 'your.email@example.com' }
  s.source       = { :git => 'https://github.com/yourusername/MyFoundation.git', :tag => s.version.to_s }

  s.ios.deployment_target = '14.0'
  s.swift_version = '5.0'

  s.source_files = 'MyFoundation/**/*.{h,m,swift}'

  # 公开头文件设置方式一：使用 public_header_files 指定
  s.public_header_files = 'MyFoundation/KKMacros.h', 'MyFoundation/MyFoundation.h'

  # 公开头文件设置方式二：如果要公开所有头文件，可以注释掉上面的，使用下面的
  # s.public_header_files = 'MyFoundation/**/*.h'

  s.dependency 'YYModel'
end
