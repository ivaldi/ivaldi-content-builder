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
        generate "model #{@model_name}", attributes.join(' ')
      end

      def create_form_fields
        file_name = "app/views/ivaldi_content_blocks/_#{@model_name.underscore}_fields.html.erb"
        create_file file_name, File.read('../../app/views/ivaldi_content_blocks/_field.html.erb')
      end

      def add_field_to_translation

        file = File.open("./config/locales/#{I18n.locale}.yml")

        translations = YAML.load_file(file)

        if translations[I18n.locale.to_s][:ivaldi_content_blocks].nil?
          translations[I18n.locale.to_s].merge!({ "ivaldi_content_blocks" => {} })
        end

        translations[I18n.locale.to_s]["ivaldi_content_blocks"].merge!(Hash[@model_name, @model_name])

        File.open(file, 'w') {|f| f.write translations.to_yaml }
      end

  end
end