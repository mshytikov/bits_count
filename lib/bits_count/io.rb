module BitsCount
  module IO
    class << self

      BUFFER_SIZE    = 256
      UNPACK_PATTERN = "N*"
      BIN_STR_END    = [0].pack("N")


      def population_count_int32(io)
        count = 0
        each_int32(io) {|int| count += Primitive.population_count_int32(int) }
        count
      end

      def population_count_map(io)
        count = 0
        each_int32(io) {|int| count += Primitive.population_count_map(int) }
        count
      end

      def population_count_str(io)
        count = 0 
        while binstr = io.read(BUFFER_SIZE)
          count += Primitive.population_count_str(binstr) 
        end
        count
      end

      private
      def each_int32(io, &block)
        while binstr = io.read(BUFFER_SIZE)
          binstr << BIN_STR_END if binstr.bytesize < BUFFER_SIZE
          binstr.unpack(UNPACK_PATTERN).each(&block)
        end
      end
    end
  end 
end
