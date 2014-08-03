class Loan

    attr_accessor :balance
    attr_reader :rate, :term, :min_payment

  def initialize (balance, rate, term, min_payment)
    @balance = balance
    @rate = rate
    @term = term
    @min_payment = min_payment
  end

  def to_s
    "Balance: $#{@balance}, Rate: #{@rate}%, Term: #{@term} years, Minimum Payment: $#{@min_payment}"
  end

end

i = 0
loans = Array.new(5)
params = Array.new(4)

while line = gets
  params = line.split
  loans[i] = Loan.new(params[0], params[1], params[2], params[3])
  i+=1
end

puts loans[0]
puts loans[1]
puts loans[2]
puts loans[3]
puts loans[4]




