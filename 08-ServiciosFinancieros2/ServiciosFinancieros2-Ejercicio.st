!classDefinition: #AccountSummaryTest category: 'ServiciosFinancieros2-Ejercicio'!
TestCase subclass: #AccountSummaryTest
	instanceVariableNames: 'summaryReport'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!

!AccountSummaryTest methodsFor: 'setUp' stamp: 'JT 12/16/2020 20:54:40'!
setUp
	
	summaryReport _ AccountSummary new.! !


!AccountSummaryTest methodsFor: 'tests' stamp: 'JT 12/16/2020 20:55:01'!
test01SummaryOfAnAccountWithoutTransactionsIsCorrect

	| account expectedSummary |
	
	account _ ReceptiveAccount new.
	
	expectedSummary _ OrderedCollection with: 'Balance = 0 pesos'.
	
	self assert: ((account retrieveReport: summaryReport) = expectedSummary).! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'JT 12/16/2020 20:55:12'!
test02SummaryOfAnAccountWithADepositIsCorrect

	| account expectedSummary |
	
	account _ ReceptiveAccount new.
	Deposit register: 100 * peso  on: account.
	
	expectedSummary _ OrderedCollection with: 'Depósito por 100 pesos' with: 'Balance = 100 pesos'.
	
	self assert: ((account retrieveReport: summaryReport) = expectedSummary).! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'JT 12/16/2020 20:55:20'!
test03SummaryOfAnAccountWithAWithdrawIsCorrect

	| account expectedSummary |
	
	account _ ReceptiveAccount new.
	Withdraw register: 50 * peso  on: account.
	
	expectedSummary _ OrderedCollection with: 'Extracción por 50 pesos' with: 'Balance = -50 pesos'.
	
	self assert: ((account retrieveReport: summaryReport) = expectedSummary).! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'JT 12/16/2020 20:55:41'!
test04SummaryOfAnAccountWithAnOutgoingTransferIsCorrect

	| originAccount destinationAccount expectedSummary |
	
	originAccount _ ReceptiveAccount new.
	destinationAccount _ ReceptiveAccount new.
	Transfer amount: 10 * peso from: originAccount to: destinationAccount.
	
	expectedSummary _ OrderedCollection with: 'Salida por transferencia de 10 pesos' with: 'Balance = -10 pesos'.
	
	self assert: ((originAccount retrieveReport: summaryReport) = expectedSummary).! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'JT 12/16/2020 20:55:38'!
test05SummaryOfAnAccountWithAnIncomingTransferIsCorrect

	| originAccount destinationAccount expectedSummary |
	
	originAccount _ ReceptiveAccount new.
	destinationAccount _ ReceptiveAccount new.
	Transfer amount: 10 * peso from: originAccount to: destinationAccount.
	
	expectedSummary _ OrderedCollection with: 'Entrada por transferencia de 10 pesos' with: 'Balance = 10 pesos'.
	
	self assert: ((destinationAccount retrieveReport: summaryReport) = expectedSummary).! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'JT 12/16/2020 20:55:54'!
test06SummaryOfAnAccountWithMultipleTransactionsIsCorrect

	| account1 account2 expectedSummary |
	
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	Deposit register: 100 * peso  on: account2.
	Deposit register: 50 * peso  on: account2.
	Withdraw register: 20 * peso  on: account2.
	Transfer amount: 50 * peso from: account2 to: account1.
	Transfer amount: 10 * peso from: account1 to: account2.
	
	expectedSummary _ OrderedCollection with: 'Depósito por 100 pesos' with: 'Depósito por 50 pesos' with: 'Extracción por 20 pesos' with: 'Salida por transferencia de 50 pesos' with: 'Entrada por transferencia de 10 pesos' with: 'Balance = 90 pesos'.
	
	self assert: ((account2 retrieveReport: summaryReport) = expectedSummary).! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'JT 12/16/2020 20:56:03'!
