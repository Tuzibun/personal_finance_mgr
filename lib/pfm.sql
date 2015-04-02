DROP TABLE IF EXISTS accounts;
DROP TABLE IF EXISTS transactions;

CREATE TABLE accounts (
	id serial PRIMARY KEY, 
	name varchar(25) NOT NULL,
	balance decimal(10,2) NOT NULL
);

CREATE TABLE transactions (
	id serial PRIMARY KEY,
	date varchar(9),
	account varchar(25) NOT NULL,
	payee varchar(25) NOT NULL,
	category varchar(25) NOT NULL,
	type decimal(10,2) NOT NULL
);
