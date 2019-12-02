Pod::Spec.new do |s|
    s.source_files = '*.swift'
    s.name = 'BitriseAPI'
    s.authors = 'Jeffrey Macko'
    s.summary = 'Bitrise API Client'
    s.version = '0.1'
    s.homepage = 'https://github.com/mackoj/BitriseSwaggerClient'
    s.source = { :git => 'git@github.com:https://github.com/mackoj/BitriseSwaggerClient.git' }
    s.ios.deployment_target = '12.0'
    s.tvos.deployment_target = '12.0'
    s.osx.deployment_target = '10.12'
    s.source_files = 'Sources/**/*.swift'
    s.dependency 'Alamofire', '~> 4.9.0'
end
