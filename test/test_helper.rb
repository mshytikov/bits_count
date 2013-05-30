require 'test/unit'
require 'bits_count'
require 'benchmark'

module Fixtures
  ROOT = File.expand_path('fixtures',  File.dirname(__FILE__))

  def fixture_path(name)
    File.expand_path(name.to_s, ROOT)
  end


  class << self
    
    def all
      Dir.glob(File.expand_path("*.bin", ROOT)).map do |path|
        file_name = File.basename(path, '.bin')
        bit0_count = file_name[/bit0-(\d+)/, 1].to_i
        bit1_count = file_name[/bit1-(\d+)/, 1].to_i
        [path, bit0_count, bit1_count]
      end
    end


    def large_bin
      path = File.expand_path("tmp/large.bin", ROOT)
      if !File.exists?(path)
        File.open(path, "wb") do |f|
          1024.times { f.write(([0x55555555] * 256).pack("N*")) }
        end
      end
      path
    end

  end
end
