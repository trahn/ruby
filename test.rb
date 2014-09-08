#!/usr/bin/ruby


def benchmark(&block)
  a=Time.now
  block.call
  b=Time.now
  puts "Sec: "+Time.at(b-a).sec.to_s + ", Microsec: " + (Time.at(b-a).usec).to_s
end

class Array 
  def my_each
    i = 0
    while i < self.size
        yield(self[i])  
        i+=1      
    end
    self
  end
end

benchmark { (1..100).to_a.my_each { |num|  "#{num}!" } }
benchmark { (1..100).to_a.each { |num|  "#{num}!" } }