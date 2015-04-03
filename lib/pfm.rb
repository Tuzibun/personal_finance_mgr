require 'pry'
require 'table_print'
require 'active_record'
require_relative "account.rb"
require_relative "transaction.rb"

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql", 
  :host => "localhost",
  :database => "pfm"
  )

# binding.pry
class Run
	def initialize
		puts ""
		puts "Hello, I'm your Personal Finance Manager"
		# This is the code for a single user, single account, single involvement with the program:
			# puts "What would you like to name your account?"
			# account_name = gets.chomp
			# puts "What is the starting balance?"
			# account_balance = gets.chomp.to_i
			# @account = Account.create(name: account_name, balance: account_balance)
		puts "These are your available accounts:"
		puts ""
		list_accounts
		puts "Please type the ID of account you would like to access"
		@account = Account.find(gets.chomp.to_i)
		# This gives the user a confirmation (in words) that the correct account was chosen
		puts "You have chosen #{@account.name}"
		list_accounts
		menu
	end

	def menu
		loop do
			puts ""
			puts "What would you like to do?"
			puts "1.  View all transactions"
			puts "2.  View transactions by category"
			puts "3.  Add a transaction"
			puts "4.  Edit a transaction"
			puts "5.  Delete a transaction"
			puts "6.  Check account balance"
			puts "7.  Exit"
			puts "Please type your selection:"
			choice = gets.chomp.to_i
			case choice
			when 1
				view_all(@account)
			when 2
				view_category(@account)
			when 3
				add_transaction(@account)
			when 4
				edit_transaction(@account)
			when 5
				delete_transaction(@account)
			when 6
				balance(@account)
			when 7
				puts "Good job managing your money today.  Have a great day!"
				break
			end
		end 
	end

# account1 = Account.create(name: 'Gwens savings', balance: 0)

# account1.transactions.create(date: '31 Mar 15', category: 'Food', payee: 'Shake Shack', amount: 10, kind: 'debit')
# account1.transactions.create(date: '30 Mar 15', category: 'Fun', payee: 'Go Karts', amount: 20, kind: 'debit')
# account1.transactions.create(date: '1 Apr 15', category: 'Car', payee: 'Exxon', amount: 20, kind: 'debit')
# account1.transactions.create(date: '1 Apr 15', category: 'PAYCHECK', payee: 'job', amount: 100, kind: 'credit')

end

Run.new