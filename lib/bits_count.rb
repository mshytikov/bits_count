require "bits_count/version"

module BitsCount
  # Your code goes here...
  #
  
  class << self
    def population_count(x)
      x = x - ((x >> 1) & 0x55555555)
      x = (x & 0x33333333) + ((x >> 2) & 0x33333333)
      x = (x + (x >> 4)) & 0x0F0F0F0F
      x = x + (x >> 8)
      x = x + (x >> 16)
      x & 0x0000003F
    end
  end
end
