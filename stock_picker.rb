# stock_picker.rb
# Created: 02/09/2016
# Modified: 03/14/2016
# For the Odin Project's Stock Picker project
# http://www.theodinproject.com/ruby-programming/building-blocks

#prices = [17,3,6,9,15,8,6,1,10]
#prices = [17,9,8,10]
#prices = [17,9,8,5,3,3]
prices = [17,3,6,9,15,8,6,10,10,3,15]
#prices = [3]

pl = Array.new

if prices.length < 2
  puts "List too short, must contain at least 2 values"
  exit
end

for i in 0..prices.length-2
  for j in i+1..prices.length-1
    pl.push([i, j, prices[j] - prices[i]])
  end
end

#Debug - prints all of the combinations
#puts "And now the contents of the array representing the day bought, they day sold and the delta: "
#pl.each { |x| puts "#{x}\n" }

# Now I need to go through the array of arrays and find the values for the max profit
max_profit = pl.map {|x| x[2] }.max

# Put a check here to verify that max_profit >0
if max_profit <= 0
  puts "No combination resulted in a profit."
  exit
else
  puts "Maximum profit obtainable is: #{max_profit}"
end

# This returns the index of the array that is the highest profit combo
combo = pl.index {|x| x[2] == max_profit}
#puts "combo is: #{combo}"

solution = pl[combo]
#puts "#{solution}"

puts "You should buy on day #{solution[0]+1} when the price is #{prices[solution[0]]}\n"
puts "You should sell on day #{solution[1]+1} when the price is #{prices[solution[1]]}\n"