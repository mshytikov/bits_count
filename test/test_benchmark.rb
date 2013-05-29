require 'test_helper'
require 'benchmark'


class TestBenchmark < Test::Unit::TestCase

  def test_benchmark
    n = 10000
    Benchmark.bmbm  do |x|
      x.report("population_count_int32") { n.times{ BitsCount.population_count_int32(1) } }
      x.report("population_count_int64") { n.times{ BitsCount.population_count_int64(1) } }
      x.report("population_count_str") { n.times{ BitsCount.population_count_str([1].pack("L!")) } }
   end
  end
end

