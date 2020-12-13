!classDefinition: #AccountSummaryTest category: 'ServiciosFinancieros2-Ejercicio'!
TestCase subclass: #AccountSummaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'CZ 12/13/2020 10:44:19'!
test01

	| account expectedSummary |
	
	account := ReceptiveAccount new.
	
	expectedSummary := OrderedCollection with: 'Balance = 0 pesos'.
	
	self assert: ((account retrieveSummary) = expectedSummary).! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'CZ 12/13/2020 10:40:03'!
test02

	| account expectedSummary |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso  on: account.
	
	expectedSummary := OrderedCollection with: 'Depósito por 100 pesos' with: 'Balance = 100 pesos'.
	
	self assert: ((account retrieveSummary) = expectedSummary).! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'CZ 12/13/2020 10:45:28'!
test03

	| account expectedSummary |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso  on: account.
	Withdraw register: 50 * peso  on: account.
	
	expectedSummary := OrderedCollection with: 'Depósito por 100 pesos' with: 'Extracción por 50 pesos' with: 'Balance = 50 pesos'.
	
	self assert: ((account retrieveSummary) = expectedSummary).! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'CZ 12/13/2020 10:45:51'!
test04

	| originAccount destinationAccount expectedSummary |
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	Deposit register: 100 * peso  on: originAccount.
	Withdraw register: 50 * peso  on: originAccount.
	Transfer amount: 10 * peso from: originAccount to: destinationAccount.
	
	expectedSummary := OrderedCollection with: 'Depósito por 100 pesos' with: 'Extracción por 50 pesos' with: 'Salida por transferencia de 10 pesos' with: 'Balance = 40 pesos'.
	
	self assert: ((originAccount retrieveSummary) = expectedSummary).! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'CZ 12/13/2020 10:46:11'!
test05

	| originAccount destinationAccount expectedSummary |
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	Deposit register: 100 * peso  on: originAccount.
	Withdraw register: 50 * peso  on: originAccount.
	Transfer amount: 30 * peso from: originAccount to: destinationAccount.
	Transfer amount: 10 * peso from: destinationAccount to: originAccount.
	
	expectedSummary := OrderedCollection with: 'Depósito por 100 pesos' with: 'Extracción por 50 pesos' with: 'Salida por transferencia de 30 pesos' with: 'Entrada por transferencia de 10 pesos' with: 'Balance = 30 pesos'.
	
	self assert: ((originAccount retrieveSummary) = expectedSummary).! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'CZ 12/13/2020 10:46:34'!
test06

	| originAccount expectedSummary |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 100 * peso  on: originAccount.
	Deposit register: 50 * peso  on: originAccount.
	Withdraw register: 20 * peso  on: originAccount.
	
	expectedSummary := OrderedCollection with: 'Depósito por 100 pesos' with: 'Depósito por 50 pesos' with: 'Extracción por 20 pesos' with: 'Balance = 130 pesos'.
	
	self assert: ((originAccount retrieveSummary) = expectedSummary).! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'CZ 12/13/2020 10:54:00'!
test07

	|aPortfolio expectedSummary|
	
	aPortfolio := Portfolio new.
	
	expectedSummary := OrderedCollection with: 'Balance = 0 pesos'.
	
	self assert: ((aPortfolio retrieveSummary) = expectedSummary).
	! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'CZ 12/13/2020 11:08:59'!
test08

	|aPortfolio anAccount expectedSummary|
	
	anAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: anAccount.
	aPortfolio := Portfolio with: anAccount.
	
	expectedSummary := OrderedCollection with: 'Depósito por 100 pesos' with: 'Balance = 100 pesos'.
	
	self assert: ((aPortfolio retrieveSummary) = expectedSummary).
	! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'CZ 12/13/2020 11:12:27'!
test09

	|aPortfolio anAccount expectedSummary|
	
	anAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: anAccount.
	Withdraw register: 50 * peso on: anAccount.
	aPortfolio := Portfolio with: anAccount.
	
	expectedSummary := OrderedCollection with: 'Depósito por 100 pesos' with: 'Extracción por 50 pesos' with: 'Balance = 50 pesos'.
	
	self assert: ((aPortfolio retrieveSummary) = expectedSummary).
	! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'CZ 12/13/2020 11:18:04'!
test10

	|aPortfolio originAccount destinationAccount expectedSummary|
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: originAccount.
	Withdraw register: 50 * peso on: originAccount.
	aPortfolio := Portfolio with: originAccount.
	Transfer amount: 10 * peso from: originAccount to: destinationAccount.
	
	
	expectedSummary := OrderedCollection with: 'Depósito por 100 pesos' with: 'Extracción por 50 pesos' with: 'Salida por transferencia de 10 pesos' with: 'Balance = 40 pesos'.
	
	self assert: ((aPortfolio retrieveSummary) = expectedSummary).
	! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'CZ 12/13/2020 11:20:13'!
