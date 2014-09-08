#!/usr/bin/ruby


#Project 1

def caesar_cipher(string, num)
  
  def alphabet_num(num)
    num -= 26 if num >= 26
    num += 26 if num < 0
    num
  end
  
  new_string = ""
  az_down = [*('a'..'z')]
  az_up = [*('A'..'Z')]
  string.each_char do |w|
    if az_down.include? w 
      new_string << az_down[alphabet_num(az_down.index(w)+num)]
    elsif az_up.include? w
      new_string << az_up[alphabet_num(az_up.index(w)+num)]
    else
      new_string << w
    end
  
  end
  
  puts new_string
end

caesar_cipher("What a string!", 5)
caesar_cipher("What a string!", -5)


#.ord
#.chr


#Project 2

def stock_picker(prices)
  
  days_profit = {}
  i = 0
  while i < prices.length - 1
    j= i + 1
    while j <= prices.length - 1
      days_profit[[i,j]] = prices[j] - prices[i]
      j += 1
    end
    i += 1
  end
  
  p days_profit.max_by { |k, v| v }[0]
end

stock_picker([17,3,6,9,15,8,6,1,10])


#Project 3

def substrings(words, dictionary)
  result = {}
  words.downcase!
  dictionary.each do |word|
    result[word] = words.scan(word).length if words.scan(word).length > 0
  end
  p result
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("below", dictionary)
substrings("Howdy partner, sit down! How's it going?", dictionary)

