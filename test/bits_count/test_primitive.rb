require 'test_helper'

class TestBitsCountPrimitive < Test::Unit::TestCase

  def test_population_count_int32
    assert_equal(0, BitsCount::Primitive.population_count_int32(0))
    assert_equal(1, BitsCount::Primitive.population_count_int32(1))
    assert_equal(2, BitsCount::Primitive.population_count_int32(3))
    assert_equal(32, BitsCount::Primitive.population_count_int32(2**32-1))
  end

  def test_population_count_map
    assert_equal(0, BitsCount::Primitive.population_count_map(0))
    assert_equal(1, BitsCount::Primitive.population_count_map(1))
    assert_equal(2, BitsCount::Primitive.population_count_map(3))
    assert_equal(32, BitsCount::Primitive.population_count_map(2**32-1))
  end

  def test_population_count_str
    assert_equal(1, BitsCount::Primitive.population_count_str([1].pack("L")))
    assert_equal(32, BitsCount::Primitive.population_count_str([2**32-1].pack("L")))
    assert_equal(64, BitsCount::Primitive.population_count_str([2**64-1].pack("Q")))
  end


  def test_benchmark
    n = 10000
    int = 0x55555555
    bstr = [int].pack("N")
    Benchmark.bmbm  do |x|
      x.report("Primitive.population_count_map")   { n.times{ BitsCount::Primitive.population_count_map(int) } }
      x.report("Primitive.population_count_int32") { n.times{ BitsCount::Primitive.population_count_int32(int) } }
      x.report("Primitive.population_count_str")   { n.times{ BitsCount::Primitive.population_count_str(bstr)  } }
   end
  end

end
