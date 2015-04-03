# require 'active_record'
# #require 'pry'

# ActiveRecord::Base.establish_connection(
#   :adapter => "postgresql", 
#   :host => "localhost",
#   :database => "pfm"
#   )

class Account < ActiveRecord::Base
	has_many :transactions, dependent: :destroy
	validates :name, :balance, presence: true
	validates :balance, numericality: true
end

# **HI NEW USER!**
# This is the code to un-comment out when starting the program for the first time:
	# class CreateAccount < ActiveRecord::Migration
	# 	def initialize
	# 		create_table :accounts do |column|
	# 	 		column.string :name
	# 	 		column.decimal :balance
	# 	 	end

	# 		create_table :transactions do |column|
	# 			column.integer :account_id
	# 			column.string :date
	# 			column.string :category
	# 			column.string :payee
	# 			column.decimal :amount
	# 			column.string :kind
	# 		end
	# 	end
	# end
def list_accounts
	tp Account.all
end

def view_all (account)
	tp account.transactions.all
end

def list_categories
	puts "1. Food"
	puts "2. Fun"
	puts "3. Car"
	puts "4. Living"
	puts "5. Clothes"
end

def choose_category
	cat_choice = gets.chomp.to_i
		case cat_choice
			when 1
				return "Food"
			when 2
				return "Fun"
			when 3
				return "Car"
			when 4
				return "Living"
			when 5
				return "Clothes"
			# else
			# 	puts "Please enter a number choice 1-5."
			end
end

def view_category(account)
	puts "Which category would you like to view?"
	list_categories

	category_choice = choose_category
	cat_transactions = account.transactions.where(category: category_choice)

	if cat_transactions.count == 0
		puts "There are no transactions in that category, in the account #{account.name}"
	else
		tp account.transactions.where(category: category_choice)
	end
	update_balance(account)
end

def balance (account)
	credits = account.transactions.where(kind: "credit").map do |credit| 
		credit.amount.to_f
	end

	debits = account.transactions.where(kind: "debit").map do |debit|
		debit.amount.to_f
	end

	total_credits = credits.sum
	total_debits = debits.sum
	current_balance = total_credits.to_f - total_debits.to_f

	puts ""
	puts "The account balance is: $ #{current_balance}"
	return current_balance
end

def update_balance (account)
	# Calculate the new balance
	new_balance = account.balance.to_f + balance(account)
	account.update(balance: new_balance)
	# Update the balance in the account
	account.update(balance: new_balance)
	puts "This is the new account balance: #{new_balance}"

end
