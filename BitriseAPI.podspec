Pod::Spec.new do |s|
    s.source_files = '*.swift'
    s.name = 'BitriseAPI'
    s.authors = 'Jeffrey MACKO'
    s.summary = 'Official REST API for Bitrise.io'
    s.version = '0.1'
    s.homepage = 'https://api-docs.bitrise.io/#/'
    s.source = { :git => 'git@github.com:https://github.com/yonaskolb/SwagGen.git' }
    s.ios.deployment_target = '9.0'
    s.tvos.deployment_target = '9.0'
    s.osx.deployment_target = '10.9'
    s.source_files = 'Sources/**/*.swift'
    s.dependency 'Alamofire', '~> 4.9.0'
end
