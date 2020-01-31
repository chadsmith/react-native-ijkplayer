require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name                = package['name']
  s.version             = package['version']
  s.summary             = package['description']
  s.homepage            = package['homepage']
  s.license             = package['license']
  s.author              = package['author']
  s.source              = { :git => 'git@github.com:chadsmith/react-native-ijkplayer.git', :tag => 'master' }

  s.requires_arc        = true
  s.platform            = :ios, '9.0'

  s.preserve_paths      = 'ios/**/*'
  s.source_files        = 'ios/**/*.{h,m}'
  s.libraries           = 'c', 'sqlite3', 'stdc++'
  s.framework           = 'AudioToolbox','AVFoundation', 'CoreAudio', 'CoreGraphics', 'CoreVideo', 'GLKit', 'VideoToolbox'
  s.ios.vendored_frameworks = 'ios/IJKMediaFrameworkWithSSL.framework'
  s.xcconfig            = { 'OTHER_LDFLAGS' => '-framework IJKMediaFrameworkWithSSL' }
  s.dependency          'React'
end
