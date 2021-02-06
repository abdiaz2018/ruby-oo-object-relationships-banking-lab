class Transfer
  attr_accessor :sender, :receiver, :status, :amount, :balance
  def initialize(person_1, person_2, amount)
    @sender = person_1
    @receiver = person_2
    @status = "pending"
    @amount = amount 
  end
  def valid?
    @sender.valid?
    @receiver.valid?
  end
  def execute_transaction
    if (@sender.status == "closed" || @receiver.status == "closed")
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif @status == "pending" && (@sender.status == "open" && @receiver.status == "open")
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    end

  end
end
