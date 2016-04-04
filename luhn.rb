module Luhn
  def self.is_valid?(number)
    checksum = 0
    number.to_s.reverse.chars.each_with_index do |digit, index|
      processed_digit = digit.to_i
      processed_digit = processed_digit * 2 if index % 2 == 1
      processed_digit = processed_digit - 9 if processed_digit >= 10
      checksum += processed_digit
    end
    checksum % 10 == 0 ? true : false
  end
end