class CeasarsCipher
  
  attr_reader :string, :num, :cipher
  
  def initialize(string, num)
    @string = string
    @num = num
    @cipher = CeasarsCipher.cipher(string, num)
  end
  
  def self.cipher(string, num)
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
    new_string
  end
  
  def self.alphabet_num(num) 
    num -= 26 if num >= 26
    num += 26 if num < 0
    num
  end
end

a = CeasarsCipher.new("What a string!", 5)
a.cipher # => "Bmfy f xywnsl!"
b = CeasarsCipher.new("Bmfy f xywnsl!", -5)
b.cipher # => "What a string!"
CeasarsCipher.new("I am awesome!", 10).cipher # => "S kw kgocywo!"
