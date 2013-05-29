require 'test_helper'

class TestBitsCount < Test::Unit::TestCase

  def test_population_count_int32
    assert_equal(0, BitsCount.population_count_int32(0))
    assert_equal(1, BitsCount.population_count_int32(1))
    assert_equal(2, BitsCount.population_count_int32(3))
    assert_equal(32, BitsCount.population_count_int32(2**32-1))
  end

  def test_population_count_int64
    assert_equal(0, BitsCount.population_count_int64(0))
    assert_equal(1, BitsCount.population_count_int64(1))
    assert_equal(2, BitsCount.population_count_int64(3))
    assert_equal(32, BitsCount.population_count_int64(2**32-1))
    assert_equal(64, BitsCount.population_count_int64(2**64-1))
  end

  def test_population_count_str
    assert_equal(1, BitsCount.population_count_str([1].pack("L")))
    assert_equal(32, BitsCount.population_count_str([2**32-1].pack("L")))
    assert_equal(64, BitsCount.population_count_str([2**64-1].pack("Q")))
  end


end
