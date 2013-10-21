require 'spec_helper'

describe 'Compile' do
  before do
    @lisp = "((#(w) (console.log (w.location.toString))) window)"
    @js = "(function(w) { return console.log(w.location.toString()); })(window);"
  end

  it 'should output the same as the default compiler' do
    Sibilant.compile(@lisp).gsub(/\s+/, ' ').strip.should == @js.strip
  end
end
