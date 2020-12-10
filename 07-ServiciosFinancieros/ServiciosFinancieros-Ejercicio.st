!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

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

!PortfolioTest methodsFor: 'tests' stamp: 'CZ 12/10/2020 14:09:57'!
test07PortfolioAfterMultipleAccountsDepositHasCorrectBalance

	| account1 account2 aPortfolio |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	aPortfolio := Portfolio new.
	aPortfolio := Portfolio with: account1 with: account2 .
	
	Deposit register: 100 * peso on: account1.
	Deposit register: 200 * peso on: account2.
	
	self assert: 300 * peso equals: aPortfolio balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'CZ 12/10/2020 13:39:21'!
test08PortfolioWithTransactionsReturnsTrueWhenAskedIfAnAccountHasRegisteredATransaction

	| account1 account2 aPortfolio deposit1 deposit2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	aPortfolio := Portfolio new.
	aPortfolio := Portfolio with: account1 with: account2 .
	
	deposit1 := Deposit register: 100 * peso on: account1.
	deposit2 := Deposit register: 200 * peso on: account2.
	
	self assert: (aPortfolio hasRegistered: deposit1).! !

!PortfolioTest methodsFor: 'tests' stamp: 'CZ 12/10/2020 13:39:01'!
test09PortfolioWithoutTransactionsReturnsFalseWhenAskedIfAnAccountHasRegisteredATransaction

	| account1 account2 aPortfolio deposit1 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	aPortfolio := Portfolio new.
	aPortfolio := Portfolio with: account1 with: account2 .
	
	deposit1 := Deposit new. 
	
	self deny: (aPortfolio hasRegistered: deposit1).! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 9/20/2020 17:01:58'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 9/20/2020 20:55:33'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 9/20/2020 20:55:48'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 9/20/2020 20:55:54'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 9/20/2020 20:56:01'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 9/20/2020 20:56:08'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !


!classDefinition: #TransfersTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransfersTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransfersTest methodsFor: 'tests' stamp: 'CZ 12/10/2020 13:51:53'!
test01AccountsBalanceAfterATransferAreCorrectlyUpdated

	| senderAccount receiverAccount |
	
	senderAccount := ReceptiveAccount new.
	receiverAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: senderAccount.
	
	Transfer transferFrom: senderAccount to: receiverAccount withAmount: 100 * peso.
	
	self assert: 0 equals: senderAccount balance.
	self assert: 100 * peso equals: receiverAccount balance.
	! !

!TransfersTest methodsFor: 'tests' stamp: 'CZ 12/10/2020 14:06:29'!
test02AccountsBalanceRemainTheSameIfNoTransferIsMade

	| senderAccount receiverAccount |
	
	senderAccount := ReceptiveAccount new.
	receiverAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: senderAccount.
	Deposit register: 50 * peso on: receiverAccount.
	
	Transfer transferFrom: senderAccount to: receiverAccount withAmount: 0 * peso.
	
	self assert: 100 * peso equals: senderAccount balance.
	self assert: 50 * peso equals: receiverAccount balance.
	! !

!TransfersTest methodsFor: 'tests' stamp: 'CZ 12/10/2020 13:50:40'!
test03TransferValueAfterATransferIsCorrectlySettled

	| senderAccount receiverAccount aTransfer |
	
	senderAccount := ReceptiveAccount new.
	receiverAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: senderAccount.
	 
 	aTransfer := Transfer transferFrom: senderAccount to: receiverAccount withAmount: 100 * peso.
	
	self assert: 100 * peso equals: aTransfer value.
	
! !

!TransfersTest methodsFor: 'tests' stamp: 'CZ 12/10/2020 14:03:26'!
test04DepositTransferValueAndWithdrawTransferValueAreTheSame

	| senderAccount receiverAccount aTransfer |
	
	senderAccount := ReceptiveAccount new.
	receiverAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: senderAccount.
	 
 	aTransfer := Transfer transferFrom: senderAccount to: receiverAccount withAmount: 100 * peso.
	
	self assert: (aTransfer depositTransfer value = aTransfer withdrawTransfer value).
	
! !

!TransfersTest methodsFor: 'tests' stamp: 'CZ 12/10/2020 14:07:16'!
test05DepositTransferValueAfterATransferIsCorrectlySettled

	| senderAccount receiverAccount aTransfer |
	
	senderAccount := ReceptiveAccount new.
	receiverAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: senderAccount.
	 
 	aTransfer := Transfer transferFrom: senderAccount to: receiverAccount withAmount: 100 * peso.
	
	self assert: 100 * peso equals: (aTransfer depositTransfer value).
	
! !

