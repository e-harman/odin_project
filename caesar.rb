# caesar.rb
# Created: 01/11/2016
# Modified: 01/28/2016
# For the Odin Project's Caesar Cipher project

puts "Enter string to be encrypted: "
input_string = gets.chomp

puts "Enter shift value (integer betwen 1 and 25):"
shift_value = gets.chomp
if shift_value =~ /[^0-9]/
  puts "Error: Shift value must be an integer between 1 and 25."
  exit
else
  shift_value = shift_value.to_i
end

unless ((1..25) === shift_value)
  puts "Error: shift value must be between 1 and 25"
  exit
end

chars = input_string.scan(/./)

#puts chars.to_s

ords = chars.collect {|char| char.ord}

#puts ords.to_s

ords_shifted = ords.collect do |ord| 
  case ord
  when 32 .. 64
    ord + shift_value
  when 65 .. 90
    if ord + shift_value > 90
      64 + (shift_value - (90 - ord))
    else
      ord + shift_value
    end
  when 91 .. 96
    ord + shift_value
  when 97 .. 122
    if ord + shift_value > 122
      96 + (shift_value - (122 - ord))
    else
      ord + shift_value
    end
  when 123 .. 126
    ord + shift_value
  else
  end
end

#puts ords_shifted.to_s

chars_shifted = ords_shifted.collect {|ord| ord.chr}
#puts "#{chars_shifted}"

# ords.each_index do |index|
#   puts ords.fetch(index)
# end

cipher_string = chars_shifted.join
puts cipher_string