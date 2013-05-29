require "bits_count/version"

module BitsCount
  # Your code goes here...
  #
  MACHINE_WORD_SIZE = 0.size*8

  class << self

    def population_count_int32(i)
      i = i - ((i >> 1) & 0x55555555)
      i = (i & 0x33333333) + ((i >> 2) & 0x33333333)
      i = (i + (i >> 4)) & 0x0F0F0F0F
      i = i + (i >> 8)
      i = i + (i >> 16)
      i & 0x0000003F
    end

    def population_count_int64(i)
      i = i - ((i >> 1) & 0x5555555555555555)
      i = (i & 0x3333333333333333) + ((i >> 2) & 0x3333333333333333)
      i = (i + (i >> 4)) & 0x0F0F0F0F0F0F0F0F
      i = i + (i >> 8)
      i = i + (i >> 16)
      i = i + (i >> 32)
      i & 0x7F
    end

    def population_count_str(s)
      s.unpack("b*").first.count("1")
    end

    define_method(:population_count, instance_method("population_count_int#{MACHINE_WORD_SIZE}".to_sym))
  end

end
