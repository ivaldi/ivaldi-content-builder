require 'rubygems'
require 'jquery-rails'
require 'cocoon'
require 'tinymce-rails'

module IvaldiContentBuilder
  class Engine < ::Rails::Engine
    config.autoload_paths += Dir["#{config.root}/app/**/"]
  end
end