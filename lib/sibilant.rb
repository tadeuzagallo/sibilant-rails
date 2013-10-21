module Sibilant
  @@context = nil

  def self.compile(source)
    self.context.call("sibilant.translateAll", source)
  end

  private

  def self.context
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

    @@context
  end
end
