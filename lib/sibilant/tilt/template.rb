require 'sibilant'
require 'sprockets'
require 'tilt'

module Sibilant
  module Tilt
    class Template < ::Tilt::Template
      self.default_mime_type = 'application/javascript'

      def prepare
      end

      def evaluate(scope, locals, &block)
        @output ||= Sibilant.compile(data)
      end
    end

    ::Sprockets.register_engine '.sibilant', Template
  end
end
