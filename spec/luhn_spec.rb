require_relative "../luhn.rb"

RSpec.describe Luhn do
  describe "::is_valid?" do 
    it "should return true if the number is valid" do
      expect(Luhn.is_valid?(4194560385008504)).to be true
    end

    it "should return false if the number is not valid" do
      expect(Luhn.is_valid?(4194560385008505)).to be false
    end

    it "should return true if the number is valid and has an odd number of digits" do
      expect(Luhn.is_valid?(377681478627336)).to be true
    end

    it "should return false if the number is invalid and has an odd number of digits" do
      expect(Luhn.is_valid?(377681478627337)).to be false
    end
  end
end