test07SummaryOfAnEmptyPortfolioIsCorrect

	|aPortfolio expectedSummary|
	
	aPortfolio _ Portfolio new.
	
	expectedSummary _ OrderedCollection with: 'Balance = 0 pesos'.
	
	self assert: ((aPortfolio retrieveReport: summaryReport) = expectedSummary).
	! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'JT 12/16/2020 20:56:19'!
test08SummaryOfAPortfolioWithAnAccountWithADepositIsCorrect

	| aPortfolio account expectedSummary |
	
	account _ ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	aPortfolio _ Portfolio with: account.
	
	expectedSummary _ OrderedCollection with: 'Depósito por 100 pesos' with: 'Balance = 100 pesos'.
	
	self assert: ((aPortfolio retrieveReport: summaryReport) = expectedSummary).
	! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'JT 12/16/2020 20:56:32'!
test09SummaryOfAPortfolioWithAnAccountWithAWithdrawIsCorrect

	| aPortfolio account expectedSummary |
	
	account _ ReceptiveAccount new.
	Withdraw register: 50 * peso on: account.
	aPortfolio _ Portfolio with: account.
	
	expectedSummary _ OrderedCollection with: 'Extracción por 50 pesos' with: 'Balance = -50 pesos'.
	
	self assert: ((aPortfolio retrieveReport: summaryReport) = expectedSummary).
	! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'JT 12/16/2020 20:56:46'!
test10SummaryOfAPortfolioWithAnAccountWithAnOutgoingTransferIsCorrect

	| aPortfolio originAccount destinationAccount expectedSummary |
	
	originAccount _ ReceptiveAccount new.
	destinationAccount _ ReceptiveAccount new.
	Transfer amount: 10 * peso from: originAccount to: destinationAccount.
	aPortfolio _ Portfolio with: originAccount.
	
	
	expectedSummary _ OrderedCollection with: 'Salida por transferencia de 10 pesos' with: 'Balance = -10 pesos'.
	
	self assert: ((aPortfolio retrieveReport: summaryReport) = expectedSummary).
	! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'JT 12/16/2020 20:57:04'!
test11SummaryOfAPortfolioWithAnAccountWithAnIncomingTransferIsCorrect

	| aPortfolio originAccount destinationAccount expectedSummary |
	
	originAccount _ ReceptiveAccount new.
	destinationAccount _ ReceptiveAccount new.
	Transfer amount: 10 * peso from: originAccount to: destinationAccount.
	aPortfolio _ Portfolio with: destinationAccount.
	
	
	expectedSummary _ OrderedCollection with: 'Entrada por transferencia de 10 pesos' with: 'Balance = 10 pesos'.
	
	self assert: ((aPortfolio retrieveReport: summaryReport) = expectedSummary).! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'JT 12/16/2020 20:57:20'!
test12SummaryOfAPortfolioWithAnAccountWithMultipleTransactionsIsCorrect

	| aPortfolio account1 account2 expectedSummary |
	
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	Deposit register: 100 * peso on: account1.
	Deposit register: 50 * peso on: account1.
	Withdraw register: 50 * peso on: account1.
	Transfer amount: 10 * peso from: account1 to: account2.
	Transfer amount: 20 * peso from: account2 to: account1.
	aPortfolio _ Portfolio with: account1.
	
	expectedSummary _ OrderedCollection with: 'Depósito por 100 pesos' with: 'Depósito por 50 pesos'  with: 'Extracción por 50 pesos' with: 'Salida por transferencia de 10 pesos' with: 'Entrada por transferencia de 20 pesos' with: 'Balance = 110 pesos'.
	
	self assert: ((aPortfolio retrieveReport: summaryReport) = expectedSummary).
	! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'JT 12/16/2020 20:57:35'!
test13SummaryOfAPortfolioComposedByASimplePortfolioWithAnAccountWithTransactionsIsCorrect
	
	| account simplePortfolio composedPortfolio expectedSummary |
	
	account _ ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 55 * peso on: account.
	simplePortfolio _ Portfolio with: account.
	composedPortfolio _ Portfolio with: simplePortfolio.
	
	expectedSummary _ OrderedCollection with: 'Depósito por 100 pesos' with: 'Extracción por 55 pesos' with: 'Balance = 45 pesos'.
	
	self assert: ((composedPortfolio retrieveReport: summaryReport) = expectedSummary).
	! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'JT 12/16/2020 20:57:54'!
