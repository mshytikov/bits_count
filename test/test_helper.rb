require 'test/unit'
require 'bits_count'
require 'benchmark'

module Fixtures
  ROOT = File.expand_path('fixtures',  File.dirname(__FILE__))

  def fixture_path(name)
    File.expand_path(name.to_s, ROOT)
  end

  def self.all
    Dir.glob(File.expand_path("*", ROOT)).map{|p| File.basename(p).to_i}
  end


  def self.generate_large_bin
    path = File.expand_path("tmp/large.bin", ROOT)
    if !File.exists?(path)
      File.open(path, "wb") do |f|
        1024.times { f.write(([0x55555555] * 256).pack("N*")) }
      end
    end
    path
  end

end
