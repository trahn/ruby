
#Project 1: Bubble Sort

def benchmark(&block)
  a=Time.now
  block.call
  b=Time.now
  puts "Sec: "+Time.at(b-a).sec.to_s + ", Microsec: " + (Time.at(b-a).usec).to_s
end

def bubble_sort(array)
  n = array.length
  for l in 1..(n-1)
    swaps = 0
    for i in 0..(n-l-1)
      if array[i] > array[i+1]
        array[i..i+1] = array[i..i+1].reverse
        swaps += 1
      end
    end
    break if swaps == 0
  end
  p array
end

benchmark {bubble_sort([4,3,78,2,0,2])}
benchmark {bubble_sort((1..10).to_a)}


def bubble_sort_by(array, &block)
  n = array.length
  for l in 1..(n-1)
    swaps = 0
    for i in 0..(n-l-1)
      if block.call(array[i], array[i+1]) < 0
        array[i..i+1] = array[i..i+1].reverse
        swaps += 1
      end
    end
    break if swaps == 0
  end
  p array
end



bubble_sort_by(["hi","hello","hey"]) do |left,right|
  right.length - left.length
end




#Project 2: Enumerable Methods






















