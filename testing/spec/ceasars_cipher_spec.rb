require 'spec_helper'

describe CeasarsCipher do
  before :each do
    @cipher = CeasarsCipher.new "I am awesome!", 10
  end
  
  describe "#new" do
    it "is an instance of CeasarsCipher" do
      expect(@cipher).to be_an_instance_of CeasarsCipher
    end
    
    it "takes two arguments" do
      expect { Ceasars.Cipher "asdf" }.to raise_error
    end
  end
  
  describe "#cipher" do
    it "shows the ciphered string" do
    expect(@cipher.cipher).to eql "S kw kgocywo!"
    end
  end
  
  describe ".cipher" do
    it "returns a string" do
      expect(CeasarsCipher.cipher("asdf",5)).to be_an_instance_of String
    end
  end
  
  
  describe ".alphabet_num" do
    it "is between 0 and 26" do
      expect(CeasarsCipher.alphabet_num(26)).to be >= 0
      expect(CeasarsCipher.alphabet_num(26)).to be <= 26
    end
  end
  
  
end