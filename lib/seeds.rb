# Account seeds:
Account.create(name: savings, balance: 500)
Account.create(name: checking, balance: 100)
Account.create(name: really saving, balance: 1000)

# Transaction seeds:
Transaction.create(account_id: 1, date: "31 Mar 15", category: "Food", payee: "Shake Shack", amount: 10, kind: "debit")
Transaction.create(account_id: 1, date: "1 Apr 15", category: Job, payee: "Me", amount: 500, kind: "credit")

Transaction.create(account_id: 2, date: "1 Apr 15", category: "Car", payee: "Exxon", amount: 20, kind: "debit")
Transaction.create(account_id: 2, date: "1 Apr 15", category: "Clothes", payee: "Nordstrom", amount: 500, kind: "debit")

Transaction.create(account_id: 3, date: "2 Apr 15", category: "Food", payee: "Chipotle", amount: 5, kind: "debit")
Transaction.create(account_id: 3, date: "2 Apr 15", category: "Living", payee: "Washington Gas", amount: 100, kind: "debit")