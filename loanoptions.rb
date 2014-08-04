class Loan

    attr_accessor :balance
    attr_reader :rate, :term, :min_payment

  def initialize (balance, rate, term, min_payment)
    @balance = Float(balance)
    @rate = Float(rate)
    @term = Float(term)
    @min_payment = Float(min_payment)
  end

  def to_s
    "Balance: $#{@balance}, Rate: #{@rate}%, Term: #{@term} years, Minimum Payment: $#{@min_payment}"
  end

  def compute_interest
    @balance += @balance * @rate
  end

  def make_payment (payment)
    @balance -= payment
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

puts "Before Interest"
i = 0
while i < 5
  puts loans[i]
  i+=1
end

puts "After Interest"
i = 0
while i < 5
  loans[i].compute_interest
  puts loans[i]
  i+=1
end

puts "After Payment"
i = 0
while i < 5
  loans[i].make_payment(100.00)
  puts loans[i]
  i+=1
end
