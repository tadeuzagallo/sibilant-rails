require 'haml-rails'
require 'sibilant'

module Haml::FIlters
  module Sibilant
    include Haml::Filters::Base

    def render(text)
      return <<-src
<script type="text/javascript">
  #{::Sibilant.compile(text)}
</script>
      src
    end
  end
end
