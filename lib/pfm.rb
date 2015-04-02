#require 'pry'
require 'table_print'
require 'active_record'
require_relative "account.rb"
#require_relative "transaction.rb"

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql", 
  :host => "localhost",
  :database => "pfm"
  )

class Run
	def initialize
		puts ""
		puts "Hello, I'm your Personal Finance Manager"
		puts "What would you like to name your account?"
		account_name = gets.chomp
		puts "What is the starting balance?"
		account_balance = gets.chomp.to_i
		@account = CreateAccount.create(name: account_name, balance: account_balance)
		menu
	end

	def menu
		loop do
			puts ""
			#	@account.list_accounts
			puts "What would you like to do?"
			puts "1.  View all transactions"
			puts "2.  View transactions by category"
			puts "3.  Add a transaction"
			puts "4.  Edit a transaction"
			puts "5.  Delete a transaction"
			puts "6.  Check account balance"
			puts "7.  Exit"
			puts "Please type your selection:"
			case gets.chomp.to_i
			when 1
				@account.view_all
			when 2
				@account.view_category
			when 3
				@account.add_transaction
			when 4
				@account.edit_transaction
			when 5
				@account.delete_transaction
			when 6
				@account.balance
			when 7
				puts "Good job managing your money today.  Have a great day!"
				break
			end
		end 
	end
end

Run.new
#binding.pry