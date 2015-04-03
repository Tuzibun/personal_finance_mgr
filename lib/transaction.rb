class Transaction < ActiveRecord::Base
	belongs_to :accounts
	validates :account, presence: true
end

# def kind
# 	credits = Transaction.find_by(kind: credit)
# 	credits.amount.sum
# 	debits = Transaction.find_by(kind: debit)
# 	debits.amount.sum
# end

def add_transaction (account)
	puts "Please provide transaction details:"

	puts "Date?"
		date = gets.chomp
		
	puts ""
	puts "Category?"
	list_categories
	choose_category
		
	puts ""
	puts "Payee?"
	payee = gets.chomp

	puts ""
	puts "Amount? (no $ please)"
	amount = gets.chomp.to_i

	puts ""
	puts "Debit or Credit?"
	kind = gets.chomp.downcase

	Transaction.create(account_id: account.id, date: date, category: choose_category, payee: payee, amount: amount, kind: kind)
	# if new_transaction.valid?
	# 	new_transaction.save
	# else
	# 	new_transaction.errors.each do |key, value|
	# 		puts "#{key} #{value}"
	# 		Transaction.add_transaction
	# 	end
	# end
	update_balance(account)
	puts "You have successfully added a transaction!"
end

def edit_transaction (account)
	view_all(account)
	puts "Enter the ID of the transaction you wish to modify"
	transaction_choice = gets.chomp.to_i
	
	#Collect information for updating
	puts "Enter the column name of the value to be changed"
	column = gets.chomp
	puts "Enter the new value:"
	new_value = gets.chomp

	case column
	when "date"
		account.transactions.update(transaction_choice, date: new_value)
	when "category"
		list_categories
		account.transactions.update(transaction_choice, category: new_value)
	when "payee"
		account.transactions.update(transaction_choice, payee: new_value)
	when "amount"
		account.transactions.update(transaction_choice, amount: new_value)
	when "kind"
		account.transactions.update(transaction_choice, kind: new_value)
	end
	update_balance (account)
end

def delete_transaction (account)
	view_all(account)
	puts "Enter the ID of the transaction you wish to delete"
	delete_choice = gets.chomp.to_i
	to_be_deleted = account.transactions.find_by(id: delete_choice)
	to_be_deleted.destroy
	update_balance (account)
	puts "Success!  Transaction # #{delete_choice} has been expunged."
end
