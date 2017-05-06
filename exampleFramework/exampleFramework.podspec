Pod::Spec.new do |s|
  s.name          = 'exampleFramework'
  s.version       = '0.1.0'
  s.homepage      = 'https://github.com/zierka'
  s.license       = 'MIT'
  s.author        = {'Zier Erik' => 'erik.interwebz@gmail.com'}
  s.summary       = 'An example cocoapod framework that shows how to add and use resources with the accompanying xcode project'
  s.source        = {:git => 'git@bitbucket.org:zierka/resources-in-cocoapod-example.git', :tag => s.version.to_s}

  s.requires_arc  = true
  s.platform      = :ios
  s.ios.deployment_target = '10.0'

  s.resource_bundles = {
      'exampleFrameworkResources' => ['exampleFramework/Resources/**/*.{xcassets,imageset,png,jpg,jpeg,html,txt}']
    }

  s.source_files = 'exampleFramework/**/*.{h,m,swift}'
end
