require 'test_helper'

class TestBitsCountFile < Test::Unit::TestCase
  include Fixtures

  Fixtures.all.each do  |path, bit0_count, bit1_count| 
    file_name = File.basename(path)

    define_method "test_population_count_with_file_#{file_name}" do
      assert_equal(bit1_count, BitsCount::File.population_count(path, :int32), "alg :int32")
      assert_equal(bit1_count, BitsCount::File.population_count(path, :str), "alg :srt")
      assert_equal(bit1_count, BitsCount::File.population_count(path, :map), "alg :srt")
    end

    define_method "test_bits_count_#{file_name}" do
      expected = { bit0_count: bit0_count, bit1_count: bit1_count }
      assert_equal(expected, BitsCount::File.bits_count(path))
    end
  end 

  def test_population_count_with_unknown_algorithm
    assert_raise NotImplementedError do
      BitsCount::File.population_count(Fixtures.large_bin, :fast)
    end
  end

  def test_benchmark
    path = Fixtures.large_bin
    Benchmark.bmbm  do |x|
      [:int32, :map, :str].each do |alg|
        x.report("File.population_count alg: #{alg}") { BitsCount::File.population_count(path, alg) } 
      end
    end
  end
end
