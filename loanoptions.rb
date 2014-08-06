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

i = 1
total_paid = 0
while (loans[0].balance > 0) || (loans[1].balance > 0) || (loans[2].balance > 0) || (loans[3].balance > 0) || (loans[4].balance > 0)  do
  puts "Month #{i.to_s}:"
  j = 0
  while j < 5
    puts "Loan #{(j+1).to_s} Starting Balance - #{loans[j]}"
    loans[j].compute_interest
    puts "Loan #{(j+1).to_s} After Interest - #{loans[j]}"
    loans[j].make_payment(100)
    total_paid+=100
    puts "Loan #{(j+1).to_s} After Payment - #{loans[j]}"
    j+=1
  end
  i+=1
end

puts "Paid $#{total_paid.to_s} over #{i.to_s} months"

