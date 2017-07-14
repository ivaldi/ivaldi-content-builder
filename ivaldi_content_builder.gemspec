$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ivaldi_content_builder/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ivaldi-content-builder"
  s.version     = IvaldiContentBuilder::VERSION
  s.authors     = ["Bas Schoenmakers"]
  s.email       = ["bas@ivaldi.nl"]
  s.homepage    = "https://ivaldi.nl"
  s.summary     = "Create contentblocks and pages."
  s.description = "Create contentblocks and pages."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.1"

  # Cocoon needed for building page
  s.add_dependency "cocoon"
  s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
