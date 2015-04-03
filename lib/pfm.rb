# These are all the files referenced by this controller file
require 'pry'
require 'table_print'
require 'active_record'
require_relative "account.rb"
require_relative "transaction.rb"
#require_relative "seeds.rb"

# This connects to the database "pfm" using psql
ActiveRecord::Base.establish_connection(
  :adapter => "postgresql", 
  :host => "localhost",
  :database => "pfm"
  )

# This is the main body of the program
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
end

Run.new