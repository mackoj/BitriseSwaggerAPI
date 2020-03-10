Pod::Spec.new do |s|
    s.name = 'BitriseAPI'
    s.authors = 'Jeffrey MACKO'
    s.summary = 'Official REST API for Bitrise.io'
    s.version = '0.1'
    s.homepage = 'https://api-docs.bitrise.io/#/'
    s.source = { :git => 'git@github.com:https://github.com/yonaskolb/SwagGen.git' }
    s.ios.deployment_target = '13.0'
    s.tvos.deployment_target = '13.0'
    s.osx.deployment_target = '10.14'
    s.subspec 'BitriseAPIClient' do |cs|
      cs.source_files = 'Sources/Client/*.swift'
      cs.dependency 'BitriseAPI/BitriseAPIRequests'
      cs.dependency 'Alamofire', '~> 4.9.0'
    end
    s.subspec 'BitriseAPIModels' do |cs|
      cs.source_files = 'Sources/Models/*.swift'
    end
    s.subspec 'BitriseAPIRequests' do |cs|
      cs.dependency 'BitriseAPI/BitriseAPIModels'
      cs.dependency 'BitriseAPI/BitriseAPISharedCode'
      cs.source_files = 'Sources/Requests/*.swift'
    end
    s.subspec 'BitriseAPISharedCode' do |cs|
      cs.source_files = 'Sources/SharedCode/*.swift'
    end
end
