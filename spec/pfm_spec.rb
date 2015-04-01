require 'rspec'
require_relative '../lib/pfm'

describe Account do
	subject (:account) do
		Account.new("Gwen Savings", 0)
	end

	it "has a name" do
		expect(account.name.class).to be(String)
	end
	it "has a balance" do
		expect(Account.balance).to be(integer)
	end

	context "when adding transactions" do

		it "accepts an array of transactions" do
			transaction.add_transaction([Transaction.new("31 Mar 15", "Gwen Savings", "Food", "Shake Shack", 10, "debit"), Transaction.new("1 Apr 15", "Gwen Savings", "Food", "Ramen", 15, "debit")])
			expect(account.transactions.count).to eq(2)
		end

		it "accepts a single transaction" do
			transaction.add_transaction(Transaction.new("1 Apr 15", "Gwen Savings", "Gas", "Exxon", 20, "debit"))
			expect(account.transactions.count).to eq(1)
		end
	end

	# describe "#list_accounts" do
	# end

	# describe "#add_account" do
	# end

	# describe "#modify_account_details" do
	# end

	# describe "#delete_account" do
	# end

	# describe "#view_account_details" do
	# end

end

describe Transaction do
	transaction = Transaction.new("31 Mar 15", "Gwen Savings", "Food", "Shake Shack", 10, "debit")
	it "has a date"
		expect(transaction.date.class).to be(String)
	end
	
	it "belongs to an account" do
	end

	it "has a category" do
		expect(transaction.all_categories).to include(transaction.category)
	end

	it "has a payee" do
		expect(transaction.payee.class).to be(String)
	end

	it "has an amount" do
		expect(transaction.amount.class).to be(integer)
	end

	it "has a type" do
		expect(transaction.types).to include(transaction.type)
	end

	# describe "a newly instantiated transaction" do
	# 	it "has one date"
	# 	it "belongs to one account"
	# 	it "has one category"
	# 	it "has one payee"
	# 	it "has one amount"
	# 	it "has one type"
	# 		expect(type).to be(debit || credit)
	# end

	# describe "#create_transaction" do
	# end

	# describe "#modify_transaction" do
	# end

	# describe "#delete_transaction" do
	# end

	# describe "#view_transaction" do
	# end

	# describe "#list_transactions" do
	# end

end
