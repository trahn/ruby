# load './enumerable.rb'
module MyEnumerable
  extend self
  
  def my_each
    if block_given?
      for i in 0..(self.length-1)
        yield(self[i])
      end
    end
    self
  end
  
  def my_each_with_index
    for i in 0..(self.length-1)
      yield(self[i], i)
    end
    self
  end
  
  def my_select
    selected =[]
    self.my_each { |e| selected << e if yield(e) }
    selected
  end
  
  def my_all?
    self.my_each { |e| return false unless yield(e) }
    true
  end
  
  def my_any?
    self.my_each { |e| return true if yield(e) }
    false
  end
  
  def my_none?
    self.my_each { |e| return false if yield(e) }
    true
  end
  
  def my_count
    count = 0
    self.my_each { |e| count +=1 if yield(e) }
    count
  end
  
  def my_map(&proc)
    map = []
    self.my_each { |e| map << proc.call(e) }
    map
  end
  
  def my_inject(start = nil)
    if start
      self.my_each { |e| start = yield(start, e) }
    else
      #self[1..(self.length-1)].my_inject(self[0]) yield
      start = self[0]
      self[1..(self.length-1)].my_each { |e| start = yield(start, e) }
    end
    start
  end
  
  def multiply_els(array)
    array.my_inject { |prod, e| prod * e }
  end
  
end