test11

	|aPortfolio originAccount destinationAccount expectedSummary|
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: originAccount.
	Withdraw register: 50 * peso on: originAccount.
	aPortfolio := Portfolio with: originAccount.
	Transfer amount: 10 * peso from: originAccount to: destinationAccount.
	Transfer amount: 20 * peso from: destinationAccount to: originAccount.
	
	
	expectedSummary := OrderedCollection with: 'Depósito por 100 pesos' with: 'Extracción por 50 pesos' with: 'Salida por transferencia de 10 pesos' with: 'Entrada por transferencia de 20 pesos' with: 'Balance = 60 pesos'.
	
	self assert: ((aPortfolio retrieveSummary) = expectedSummary).
	! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'CZ 12/13/2020 11:32:16'!
test12

	|aPortfolio originAccount destinationAccount expectedSummary|
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: originAccount.
	Deposit register: 200 * peso on: originAccount.
	Withdraw register: 50 * peso on: originAccount.
	Withdraw register: 100 * peso on: originAccount.
	Transfer amount: 10 * peso from: originAccount to: destinationAccount.
	Transfer amount: 10 * peso from: originAccount to: destinationAccount.
	Transfer amount: 20 * peso from: destinationAccount to: originAccount.
	Transfer amount: 20 * peso from: destinationAccount to: originAccount.
	aPortfolio := Portfolio with: originAccount.
	
	expectedSummary := OrderedCollection new.
	expectedSummary add: 'Depósito por 100 pesos'; add: 'Depósito por 200 pesos'; add: 'Extracción por 50 pesos'; add: 'Extracción por 100 pesos'; add: 'Salida por transferencia de 10 pesos'; add: 'Salida por transferencia de 10 pesos'; add: 'Entrada por transferencia de 20 pesos'; add: 'Entrada por transferencia de 20 pesos'; add: 'Balance = 170 pesos'.
	
	self assert: ((aPortfolio retrieveSummary) = expectedSummary).
	! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'CZ 12/13/2020 11:42:12'!
test13


	
	| account simplePortfolio composedPortfolio expectedSummary |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 55 * peso on: account.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	
	expectedSummary := OrderedCollection with: 'Depósito por 100 pesos' with: 'Extracción por 55 pesos' with: 'Balance = 45 pesos'.
	
	self assert: ((composedPortfolio retrieveSummary) = expectedSummary).
	! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'CZ 12/13/2020 12:13:01'!
test14


	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio expectedSummary |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.

	
	expectedSummary := OrderedCollection with: 'Depósito por 100 pesos' with: 'Extracción por 50 pesos' with: 'Balance = 50 pesos'.
	
	self assert: ((composedPortofolio retrieveSummary) = expectedSummary).
	! !


!classDefinition: #PortfolioTest category: 'ServiciosFinancieros2-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'LL 9/20/2020 17:09:32'!
test01PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio hasAccount: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 9/20/2020 17:09:38'!
test02PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio hasAccount: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 9/20/2020 17:09:45'!
test03PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio hasAccount: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 9/20/2020 17:09:51'!
test04ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio hasAccounts ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 9/20/2020 17:09:57'!
test05ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio hasAccounts ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 9/20/2020 17:10:03'!
test06PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify hasAccounts ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 9/20/2020 17:10:16'!
test07BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'CZ 12/13/2020 11:06:56'!
test08BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 9/20/2020 20:57:37'!
test09BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 9/20/2020 20:57:42'!
test10PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 9/20/2020 20:57:46'!
test11PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 9/20/2020 20:57:51'!
test12PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros2-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 9/20/2020 17:01:58'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 9/20/2020 20:56:59'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 9/20/2020 20:57:06'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 9/20/2020 20:57:10'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 9/20/2020 20:57:15'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 9/20/2020 20:57:20'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !


!classDefinition: #TransferNetTest category: 'ServiciosFinancieros2-Ejercicio'!
TestCase subclass: #TransferNetTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'CZ 12/13/2020 12:39:50'!
test01

	| account expectedTransferNet |
	
	account := ReceptiveAccount new.
	
	expectedTransferNet := 0*peso. 
	
	self assert: (account accountTransferNet = expectedTransferNet).! !

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'CZ 12/13/2020 12:38:35'!
test02

	| originAccount destinationAccount expectedTransferNet |
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	
	Transfer amount: 100*peso from: originAccount to: destinationAccount.
	
	expectedTransferNet := 100*peso.
	
	self assert: (destinationAccount accountTransferNet = expectedTransferNet).
	! !

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'CZ 12/13/2020 12:38:26'!
test03

	| originAccount destinationAccount expectedTransferNet |
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	
	Transfer amount: 100*peso from: originAccount to: destinationAccount.
	Transfer amount: 20*peso from: destinationAccount to: originAccount.
	
	expectedTransferNet := 80*peso.
	
	self assert: (destinationAccount accountTransferNet = expectedTransferNet).
	! !

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'CZ 12/13/2020 12:44:14'!
test04

	| account1 account2 expectedTransferNet |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Deposit register: 100*peso on: account1.
	 
	Transfer amount: 50*peso from: account2 to: account1.
	Transfer amount: 20*peso from: account1 to: account2.
	
	expectedTransferNet := 30*peso.
	
	self assert: (account1 accountTransferNet = expectedTransferNet).
	! !

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'CZ 12/13/2020 12:47:24'!
test05

	| account1 account2 expectedTransferNet |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Deposit register: 100*peso on: account1.
	Withdraw register: 10*peso on: account1.
	 
	Transfer amount: 50*peso from: account2 to: account1.
	Transfer amount: 20*peso from: account1 to: account2.
	
	expectedTransferNet := 30*peso.
	
	self assert: (account1 accountTransferNet = expectedTransferNet).
	! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros2-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #Account category: 'ServiciosFinancieros2-Ejercicio'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !


!Account methodsFor: 'composition - private' stamp: 'HAW 5/25/2019 12:24:04'!
addedTo: aPortfolio

	self subclassResponsibility ! !

!Account methodsFor: 'composition - private' stamp: 'HAW 5/25/2019 12:24:25'!
isComposedBy: anAccount

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros2-Ejercicio'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!

!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !

!Portfolio methodsFor: 'accounts management' stamp: 'LL 9/20/2020 17:05:33'!
hasAccount: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'LL 9/20/2020 17:09:01'!
hasAccounts
	
	^accounts isEmpty ! !


!Portfolio methodsFor: 'composition - private' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'composition - private' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !

!Portfolio methodsFor: 'composition - private' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'composition - private' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'composition - private' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !

!Portfolio methodsFor: 'composition - private' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !

!Portfolio methodsFor: 'composition - private' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !


!Portfolio methodsFor: 'main protocol' stamp: 'LL 9/21/2020 01:35:22'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 * peso ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !


!Portfolio methodsFor: 'as yet unclassified' stamp: 'CZ 12/13/2020 12:19:58'!
retrieveSummary

	| summary |
	summary := OrderedCollection new.
	
	accounts do: [ :anAccount | summary addAll: (anAccount retrieveSummary). summary removeLast].
	summary add: ('Balance = ', self balance asString).
	^summary.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros2-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros2-Ejercicio'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'LL 9/20/2020 17:01:23'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'LL 9/21/2020 01:35:28'!
balance

	^transactions 
		inject: 0 * peso
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'LL 9/20/2020 20:53:32'!
hasRegistered: aTransaction

	^transactions includes: aTransaction
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !


!ReceptiveAccount methodsFor: 'composition - private' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !

!ReceptiveAccount methodsFor: 'composition - private' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'CZ 12/13/2020 12:57:30'!
accountTransferNet
	
	| transferNet |
	
	transferNet := 0.	
	transactions do: [:aTransaction | (aTransaction isKindOf: TransferDepositLeg) ifTrue: [transferNet := transferNet + (aTransaction value)].
		(aTransaction isKindOf: TransferWithdrawLeg) ifTrue: [transferNet := transferNet - (aTransaction value)]].
	
	^transferNet.! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'CZ 12/13/2020 10:47:04'!
retrieveSummary

	| summary |
	summary := OrderedCollection new.
	
	transactions do: [:aTransaction | summary add: aTransaction summaryLine].
	summary add: ('Balance = ', self balance asString).
	^summary.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros2-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros2-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/21/2019 18:54:27'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros2-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'as yet unclassified' stamp: 'CZ 12/13/2020 10:43:02'!
summaryLine

	^'Depósito por ', self value asString.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros2-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros2-Ejercicio'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!

!TransferLeg methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:28:14'!
initializeWith: aTransfer

	transfer := aTransfer! !


!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'as yet unclassified' stamp: 'CZ 12/13/2020 10:32:38'!
summaryLine

	self subclassResponsibility 
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros2-Ejercicio'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros2-Ejercicio'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!

!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'as yet unclassified' stamp: 'CZ 12/13/2020 10:33:28'!
summaryLine
	
	^'Entrada por transferencia de ', self value asString.! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros2-Ejercicio'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!

!TransferWithdrawLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !


!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'as yet unclassified' stamp: 'CZ 12/13/2020 10:33:40'!
summaryLine
	
	^'Salida por transferencia de ', self value asString.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros2-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 'CZ 12/13/2020 10:22:50'!
summaryLine

	^'Extracción por ', self value asString.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros2-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transfer category: 'ServiciosFinancieros2-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros2-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'JT 12/10/2020 09:09:46'!
for: aValue

	^self new initializeFor: aValue.
	
	"(aValue isKindOf: Deposit) ifTrue: [transaction := TransferDeposit new. ]."! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'CZ 12/9/2020 18:51:21'!
register: aValue

	^Transfer for: aValue.! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'JT 12/10/2020 09:59:17'!
transferFrom: aSenderAccount to: aReceiverAccount withAmount: anAmoutToTransfer
	
	| register |
	
	register := self register: anAmoutToTransfer .
	Withdraw register: anAmoutToTransfer on: aSenderAccount.
	Deposit register: anAmoutToTransfer on: aReceiverAccount.
	TransferDeposit register: self.
	
	
	^register
	
	! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !
