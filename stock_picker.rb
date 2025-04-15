#!/usr/bin/env ruby
# frozen_string_literal: true

# stock_picker.rb
#

def stock_picker(prices)
  # Best price and day to buy stock
  buy_price = prices.min
  buy_day = prices.find_index(buy_price)
  # Best price and day to sell stock
  0.upto(buy_day) { |day| prices[day] = 0 }
  sell_price = prices.max
  sell_day = prices.find_index(sell_price)
  if prices[sell_day] == 0
    sell_day = buy_day
  end
  # Return best days to buy and sell
  [buy_day, sell_day]
end

p stock_picker([1, 2, 3])
# -> [0,2]
p stock_picker([17,3,6,9,15,8,6,1,10])
# -> [7,8] # Remember: Must buy before you can sell!
p stock_picker([1, 1, 1, 1, 1, 10, 1, 1])
# -> [0,5]
