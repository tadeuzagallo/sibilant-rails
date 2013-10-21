require 'execjs'
require 'json'

module Sibilant
  @@context = nil

  def self.compile(source)
    self.context.call("sibilant.translateAll", source)
  end

  private
  def self.source_dir
    @@source_path ||= ENV['SIBILANT_SOURCE_PATH'] || File.join(File.expand_path(File.dirname(__FILE__)), 'source')
  end

  def self.source_path(source)
    File.join(self.source_dir, source)
  end

  def self.context
    if @@context.nil?
      browser = open(self.source_path("lib/browser.js")).read
      functional = open(self.source_path("include/functional.sibilant")).read
      macros = open(self.source_path("include/macros.sibilant")).read

      source = <<-src
      #{browser};
      sibilant.translateAll.apply(sibilant, #{::JSON.generate([functional])});
      sibilant.translateAll.apply(sibilant, #{::JSON.generate([macros])});
      src

      @@context = ExecJS.compile(source)
    end

    @@context
  end
end
