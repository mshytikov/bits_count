require 'test/unit'
require 'bits_count'

module Fixtures
  ROOT = File.expand_path('fixtures',  File.dirname(__FILE__))

  def fixture_path(name)
    File.expand_path(name.to_s, ROOT)
  end

  def self.all
    Dir.glob(File.expand_path("*", ROOT)).map{|p| File.basename(p).to_i}
  end


end
