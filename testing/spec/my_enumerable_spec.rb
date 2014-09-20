require 'spec_helper'

describe MyEnumerable do
  
  before :all do
    @array = []
    10.times { @array << rand(100)}
  end
  
  describe "::my_each" do

    it "does same as Enumerable::each" do
      expect(@array.my_each {}).to eql(@array.each {})
    end
  end
  
  describe "::my_select" do

    it "does same as Enumerable::select" do
      expect(@array.my_select {|e| e<50}).to eql(@array.select {|e| e<50})
    end
  end
  
  describe "::my_all?" do

    describe "does same as Enumerable::all?" do
      
      context "when all true" do
        it { expect(@array.my_all? {|e| e<=100}).to eql(@array.all? {|e| e<=100}) }
      end
      
      context "when all false" do
        it { expect(@array.my_all? {|e| e<=50}).to eql(@array.all? {|e| e<=50}) }
      end
    end
  end
  
  describe "::my_any?" do

    describe "does same as Enumerable::any?" do
      
      context "when any true" do
        it { expect(@array.my_any? {|e| e<=30}).to eql(@array.any? {|e| e<=30}) }
      end
      
      context "when any false" do
        it { expect(@array.my_any? {|e| e>100}).to eql(@array.any? {|e| e>100}) }
      end
    end
  end
  
  describe "::my_none?" do

    describe "does same as Enumerable::none?" do
      
      context "when none true" do
        it { expect(@array.my_none? {|e| e>100}).to eql(@array.none? {|e| e>100}) }
      end
      
      context "when none false" do
        it { expect(@array.my_none? {|e| e>50}).to eql(@array.none? {|e| e>50}) }
      end
    end
  end
  
  describe "::my_count" do

    it "does same as Enumerable::count" do
      expect(@array.my_count {|e| e>50}).to eql(@array.count {|e| e>50})
    end
  end
  
  describe "::my_map" do

    it "does same as Enumerable::map" do
      expect(@array.my_map {|e| e>50}).to eql(@array.map {|e| e>50})
    end
  end
  
  describe "::my_count" do

    it "does same as Enumerable::count" do
      expect(@array.my_count {|e| e>50}).to eql(@array.count {|e| e>50})
    end
  end
  
  describe "::my_inject" do

    describe "does same as Enumerable::inject" do
      context "without start value" do
        it { expect(@array.my_inject { |sum, e| sum + e}).to eql(@array.inject { |sum, e| sum + e}) }
      end
      
      context "with start value" do
        it { expect(@array.my_inject(50) { |sum, e| sum + e}).to eql(@array.inject(50) { |sum, e| sum + e}) }
      end
    end
  end
end