require 'test_helper'

class TestBitsCountFile < Test::Unit::TestCase
  include Fixtures

  Fixtures.all.each do  |fixture| 
    define_method "test_population_count_file_#{fixture}" do
      path = fixture_path(fixture)
      assert_equal(fixture, BitsCount::File.population_count(path, :int32), "alg :int32")
      assert_equal(fixture, BitsCount::File.population_count(path, :str), "alg :srt")
      assert_equal(fixture, BitsCount::File.population_count(path, :map), "alg :srt")
    end
  end 


  def test_benchmark
    path = Fixtures.generate_large_bin
    Benchmark.bmbm  do |x|
      [:int32, :map, :str].each do |alg|
        x.report("File.population_count alg: #{alg}") { BitsCount::File.population_count(path, alg) } 
      end
   end
  end


end
