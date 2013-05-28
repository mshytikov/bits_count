require 'test_helper'

class TestBitsCount < Test::Unit::TestCase

  def test_hamming_weight
    assert_equal(1, BitsCount.population_count(1))
  end
end
