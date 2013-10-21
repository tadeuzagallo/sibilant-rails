require 'sibilant/tilt/template'

begin
  gem 'haml-rails'
  require 'sibilant/haml/filter'
rescue Gem::LoadError
end
