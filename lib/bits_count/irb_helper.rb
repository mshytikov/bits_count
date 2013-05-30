def count_bits path
  stats = BitCount.bits_count(path)
  puts "found %d bits set to 1"%[stats[:bit1_count]]
  puts "found %d bits set to 0"%[stats[:bit0_count]]
end
