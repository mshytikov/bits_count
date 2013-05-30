require 'test_helper'
require 'stringio'

class TestBitsCountIO < Test::Unit::TestCase
  TEST_BIT_STRINGS = {
    "1"           => 1,
    "01"          => 1,
    "010"         => 1,
    "011"         => 2,
    "01"*32       => 32,
    "1"*64        => 64,
    "0"<< "1"*63  => 63,
    "01"*64       => 64,
    "0"*512<< "1" => 1
  }
  TEST_METHODS = BitsCount::IO.methods.grep(/population_count/)

  TEST_METHODS.each do |method|
    define_method "test_#{method}" do
      TEST_BIT_STRINGS.each do |binstr, expected_count|
        StringIO.open([binstr].pack("b*"), "rb") do |io|
          assert_equal(expected_count, BitsCount::IO.send(method, io), "Bin sring: #{binstr}")
        end
      end
    end
  end

  def test_benchmark
    io =  StringIO.new(File.binread(Fixtures.large_bin), 'rb')
    Benchmark.bmbm  do |x|
      TEST_METHODS.each do |method|
        x.report("IO.#{method}"){ io.rewind; BitsCount::IO.send(method, io)  }
      end
    end
    io.close
  end

end

