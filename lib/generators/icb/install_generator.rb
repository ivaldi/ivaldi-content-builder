module Icb
  class InstallGenerator < Rails::Generators::Base

    def generate_migrations
      @_source_root = File.expand_path("../../../../", __FILE__)

      timestamp = I18n.l Time.zone.now, format: '%Y%m%d%H%M%S'
      create_file "db/migrate/#{timestamp}_create_ivaldi_content_blocks.rb",
          File.read("#{@_source_root}/db/migrate/create_ivaldi_content_blocks.rb")
    end


  end
end