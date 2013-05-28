require 'test_helper'

class TestBitsCount < Test::Unit::TestCase

  def test_population_count
    assert_equal(0, BitsCount.population_count(0))
    assert_equal(1, BitsCount.population_count(1))
    assert_equal(2, BitsCount.population_count(3))
  end

end
