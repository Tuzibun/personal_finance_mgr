# require 'active_record'
# #require 'pry'

# ActiveRecord::Base.establish_connection(
#   :adapter => "postgresql", 
#   :host => "localhost",
#   :database => "pfm"
#   )

class Account < ActiveRecord::Base

	has_one :name
	has_one :balance
	has_many :transactions
	# validates :name, balance, presence: true
end


class CreateAccount < ActiveRecord::Migration
	def initialize
		create_table :accounts do |column|
			column.string :name
			column.decimal :balance
		end

		create_table :transactions do |column|
			column.string :account
			column.string :date
			column.string :category
			column.string :payee
			column.decimal :amount
			column.string :type
		end
	end
end

def view_all
	tp Transactions.all, :account, :date, :category, :payee, :amount, :type
end

def list_categories
	puts "1. Food"
	puts "2. Fun"
	puts "3. Car"
	puts "4. Living"
	puts "5. Clothes"
	cat_choice = gets.chomp
		case 
			when 1
				cat_choice = "Food"
			when 2
				cat_choice = "Fun"
			when 3
				cat_choice = "Car"
			when 4
				cat_choice = "Living"
			when 5
				cat_choice = "Clothes"
			else
				puts "Please enter a number choice 1-5."
			end
end

def view_category
	puts "Which category would you like to view?"
	list_categories
	tp Transactions.all.category{cat_choice}
end

def balance
	credits = Transactions.type[credit]
	total_credits = credits.sum
	debits = Transactions.type[debit]
	total_debits = debits.sum
	balance = credits - debits
end