!TransfersTest methodsFor: 'tests' stamp: 'CZ 12/10/2020 14:07:21'!
test06WithdrawTransferValueAfterATransferIsCorrectlySettled

	| senderAccount receiverAccount aTransfer |
	
	senderAccount := ReceptiveAccount new.
	receiverAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: senderAccount.
	 
 	aTransfer := Transfer transferFrom: senderAccount to: receiverAccount withAmount: 100 * peso.
	
	self assert: 100 * peso equals: (aTransfer withdrawTransfer value).
	
! !

!TransfersTest methodsFor: 'tests' stamp: 'CZ 12/10/2020 14:07:26'!
test07ADepositTransferLegKnowsItsCounterpart

	| senderAccount receiverAccount aTransfer |
	
	senderAccount := ReceptiveAccount new.
	receiverAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: senderAccount.
	 
 	aTransfer := Transfer transferFrom: senderAccount to: receiverAccount withAmount: 100 * peso.
	
	self assert: 100 * peso equals: (aTransfer counterpartOf: aTransfer depositTransfer with: aTransfer withdrawTransfer).
	
! !

!TransfersTest methodsFor: 'tests' stamp: 'CZ 12/10/2020 14:07:30'!
test08AWithdrawTransferLegKnowsItsCounterpart

	| senderAccount receiverAccount aTransfer |
	
	senderAccount := ReceptiveAccount new.
	receiverAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: senderAccount.
	 
 	aTransfer := Transfer transferFrom: senderAccount to: receiverAccount withAmount: 100 * peso.
	
	self assert: 100 * peso equals: (aTransfer counterpartOf: aTransfer withdrawTransfer with: aTransfer depositTransfer).
	
! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'JT 12/3/2020 21:39:20'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'as yet unclassified' stamp: 'CZ 12/10/2020 14:25:23'!
transactionValue

	^value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferDeposit category: 'ServiciosFinancieros-Ejercicio'!
Deposit subclass: #TransferDeposit
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDeposit methodsFor: 'accessing' stamp: 'CZ 12/10/2020 12:02:55'!
counterpartWith: theOtherLeg

	^theOtherLeg value.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 'CZ 12/10/2020 14:25:35'!
transactionValue

	^value negated.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferWithdraw category: 'ServiciosFinancieros-Ejercicio'!
Withdraw subclass: #TransferWithdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdraw methodsFor: 'accessing' stamp: 'CZ 12/10/2020 13:54:37'!
counterpartWith: theOtherLeg

	^theOtherLeg value.! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !


!Portfolio methodsFor: 'testing' stamp: 'LL 9/20/2020 17:05:33'!
hasAccount: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'testing' stamp: 'LL 9/20/2020 17:09:01'!
hasAccounts
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'testing' stamp: 'CZ 12/10/2020 13:12:12'!
hasRegistered: aTransaction
	
	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction].
	
	! !


!Portfolio methodsFor: 'accessing' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accessing' stamp: 'CZ 12/10/2020 12:42:58'!
balance

	^accounts sum: [:anAccount | anAccount balance]. 
	
	! !


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

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
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


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'LL 9/20/2020 17:01:23'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'CZ 12/10/2020 14:26:19'!
balance
	
	^transactions sum: [ :aTransaction | aTransaction transactionValue] ifEmpty: [ 0 * peso ].! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'LL 9/20/2020 20:48:29'!
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


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value depositTransfer withdrawTransfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'initialization' stamp: 'CZ 12/10/2020 11:45:05'!
initializeFor: aValue

	value := aValue.
	withdrawTransfer := TransferWithdraw for: aValue.
	depositTransfer := TransferDeposit for: aValue. ! !


!Transfer methodsFor: 'accessing' stamp: 'CZ 12/10/2020 12:14:14'!
counterpartOf: aLeg with: theOtherLeg

	^aLeg counterpartWith: theOtherLeg
	! !

!Transfer methodsFor: 'accessing' stamp: 'CZ 12/10/2020 11:33:49'!
depositTransfer
	
	^depositTransfer ! !

!Transfer methodsFor: 'accessing' stamp: 'CZ 12/10/2020 13:59:25'!
value

	^ value! !

!Transfer methodsFor: 'accessing' stamp: 'CZ 12/10/2020 11:33:34'!
withdrawTransfer

	^ withdrawTransfer ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'CZ 12/10/2020 10:32:20'!
for: aValue

	^self new initializeFor: aValue.
	! !


!Transfer class methodsFor: 'transfer management' stamp: 'CZ 12/10/2020 11:54:23'!
transferFrom: aSenderAccount to: aReceiverAccount withAmount: anAmoutToTransfer
	
	| register |
	
	register := self for: anAmoutToTransfer .
	
	TransferWithdraw register: anAmoutToTransfer on: aSenderAccount.
	TransferDeposit register: anAmoutToTransfer on: aReceiverAccount.
	
	^register
	
	! !
