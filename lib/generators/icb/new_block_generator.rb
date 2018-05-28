module Icb
  class NewBlockGenerator < Rails::Generators::Base

    argument :attributes, type: :array

    def call
      @model_name = attributes.shift

      create_migration
      create_form_fields
      add_field_to_translation
    end

    private

      def create_migration
        generate "model icb/#{@model_name}", attributes.join(' ')
      end

      def create_form_fields
        @_source_root = File.expand_path("../../../../", __FILE__)

        file_name = "app/views/admin/icb/_#{@model_name.underscore}_fields.html.erb"
        create_file file_name, File.read("#{@_source_root}/app/views/ivaldi_content_blocks/_field.html.erb")
      end

      def add_field_to_translation
        file = File.open("#{Dir.pwd}/config/locales/#{I18n.locale}.yml")

        translations = YAML.load(file.read)

        if translations[I18n.locale.to_s]['ivaldi_content_blocks'].nil?
          translations[I18n.locale.to_s].merge!({ "ivaldi_content_blocks" => {} })
        end

        translations[I18n.locale.to_s]["ivaldi_content_blocks"].merge!(Hash["Icb::#{@model_name}", @model_name])

        File.open(file, 'w') {|f| f.write translations.to_yaml }

        puts "Succesfully updated translations"
      end

  end
end