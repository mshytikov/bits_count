module BitsCount
  module File

    class << self

      def population_count(path, alg = :str)
        ::File.open(path, "rb") do |f|
          case alg
          when :int32
            IO.population_count_int32(f) 
          when :str
            IO.population_count_str(f) 
          when :map
            IO.population_count_map(f) 
          else
            raise NotImplementedError, "#{alg} algorithm is not implemented"
          end
        end
      end

      def bits_count(path)
        f_size = ::File.size(path)
        bit1_count = population_count(path)
        {
          bit0_count: f_size*8 - bit1_count,
          bit1_count: bit1_count
        }
      end
    end

  end
end
