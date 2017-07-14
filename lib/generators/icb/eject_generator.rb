module Icb
  class EjectGenerator < Rails::Generators::Base
    def call
      FileUtils.copy_entry '../../app/views/pages', 'app/views/pages'

      FileUtils.copy_entry '../../app/controllers/pages_controller.rb', 'app/controllers/pages_controller.rb'
    end
  end
end
