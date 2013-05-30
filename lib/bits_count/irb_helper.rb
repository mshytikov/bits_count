require 'bits_count'

def count_bits path
  stats = BitsCount::File.bits_count(path)
  puts "found %d bits set to 1"%[stats[:bit1_count]]
  puts "found %d bits set to 0"%[stats[:bit0_count]]
end
