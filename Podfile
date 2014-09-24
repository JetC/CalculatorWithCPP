platform :ios, '7.0'
pod 'UMengAnalytics',    '~> 3.1.2'
pod 'hpple',             '~> 0.2.0'
pod 'ParseKit',          '~> 0.7'
pod 'UIImage+Additions', '~> 1.1.0'
pod 'UIImageEffects',    '~> 0.0.1'
pod 'MTMigration',       '~> 0.0.3'
pod 'iOS-blur',          '~> 0.0.5'
pod 'RegExCategories',   '~> 1.0'
pod 'LMAlertView',       '~> 1.1.0'
pod 'SDWebImage',        '~> 3.7.1'
pod 'RBStoryboardLink',  '~> 0.1.0'
pod 'OCMock',            '~> 3.0.2'
pod 'Reveal-iOS-SDK',    '~> 1.0.4'

inhibit_all_warnings!

post_install do |installer|
  default_library = installer.libraries.detect { |i| i.target_definition.name == 'Pods' }
  config_file_path = default_library.library.xcconfig_path

  File.open("config.tmp", "w") do |io|
    io << File.read(config_file_path).gsub(/-licucore/, '')
  end

  FileUtils.mv("config.tmp", config_file_path)
end
