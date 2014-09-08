#!/usr/bin/ruby


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