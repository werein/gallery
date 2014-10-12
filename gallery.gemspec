$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'gallery/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'gallery'
  s.version     = Gallery::VERSION
  s.authors     = ['Jiri Kolarik']
  s.email       = ['jiri.kolarik@imin.cz']
  s.homepage    = 'http://werein.cz'
  s.summary     = 'Gallery engine for Project.'
  s.description = 'Gallery engine for Project.'

  s.files       = Dir['{app,config,db,lib}/**/*', 'LICENSE.txt', 'Rakefile', 'README.md']
  s.test_files  = Dir['test/*.*' ,'test/{cells,controllers,data,helpers,integration,models}/**/*','test/dummy/*.*', 'test/dummy/{app,bin,config,db,lib}/**/*']

  s.add_dependency 'rails', '~> 4.0'
  s.add_dependency 'foundationstone', '~> 0.0.3'
  s.add_dependency 'uppr', '~> 1.0'
  s.add_dependency 'globalize', '~> 4.0'
  s.add_dependency 'globalize-missing', '~> 1.0'
  s.add_dependency 'route_translator' '~> 3.2.4'
  s.add_dependency 'cells'
  s.add_dependency 'ancestry'
  s.add_dependency 'videojs'
  s.add_dependency 'enumerize'
  s.add_dependency 'cocoon'
  s.add_dependency 'jquery-file-upload-rails', '~> 1.0'
  s.add_dependency 'blueimp-gallery', '~> 2.0'
  s.add_dependency 'cancancan', '~> 1.7'

  s.add_development_dependency 'tuberack'
end
