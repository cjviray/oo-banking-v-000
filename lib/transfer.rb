class Transfer
  
  
  attr_accessor :sender, :receiver, :amount, :status
  
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end 
  
  
  def valid?
    sender.valid? && receiver.valid? 
  end 


  def execute_transaction
    if   
      sender.balance -= amount
      receiver.balance += amount
      self.status = "completed"
    else 
      self.status = "rejected"
    end 
  end 
  
  
end
