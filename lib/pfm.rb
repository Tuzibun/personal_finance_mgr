class Account
	attr_accessor :name, :balance
	
	def initialize name, balance = 0
		@name = name
		@balance = balance
	end
end

# gwen_savings = Account.new("Gwen Savings", 100)

class Transaction
	attr_accessor :date, :account, :category, :payee, :amount, :type
	
	def initialize date, account = 0, category, payee, amount, type
		@date = date
		@account = account
		@category = category
		@payee = payee
		@amount = amount
		@type = type

	end
end