require 'execjs'
require 'sprockets'
require 'tilt'
require 'json'

module Sibilant
  module Tilt
    class Template < ::Tilt::Template
      self.default_mime_type = 'application/javascript'
      @@context = nil

      def prepare
        if @@context.nil?
          browser = open("/Users/tadeu/www/javascript/sibilant/lib/browser.js").read
          functional = open("/Users/tadeu/www/javascript/sibilant/include/functional.sibilant").read
          macros = open("/Users/tadeu/www/javascript/sibilant/include/macros.sibilant").read

          source = <<-src
          #{browser};
          sibilant.translateAll.apply(sibilant, #{::JSON.generate([functional])});
          sibilant.translateAll.apply(sibilant, #{::JSON.generate([macros])});
          src

          @@context = ExecJS.compile(source)
        end
      end

      def evaluate(scope, locals, &block)
        @output ||= @@context.call("sibilant.translateAll", data)
      end
    end

    ::Sprockets.register_engine '.sibilant', Template
  end
end
