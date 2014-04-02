require 'foundationstone'
require 'auth'
require 'uppr'
require 'globalize'
require 'globalize/missing'
require 'enumerize'
require 'ancestry'
require 'cells'
require 'videojs'
require 'cocoon'
require 'jquery-file-upload-rails'
require 'blueimp/gallery'

module Gallery
  class Engine < ::Rails::Engine
    isolate_namespace Gallery

    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        config.paths['db/migrate'].expanded.each do |expanded_path|
          app.config.paths['db/migrate'] << expanded_path
        end
      end
    end
  end
end
