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
            raise ArgumentError, "wron method #{method}"
          end
        end
      end

    end
  end 
end
