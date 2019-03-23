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
    if @status = "complete" 
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed"
    end 
  end 
  
      it "it can only reverse executed transfers" do
      transfer.reverse_transfer
      expect(amanda.balance).to eq(1000)
      expect(avi.balance).to eq(1000)
    end
    
end
