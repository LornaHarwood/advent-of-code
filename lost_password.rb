class Password

  attr_reader :number

  def initialize(number)
    @number = number
  end

  def legitimate_password?
    has_six_digits? && within_range_rule? && adjacent_digits_match? && digits_increase?
  end

  private

  def has_six_digits?
    number.to_s.length == 6
  end

  def within_range_rule?
    number >= 130254 && number <= 678275
  end

  def adjacent_digits_match?
    convert_to_array.each_cons(2).any? do |x, y|
      x == y
    end
  end

  def digits_increase?
    convert_to_array.each_cons(2).all? do |x, y|
       x >= y
    end
  end

  def convert_to_array
    number.digits
  end

end


def number_of_valid_passwords
  range.select do |number|
    Password.new(number).legitimate_password?
  end.count
end

def range
  130254...678275
end

# returns the number of valid passwords
puts "total is #{number_of_valid_passwords}"


#  Password tests
first_password = Password.new(111111)
puts "111111 should be false", first_password.legitimate_password?
puts "223450 should be false", Password.new(223450).legitimate_password?
puts "123789 should be false", Password.new(123789).legitimate_password?
puts "556667 should be true", Password.new(556667).legitimate_password?
puts "456789 should be false", Password.new(456789).legitimate_password?
puts "486291 should be false", Password.new(486291).legitimate_password?
puts "123445 should be false", Password.new(123445).legitimate_password?
puts "4556 should be false", Password.new(4556).legitimate_password?
puts "122345 should be false", Password.new(122345).legitimate_password?
puts "326689 should be false", Password.new(326689).legitimate_password?
