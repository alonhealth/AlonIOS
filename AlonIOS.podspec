Pod::Spec.new do |s|
  s.name             = 'AlonIOS'
  s.version          = '1.0.0'
  s.summary          = 'An SDK to retrieve Apple Health data.'
  s.description      = 'Alon iOS SDK to retrieve Apple Health data'
  s.homepage         = 'https://github.com/alonhealth/AlonIOS'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Lucas Gaston Lober Boeris' => 'lucaslober@gmail.com' }
  s.source           = { :git => 'https://github.com/alonhealth/AlonIOS.git', :tag => s.version.to_s }
  s.ios.deployment_target = '13.4'
  s.source_files     = '**/*.{swift,h,m}'
  s.frameworks       = 'HealthKit'
  s.swift_version    = '5.0'
end
