$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "gallery/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "gallery"
  s.version     = Gallery::VERSION
  s.authors     = ["Jiri Kolarik"]
  s.email       = ["jiri.kolarik@imin.cz"]
  s.homepage    = "http://werein.cz"
  s.summary     = "Gallery engine for Project."
  s.description = "Gallery engine for Project."

  s.files       = Dir["{app,config,db,lib}/**/*", "LICENSE.txt", "Rakefile", "README.rdoc"]
  s.test_files  = Dir["test/*.*" ,"test/{cells,controllers,data,helpers,integration,models}/**/*","test/dummy/*.*", "test/dummy/{app,bin,config,db,lib}/**/*"]

  s.add_dependency "rails", "~> 4.0"
  s.add_dependency "core", "~> 1.1"
  s.add_dependency "auth", "~> 1.1"
  s.add_dependency "jquery-file-upload-rails", "~> 1.0"
  s.add_dependency "blueimp-gallery", "~> 2"
end
