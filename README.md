# sibilant-rails #

Gem for enable [Sibilant JS][1] on rails

simply add
     
    group :assets do
      gem 'sibilant-rails', github: 'tadeuzagallo/sibilant-rails'
    end
    
to your `Gemfile` and all your assets with `.sibilant` extension will be automatically compiled

Also enable a `:sibilant` filter on haml templates

Info about the syntax and the project on [sibilant site][1]


  [1]: http://sibilantjs.info/ "sibilant"
