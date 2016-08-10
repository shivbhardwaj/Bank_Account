class BankAccount
	attr_accessor :acct_num, :checking_balance, :savings_balance
	@account_count=0

	class << self
		attr_accessor :account_count
	end

	def initialize
		createAccountNumber
		@savings_balance=1000
		@checking_balance=1000
		@interest_rate=0.05
		self.class.account_count+=1
	end	
	def displayAccountNumber
		puts @acct_num
	end
	def checkingAccountBalance
		puts "Your current checking account balance is: $#{@checking_balance}"
	end
	def savingsAccountBalance
		puts "Your current saving account balance is: $#{@savings_balance}"
	end
	def deposit(amount, account)
		if account=="savings"
			puts "depositing #{amount} into savings"
			@savings_balance+=amount
		else
			puts "depositing #{amount} into checkings"
			@checking_balance+=amount
		end
	end

	def withdraw (amount, account)
		if account == "savings"
			if (amount < @savings_balance)
				@savings_balance -= amount
			else
				puts "Insufficient funds in your Savings Account to withdraw #{amount}"
			end
		else
			if (amount < @checking_balance)
				@checking_balance -= amount
			else 
				puts "Insufficient funds in your Checking Account to withdraw #{amount}"
			end
		end
	end

	def displayTotalBalance
		puts "Your Checking Account balance is: #{@checking_balance + (@checking_balance * @interest_rate)}"
		puts "Your Savings Account balance is: #{@savings_balance + (@savings_balance * @interest_rate)}"
		puts "Total balance is: #{(@checking_balance + @savings_balance) + ((@checking_balance+@savings_balance)) * @interest_rate}"
	end
	
	def account_information
		puts "Your account number is: #{@account_number}"
		puts "Total balance is: #{(@checking_balance + @savings_balance) + ((@checking_balance+@savings_balance)) * @interest_rate}"
		puts "Your Checking Account balance is: #{@checking_balance + (@checking_balance * @interest_rate)}"
		puts "Your Savings Account balance is: #{@savings_balance + (@savings_balance * @interest_rate)}"
		puts "The interest rate is: #{@interest_rate}"
	end

	def count_accounts
		puts "There are a total of #{self.class.account_count} accounts"
	end

	private
	attr_accessor :interest_rate
	def createAccountNumber
		@account_number = Integer(rand.to_s[2..9])
	end
end


user1 = BankAccount.new
user1.displayAccountNumber
user1.checkingAccountBalance
user1.savingsAccountBalance
user1.deposit(200, "checking")
user1.checkingAccountBalance
user1.deposit(700, "savings")
user1.savingsAccountBalance
user1.withdraw(100, "checking")
user1.checkingAccountBalance
user1.withdraw(100, "savings")
user1.savingsAccountBalance
user1.displayTotalBalance
user1.account_information

user2 = BankAccount.new
user2.displayAccountNumber
user2.count_accounts