test14SummaryOfAPortfolioComposedByAnAccountAndASimplePortfolioWithAnAccountWithTransactionsIsCorrect

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio expectedSummary |
	
	simplePortfolioAccount _ ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio _ Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount _ ReceptiveAccount new.
	Withdraw register: 50 * peso on: simplePortfolioAccount.
	composedPortofolio _ Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	Transfer amount: 10*peso from: simplePortfolioAccount to: composedPortfolioAccount.

	expectedSummary _ OrderedCollection with: 'Depósito por 100 pesos' with: 'Extracción por 50 pesos' with: 'Salida por transferencia de 10 pesos' with: 'Entrada por transferencia de 10 pesos' with: 'Balance = 50 pesos'.
	
	self assert: ((composedPortofolio retrieveReport: summaryReport) = expectedSummary).
	! !


!classDefinition: #PortfolioTest category: 'ServiciosFinancieros2-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'JT 12/16/2020 20:59:12'!
test01PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account _ ReceptiveAccount new.
	portfolio _ Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio hasAccount: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'JT 12/16/2020 20:59:20'!
test02PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account _ ReceptiveAccount new.
	simplePortfolio _ Portfolio with: account.
	composedPortfolio _ Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio hasAccount: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'JT 12/16/2020 20:59:27'!
test03PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account _ ReceptiveAccount new.
	simplePortfolio _ Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio hasAccount: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'JT 12/16/2020 20:59:52'!
test04ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account _ ReceptiveAccount new.
	simplePortfolio _ Portfolio new.
	composedPortfolio _ Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio hasAccounts ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'JT 12/16/2020 21:00:21'!
test05ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account _ ReceptiveAccount new.
	portfolio _ Portfolio new.
	leftParentPortfolio _ Portfolio with: portfolio .
	leftRootParentPortfolio _ Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio _ Portfolio with: portfolio .
	rightRootParentPortfolio _ Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio hasAccounts ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'JT 12/16/2020 21:00:33'!
test06PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount _ ReceptiveAccount new.
	portfolioToModify _ Portfolio new.
	rootPortfolio _ Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd _ Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify hasAccounts ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 9/20/2020 17:10:16'!
test07BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'JT 12/16/2020 21:01:02'!
test08BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account _ ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio _ Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'JT 12/16/2020 21:01:13'!
test09BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount _ ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio _ Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount _ ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio _ Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 9/20/2020 20:57:42'!
test10PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'JT 12/16/2020 21:01:25'!
test11PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account _ ReceptiveAccount new.
	deposit _ Deposit register: 100 * peso on: account.
	portfolio _ Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'JT 12/16/2020 21:01:48'!
test12PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount _ ReceptiveAccount new.
	simplePortfolioAccountDeposit _ Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio _ Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount _ ReceptiveAccount new.
	composedPortfolioAccountWithdraw _ Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio _ Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros2-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'JT 12/16/2020 21:01:55'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account _ ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'JT 12/16/2020 21:02:02'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account _ ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'JT 12/16/2020 21:02:20'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account _ ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'JT 12/16/2020 21:02:26'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account _ ReceptiveAccount new.
	withdrawValue _ 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'JT 12/16/2020 21:02:35'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account _ ReceptiveAccount new.
	deposit _ Deposit register: 100 * peso on: account.
	withdraw _ Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'JT 12/16/2020 21:02:44'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account _ ReceptiveAccount new.
	deposit _ Deposit for: 100 * peso.
	withdraw _ Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !


!classDefinition: #TransferNetTest category: 'ServiciosFinancieros2-Ejercicio'!
TestCase subclass: #TransferNetTest
	instanceVariableNames: 'transferNetReport'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!

!TransferNetTest methodsFor: 'setUp' stamp: 'JT 12/16/2020 20:53:04'!
setUp

	transferNetReport _ TransferNet new.! !


!TransferNetTest methodsFor: 'tests' stamp: 'JT 12/16/2020 21:05:23'!
test01TransferNetOfAnAccountWithoutTransactionsIsZero

	| account expectedTransferNet |
	
	account _ ReceptiveAccount new.
	
	expectedTransferNet _ 0*peso. 
	
	self assert: ((account retrieveReport: transferNetReport) = expectedTransferNet).! !

!TransferNetTest methodsFor: 'tests' stamp: 'JT 12/16/2020 21:05:34'!
test02TransferNetOfAnAccountWithAnIncomingTransferIsTheIncomingTransfer

	| originAccount destinationAccount expectedTransferNet |
	
	originAccount _ ReceptiveAccount new.
	destinationAccount _ ReceptiveAccount new.
	
	Transfer amount: 100*peso from: originAccount to: destinationAccount.
	
	expectedTransferNet _ 100*peso.
	
	self assert: ((destinationAccount retrieveReport: transferNetReport) = expectedTransferNet).
	! !

!TransferNetTest methodsFor: 'tests' stamp: 'JT 12/16/2020 21:05:54'!
test03TransferNetOfAnAccountWithAnOutgoingTransferIsTheOutgoingTransferNegated

	| originAccount destinationAccount expectedTransferNet |
	
	originAccount _ ReceptiveAccount new.
	destinationAccount _ ReceptiveAccount new.
	
	Transfer amount: 20*peso from: originAccount to: destinationAccount.
	
	expectedTransferNet _ -20*peso.
	
	self assert: ((originAccount retrieveReport: transferNetReport) = expectedTransferNet).
	! !

!TransferNetTest methodsFor: 'tests' stamp: 'JT 12/16/2020 21:05:49'!
test04TransferNetOfAnAccountWithMultipleTransactionsIsCorrect

	| account1 account2 expectedTransferNet |
	
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	
	Deposit register: 100*peso on: account1.
	Withdraw register: 10*peso on: account1.
	 
	Transfer amount: 50*peso from: account2 to: account1.
	Transfer amount: 20*peso from: account1 to: account2.
	
	expectedTransferNet _ 30*peso.
	
	self assert: ((account1 retrieveReport: transferNetReport) = expectedTransferNet).
	! !

!TransferNetTest methodsFor: 'tests' stamp: 'JT 12/16/2020 21:07:28'!
test05TransferNetOfAnEmptyPortfolioIsZero

	| aPortfolio expectedTransferNet |
	
	aPortfolio _ Portfolio new.
	
	expectedTransferNet _ 0*peso.
	
	self assert: ((aPortfolio retrieveReport: transferNetReport) = expectedTransferNet).
	! !

!TransferNetTest methodsFor: 'tests' stamp: 'JT 12/16/2020 21:07:26'!
test06TransferNetOfAPortfolioWithAnAccountWithAnIncomingTransferIsTheIncomingTransfer

	| aPortfolio originAccount destinationAccount  expectedTransferNet |
	
	originAccount _ ReceptiveAccount new.
	destinationAccount _ ReceptiveAccount new.
	
	Transfer amount: 100*peso from: originAccount to: destinationAccount.
	
	aPortfolio _ Portfolio with: destinationAccount.
	
	expectedTransferNet _ 100*peso.
	
	self assert: ((aPortfolio retrieveReport: transferNetReport) = expectedTransferNet).
	! !

!TransferNetTest methodsFor: 'tests' stamp: 'JT 12/16/2020 21:07:21'!
test07TransferNetOfAPortfolioWithAnAccountWithAnOutgoingTransferIsTheOutgoingTransferNegated

	| aPortfolio destinationAccount originAccount  expectedTransferNet |
	
	originAccount _ ReceptiveAccount new.
	destinationAccount _ ReceptiveAccount new.
	
	Transfer amount: 20*peso from: originAccount to: destinationAccount.
	
	aPortfolio _ Portfolio with: originAccount.
	
	expectedTransferNet _ -20*peso.
	
	self assert: ((aPortfolio retrieveReport: transferNetReport) = expectedTransferNet).
	! !

!TransferNetTest methodsFor: 'tests' stamp: 'JT 12/16/2020 21:07:17'!
test08TransferNetOfAPortfolioWithAnAccountWithMultipleTransactionsIsCorrect

	| aPortfolio account1 account2  expectedTransferNet |
	
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	
	Deposit register: 100*peso on: account2.
	Withdraw register: 50*peso on: account2.
	Transfer amount: 100*peso from: account1 to: account2.
	Transfer amount: 30*peso from: account2 to: account1.
	
	aPortfolio _ Portfolio with: account2.
	
	expectedTransferNet _ 70*peso.
	
	self assert: ((aPortfolio retrieveReport: transferNetReport) = expectedTransferNet).
	! !

!TransferNetTest methodsFor: 'tests' stamp: 'JT 12/16/2020 21:06:55'!
test09TransferNetOfAPortfolioWithAccountsTransferingEachOtherIsZero

	| aPortfolio account1 account2  expectedTransferNet |
	
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	
	Transfer amount: 300*peso from: account1 to: account2.
	Transfer amount: 50*peso from: account2 to: account1.
	
	aPortfolio _ Portfolio with: account1 with: account2.
	
	expectedTransferNet _ 0*peso.
	
	self assert: ((aPortfolio retrieveReport: transferNetReport) = expectedTransferNet).
	! !

!TransferNetTest methodsFor: 'tests' stamp: 'JT 12/16/2020 21:07:10'!
test10TransferNetOfAPortfolioComposedByASimplePortfolioWithAnAccountWithAnIncomingTransferIsTheIncomingTransfer

	| originAccount destinationAccount simplePortfolio composedPortfolio expectedTransferNet |
	
	originAccount _ ReceptiveAccount new.
	destinationAccount _ ReceptiveAccount new.
	
	Transfer amount: 300*peso from: originAccount to: destinationAccount.
	
	simplePortfolio _ Portfolio with: destinationAccount.
	composedPortfolio _ Portfolio with: simplePortfolio.

	expectedTransferNet _ 300*peso.
	
	self assert: ((composedPortfolio retrieveReport: transferNetReport) = expectedTransferNet).
	! !

!TransferNetTest methodsFor: 'tests' stamp: 'JT 12/16/2020 21:07:48'!
test11TransferNetOfAPortfolioComposedByAccountsTransferingEachOtherIsZero

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio expectedTransferNet |
	
	simplePortfolioAccount _ ReceptiveAccount new.
	simplePortfolio _ Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount _ ReceptiveAccount new.
	Transfer amount: 40*peso from: simplePortfolioAccount to: composedPortfolioAccount.
	
	composedPortfolio _ Portfolio with: simplePortfolio with: composedPortfolioAccount.

	expectedTransferNet _ 0*peso.
	
	self assert: ((composedPortfolio retrieveReport: transferNetReport) = expectedTransferNet).
	! !

!TransferNetTest methodsFor: 'tests' stamp: 'JT 12/16/2020 21:08:03'!
test12TransferNetOfAPortolioWithAccountsAndAnExternalIncomingTransferIsAlwaysPositive

	| aPortfolio account1 account2 account3 expectedTransferNet |
	
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	account3 _ ReceptiveAccount new.
	
	Transfer amount: 100*peso from: account3 to: account2.
	Transfer amount: 30*peso from: account3 to: account1.
	
	aPortfolio _ Portfolio with: account1 with: account2.

	expectedTransferNet _ 130*peso.
	
	self assert: ((aPortfolio retrieveReport: transferNetReport) = expectedTransferNet).
	! !

!TransferNetTest methodsFor: 'tests' stamp: 'JT 12/16/2020 21:08:20'!
test13TransferNetOfAPortolioWithAccountsAndAnExternalOutgoingTransferIsAlwaysNegative

	| aPortfolio account1 account2 account3 expectedTransferNet |
	
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	account3 _ ReceptiveAccount new.
	
	Transfer amount: 100*peso from: account2 to: account3.
	Transfer amount: 30*peso from: account1 to: account3.
	
	aPortfolio _ Portfolio with: account1 with: account2.

	expectedTransferNet _ -130*peso.
	
	self assert: ((aPortfolio retrieveReport: transferNetReport) = expectedTransferNet).
	! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros2-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!

!TransferTest methodsFor: 'tests' stamp: 'JT 12/16/2020 21:08:38'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount _ ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount _ ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'tests' stamp: 'JT 12/16/2020 21:09:13'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount _ ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount _ ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer _ Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'tests' stamp: 'JT 12/16/2020 21:09:27'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount _ ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount _ ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer _ Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'tests' stamp: 'JT 12/16/2020 21:09:36'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount _ ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount _ ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer _ Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'tests' stamp: 'JT 12/16/2020 21:09:41'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount _ ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'tests' stamp: 'JT 12/16/2020 21:09:47'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount _ ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount _ ReceptiveAccount new.
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

!Portfolio methodsFor: 'initialization' stamp: 'JT 12/16/2020 20:53:42'!
initialize

	accounts _ OrderedCollection new.
	parents _ OrderedCollection new.! !


!Portfolio methodsFor: 'accounts management' stamp: 'JT 12/16/2020 19:18:58'!
accounts

	^accounts ! !

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

!Portfolio methodsFor: 'composition - private' stamp: 'JT 12/16/2020 20:54:00'!
rootParents
	
	| rootParents |
	
	rootParents _ Set new.
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

!Portfolio methodsFor: 'main protocol' stamp: 'JT 12/16/2020 20:07:47'!
retrieveReport: aReport

	^aReport retrieveReportForAPortfolio: self.! !

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

!ReceptiveAccount methodsFor: 'initialization' stamp: 'JT 12/16/2020 20:54:25'!
initialize

	transactions _ OrderedCollection new.! !


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

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'JT 12/16/2020 20:05:14'!
retrieveReport: aReport

	^aReport retrieveReportForAReceptiveAccount: self.! !


!ReceptiveAccount methodsFor: 'transactions management' stamp: 'JT 12/16/2020 19:17:02'!
transactions
	
	^transactions ! !


!ReceptiveAccount methodsFor: 'composition - private' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !

!ReceptiveAccount methodsFor: 'composition - private' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


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


!AccountTransaction methodsFor: 'reports' stamp: 'JT 12/14/2020 21:16:36'!
affectTransferNet: aTransferNet
	
	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'reports' stamp: 'JT 12/16/2020 20:19:35'!
retrieveSummaryLineFor: aSummaryReport
	
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

!Deposit methodsFor: 'initialization' stamp: 'JT 12/16/2020 20:58:13'!
initializeFor: aValue

	value _ aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'reports' stamp: 'JT 12/16/2020 20:47:24'!
affectTransferNet: aTransferNet

	^aTransferNet.! !

!Deposit methodsFor: 'reports' stamp: 'JT 12/16/2020 20:19:35'!
retrieveSummaryLineFor: aSummaryReport

	^aSummaryReport summaryLineForDeposit: self.
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

!TransferLeg methodsFor: 'initialization' stamp: 'JT 12/16/2020 20:58:23'!
initializeWith: aTransfer

	transfer _ aTransfer! !


!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !

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


!TransferDepositLeg methodsFor: 'reports' stamp: 'JT 12/16/2020 20:47:52'!
affectTransferNet: aTransferNet

	^aTransferNet + self value.! !

!TransferDepositLeg methodsFor: 'reports' stamp: 'JT 12/16/2020 20:19:35'!
retrieveSummaryLineFor: aSummaryReport
	
	^aSummaryReport summaryLineForTransferDepositLeg: self.! !


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


!TransferWithdrawLeg methodsFor: 'reports' stamp: 'JT 12/16/2020 20:47:57'!
affectTransferNet: aTransferNet

	^aTransferNet - self value.! !

!TransferWithdrawLeg methodsFor: 'reports' stamp: 'JT 12/16/2020 20:19:35'!
retrieveSummaryLineFor: aSummaryReport
	
	^aSummaryReport summaryLineForTransferWithdrawLeg: self.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros2-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'JT 12/16/2020 20:59:01'!
