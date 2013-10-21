Gem::Specification.new do |s|
  s.name        = 'sibilant-rails'
  s.version     = '0.0.1'

  s.authors     = ["Tadeu Zagallo"]
  s.email       = 'tadeuzagallo@gmail.com'

  s.summary     = %q{Sibilant adapter for the Rails asset pipeline.}
  s.description = %q{Sibilant adapter for the Rails asset pipeline.}

  s.add_runtime_dependency 'tilt'
  s.add_runtime_dependency 'sprockets'
  s.add_runtime_dependency 'execjs'
  s.add_runtime_dependency 'json'

  s.files       = ["lib/sibilant-rails.rb", "lib/sibilant/tilt/template.rb", "lib/sibilant/haml/filter.rb", "lib/sibilant.rb", "lib/source/lib/browser.js", "lib/source/include/macros.sibilant", "lib/source/include/functional.sibilant"]
  s.homepage    = 'http://rubygems.org/gems/sibilant-rails'
  s.license     = 'MIT'
end
