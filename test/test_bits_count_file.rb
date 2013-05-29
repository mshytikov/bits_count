require 'test_helper'

class TestBitsCountFile < Test::Unit::TestCase
  include Fixtures

  Fixtures.all.each do  |fixture| 
    define_method "test_population_count_#{fixture}" do
      path = fixture_path(fixture)
      assert_equal(fixture, BitsCount::File.population_count(path))
    end
  end 

end
