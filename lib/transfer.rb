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
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
    if execute_transaction
      @receiver.balance -= amount
      @sender.balance += amount
      self.status = "reversed"
    else 
      self.status = "rejected"
    end
  end
end
