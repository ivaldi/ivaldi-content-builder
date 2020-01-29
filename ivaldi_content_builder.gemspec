$:.push File.expand_path("lib", __dir__)

Gem::Specification.new do |s|
  s.name        = 'ivaldi-content-builder'
  s.version     = '0.0.1'
  s.authors     = ['Bas Schoenmakers']
  s.email       = ['bas@ivaldi.nl']
  s.homepage    = 'https://ivaldi.nl'
  s.summary     = 'Create contentblocks and pages.'
  s.description = 'Create contentblocks and pages for admin environments.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_runtime_dependency 'rails', '~> 6.0.1'

  s.add_dependency 'cocoon', '~> 1.2'
  s.add_dependency 'jquery-rails', '~> 4.3'
  s.add_dependency 'tinymce-rails', '~> 4.7'

  s.add_development_dependency 'sqlite3', '~> 1.3'
end
