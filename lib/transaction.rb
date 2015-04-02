class Transaction < ActiveRecord::Base
	belongs_to :account
	# validates :account, presence: true
end

def type
	credits = Transaction.find_by(type: credit)
	credits.amount.sum
	debits = Transaction.find_by(type: debit)
	debits.amount.sum
end

def add_transaction
	puts "Please provide transaction details:"
	
	puts "Date?"
		date = gets.chomp
		
	puts "Category?"
	list_categories
		
	puts "Payee?"
	payee = gets.chomp

	puts "Amount? (no $ please)"
	amount = gets.chomp.to_i

	puts "Debit or Credit?"
	type = gets.chomp

	Transaction.create(date: date, cat_choice, payee, amount, type)
end

def edit_transaction
	view_all
	puts "Enter the ID of the transaction you wish to modify"
	edit_choice = gets.chomp.to_i
	#need to figure out how to modify cells in the table
end

def delete_transaction
	view_all
	puts "Enter the ID of the transaction you wish to delete"
	delete_choice = gets.chomp.to_i
	to_be_deleted = Transaction.find_by(id: delete_choice)
	to_be_deleted.destroy
end
