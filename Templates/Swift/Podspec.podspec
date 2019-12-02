Pod::Spec.new do |s|
    s.source_files = '*.swift'
    s.name = '{{ options.name }}'
    s.authors = 'Jeffrey Macko'
    s.summary = 'Bitrise API Client'
    s.version = '{{ info.version }}'
    s.homepage = 'https://github.com/mackoj/BitriseSwaggerClient'
    s.source = { :git => 'git@github.com:https://github.com/mackoj/BitriseSwaggerClient.git' }
    s.ios.deployment_target = '12.0'
    s.tvos.deployment_target = '12.0'
    s.osx.deployment_target = '10.12'
    s.source_files = 'Sources/**/*.swift'
    {% for dependency in options.dependencies %}
    s.dependency '{{ dependency.pod }}', '~> {{ dependency.version }}'
    {% endfor %}
end
