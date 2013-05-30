module BitsCount
  module Primitive

    UNPACK_PATTERN = "B*"

    class << self

      def population_count_int32(i)
        i = i - ((i >> 1) & 0x55555555)
        i = (i & 0x33333333) + ((i >> 2) & 0x33333333)
        i = (i + (i >> 4)) & 0x0F0F0F0F
        i = i + (i >> 8)
        i = i + (i >> 16)
        i & 0x0000003F
      end


      def population_count_str(s)
        s.unpack(UNPACK_PATTERN).first.count(?1)
      end

      def population_count_map(i)
        WORDBITS[i&0xFFFF] + WORDBITS[i>>16]
      end

    end

    WORDBITS = Hash[0.upto(2**16-1).map{|i| [i, population_count_int32(i)] }].freeze
    
  end
end