initializeFor: aValue

	value _ aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'reports' stamp: 'JT 12/16/2020 20:58:52'!
affectTransferNet: aTransferNet

	^aTransferNet.! !

!Withdraw methodsFor: 'reports' stamp: 'JT 12/16/2020 20:19:35'!
retrieveSummaryLineFor: aSummaryReport
	
	^aSummaryReport summaryLineForWithdraw: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros2-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Report category: 'ServiciosFinancieros2-Ejercicio'!
Object subclass: #Report
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!

!Report methodsFor: 'as yet unclassified' stamp: 'JT 12/16/2020 20:25:27'!
retrieveReportForAPortfolio: aPortfolio

	self subclassResponsibility ! !

!Report methodsFor: 'as yet unclassified' stamp: 'JT 12/16/2020 20:25:44'!
retrieveReportForAReceptiveAccount: aReceptiveAccount

	self subclassResponsibility ! !


!classDefinition: #AccountSummary category: 'ServiciosFinancieros2-Ejercicio'!
Report subclass: #AccountSummary
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!

!AccountSummary methodsFor: 'account summary management' stamp: 'JT 12/16/2020 21:03:19'!
retrieveReportForAPortfolio: aPortfolio
	
	| summary |
	
	summary _ OrderedCollection new.
	
	aPortfolio accounts do: [ :anAccount | summary addAll: (anAccount retrieveReport: self). summary removeLast].
	summary add: ('Balance = ', aPortfolio balance asString).
	
	^summary
! !

!AccountSummary methodsFor: 'account summary management' stamp: 'JT 12/16/2020 21:03:16'!
retrieveReportForAReceptiveAccount: aReceptiveAccount

	| summary |
	
	summary _ OrderedCollection new.
	
	aReceptiveAccount transactions do: [:aTransaction | summary add: (aTransaction retrieveSummaryLineFor: self)].
	summary add: ('Balance = ', aReceptiveAccount balance asString).
	
	^summary.! !

!AccountSummary methodsFor: 'account summary management' stamp: 'JT 12/16/2020 19:44:36'!
summaryLineForDeposit: aDeposit

	^'Depósito por ', aDeposit value asString.! !

!AccountSummary methodsFor: 'account summary management' stamp: 'JT 12/16/2020 19:44:52'!
summaryLineForTransferDepositLeg: aTransferDepositLeg

	^'Entrada por transferencia de ', aTransferDepositLeg value asString.! !

!AccountSummary methodsFor: 'account summary management' stamp: 'JT 12/16/2020 19:45:03'!
summaryLineForTransferWithdrawLeg: aTransferWithdrawLeg

	^'Salida por transferencia de ', aTransferWithdrawLeg value asString.! !

!AccountSummary methodsFor: 'account summary management' stamp: 'JT 12/16/2020 19:45:11'!
summaryLineForWithdraw: aWithdraw

	^'Extracción por ', aWithdraw value asString.! !


!classDefinition: #TransferNet category: 'ServiciosFinancieros2-Ejercicio'!
Report subclass: #TransferNet
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!

!TransferNet methodsFor: 'transfer net management' stamp: 'JT 12/16/2020 20:41:54'!
retrieveReportForAPortfolio: aPortfolio
	
	^aPortfolio accounts sum: [ :anAccount | anAccount retrieveReport: self ] ifEmpty: [ 0 * peso ].! !

!TransferNet methodsFor: 'transfer net management' stamp: 'JT 12/16/2020 21:03:38'!
retrieveReportForAReceptiveAccount: aReceptiveAccount

	| transferNet |
	
	transferNet _ aReceptiveAccount transactions 
		inject: 0 * peso
		into: [:sumTransferNet :aTransaction | aTransaction affectTransferNet: sumTransferNet.].
		
	^transferNet.
! !


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


!Transfer methodsFor: 'initialization' stamp: 'JT 12/16/2020 21:05:08'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value _ aValue.
	withdrawLeg _ aWithdraw.
	depositLeg _ aDeposit! !

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
