!classDefinition: #CartTest category: 'TusLibros-Ejercicio'!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!CartTest methodsFor: 'tests' stamp: 'CZ 2/10/2021 23:17:09'!
test01ACartIsCreatedEmpty
	
	| aCart |
	
	aCart _ Cart new.
	
	self assert: (aCart isEmpty).! !

!CartTest methodsFor: 'tests' stamp: 'CZ 2/11/2021 13:33:18'!
test02ABookIsAddedAndTheCartIsNotEmptyAnymore
	
	| aCart aBookIsbn |
	
	aCart _ Cart new.
	aBookIsbn _ 9789877250244.
	
	aCart addBook: aBookIsbn quantity: 1.
	
	self deny: (aCart isEmpty).! !

!CartTest methodsFor: 'tests' stamp: 'CZ 2/11/2021 13:33:55'!
test03MultipleBooksAreAddedAndTheCartIsNotEmptyAnymore
	
	| aCart book1Isbn book2Isbn |
	
	aCart _ Cart new.
	book1Isbn _ 9789877250244.
	book2Isbn _ 9789585118300.
	
	aCart addBook: book1Isbn quantity: 1.
	aCart addBook: book2Isbn quantity: 1.
	
	self deny: (aCart isEmpty).! !

!CartTest methodsFor: 'tests' stamp: 'CZ 2/11/2021 13:34:26'!
test04MultipleBooksAreAddedAndTheyAreStoredInTheCart
	
	| aCart book1Isbn book2Isbn |
	
	aCart _ Cart new.
	book1Isbn _ 9789877250244.
	book2Isbn _ 9789585118300.
	
	aCart addBook: book1Isbn quantity: 1.
	aCart addBook: book2Isbn quantity: 1.
	
	self assert: (aCart hasBook: book1Isbn).
	self assert: (aCart hasBook: book2Isbn).! !

!CartTest methodsFor: 'tests' stamp: 'CZ 2/11/2021 13:34:46'!
test05ABookThatIsNotAddedIsNotStoredInTheCart
	
	| aCart book1Isbn book2Isbn |
	
	aCart _ Cart new.
	book1Isbn _ 9789877250244.
	book2Isbn _ 9789585118300.
	
	aCart addBook: book1Isbn quantity: 1.
	
	self assert: (aCart hasBook: book1Isbn).
	self deny: (aCart hasBook: book2Isbn).! !

!CartTest methodsFor: 'tests' stamp: 'CZ 2/11/2021 13:35:19'!
test06ABookIsAddedMoreThanOnceAndTheNumberOfCopiesAndSizeOfCartAreCorrect
	
	| aCart book1Isbn book2Isbn |
	
	aCart _ Cart new.
	book1Isbn _ 9789877250244.
	book2Isbn _ 9789585118300.
	
	aCart addBook: book1Isbn quantity: 2.
	aCart addBook: book2Isbn quantity: 1.
	
	self assert: (aCart size = 3).
	self assert: ((aCart numberOfCopiesOf: book1Isbn) = 2).
	self assert: ((aCart numberOfCopiesOf: book2Isbn) = 1).
! !

!CartTest methodsFor: 'tests' stamp: 'CZ 2/11/2021 13:35:45'!
test07BookQuantityCannotBeLessThanOne
	
	| aCart aBookIsbn |
	
	aCart _ Cart new.
	aBookIsbn _ 9789877250244.
	
	self 
        should: [ aCart addBook: aBookIsbn quantity: 0 ]
        raise: Error
        asserting: [ :anError |
		self assert: anError messageText = Cart quantityCannotBeLessThanOneErrorMessage.
		self assert: aCart isEmpty].
	
	
! !

!CartTest methodsFor: 'tests' stamp: 'CZ 2/11/2021 13:36:08'!
test08AnInvalidBookIsbnCannotBeAddedToTheCart
	
	| aCart aBookIsbn |
	
	aCart _ Cart new.
	aBookIsbn _ 9789721091651.
	
	self 
        should: [ aCart addBook: aBookIsbn quantity: 1 ]
        raise: Error
        asserting: [ :anError |
		self assert: anError messageText = Cart invalidIsbnCannotBeAddedToCartErrorMessage.
		self assert: aCart isEmpty.
		self deny: (aCart hasBook: aBookIsbn)].
	
	
! !

!CartTest methodsFor: 'tests' stamp: 'CZ 2/11/2021 13:36:40'!
test09ACartKnowsItsContent
	
	| aCart book1Isbn book2Isbn expectedBooksInCart |
	
	aCart _ Cart new.
	book1Isbn _ 9789877250244.
	book2Isbn _ 9789585118300.
	
	aCart addBook: book1Isbn quantity: 2.
	aCart addBook: book2Isbn quantity: 1.
	
	expectedBooksInCart _ OrderedCollection with: book1Isbn with: book1Isbn with: book2Isbn.
	
	self assert: (aCart booksStored = expectedBooksInCart).
	! !


!CartTest methodsFor: 'assertions' stamp: 'CZ 2/11/2021 00:13:25'!
should: aBlockThatShouldFail raise: anExceptionType asserting: aVerificationBlock

	[ aBlockThatShouldFail value.
    	self fail ]
        		on: anExceptionType 
       		do: aVerificationBlock! !


!classDefinition: #CashierTest category: 'TusLibros-Ejercicio'!
TestCase subclass: #CashierTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!CashierTest methodsFor: 'as yet unclassified' stamp: 'JT 2/11/2021 21:35:30'!
should: aBlockThatShouldFail raise: anExceptionType asserting: aVerificationBlock

	[ aBlockThatShouldFail value.
    	self fail ]
        		on: anExceptionType 
       		do: aVerificationBlock! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'CZ 2/17/2021 19:33:11'!
test01CheckOutCannotBeExecutedWithEmptyCart

	| aCart cced ccn cco aCashier |
	
	aCart _ Cart new.
	aCashier _ Cashier new.

	ccn _ 12345.
	cced _ '022023'.
	cco _ 'Marcela'.
	
	self 
        should: [ aCashier checkOutCart: aCart withCreditCardNumber: ccn andExpirationDate: cced andOwnersName:cco. ]
        raise: Error
        asserting: [ :anError |
		self assert: Cashier checkOutCannotBeExecutedWithEmptyCartErrorMessage equals: anError messageText].
	
	

	! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'CZ 2/17/2021 19:33:18'!
test02CheckOutWithOneBookCanBeExecuted

	| aCart aBook1Isbn cced ccn cco aCashier |
	
	aCart _ Cart new.
	aCashier _ Cashier new.
	
	aBook1Isbn _ 9789877250244.
	ccn _ 12345.
	cced _ '022023'.
	cco _ 'Marcela'.
	
	aCart addBook: aBook1Isbn quantity: 1.
	aCashier checkOutCart: aCart withCreditCardNumber: ccn andExpirationDate: cced andOwnersName: cco.
	
	self assert: aCart isEmpty.
	self assert: 1000.5*peso equals: aCashier transactionAmount.
	
	! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'CZ 2/17/2021 19:33:23'!
test03CheckOutWithMultipleBooksCanBeExecuted

	| aCart cced ccn cco aCashier book1Isbn book2Isbn |
	
	aCart _ Cart new.
	aCashier _ Cashier new.
	
	book1Isbn _ 9789877250244.
	book2Isbn _ 9789585118300.
	ccn _ 12345.
	cced _ '022023'.
	cco _ 'Marcela'.
	
	aCart addBook: book1Isbn quantity: 3.
	aCart addBook: book2Isbn quantity: 2.
	aCashier checkOutCart: aCart withCreditCardNumber: ccn andExpirationDate: cced andOwnersName: cco.
	
	self assert: aCart isEmpty.
	self assert: 5001.48*peso equals: aCashier transactionAmount.
	
	! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'CZ 2/17/2021 19:15:51'!
test04CashierCanIssueTheBillAfterCheckOut

	| aCart cced ccn cco aCashier book1Isbn book2Isbn expectedBill |
	
	aCart _ Cart new.
	aCashier _ Cashier new.
	
	book1Isbn _ 9789877250244.
	book2Isbn _ 9789585118300.
	ccn _ 12345.
	cced _ '022023'.
	cco _ 'Marcela'.
	
	aCart addBook: book1Isbn quantity: 1.
	aCart addBook: book2Isbn quantity: 2.
	aCashier checkOutCart: aCart withCreditCardNumber: ccn andExpirationDate: cced andOwnersName: cco.
	
	expectedBill _ Dictionary with: 9789877250244->(1000.5*peso) with: 9789585118300->(999.99*peso) with: 9789585118300->(999.99*peso).
	
	self assert: expectedBill equals: aCashier issuedBill.
	
	! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'CZ 2/17/2021 19:33:30'!
test05CheckOutCannotBeExecutedWithExpiredCreditCard

	| aCart cced ccn cco aCashier book1Isbn book2Isbn |
	
	aCart _ Cart new.
	aCashier _ Cashier new.
	
	book1Isbn _ 9789877250244.
	book2Isbn _ 9789585118300.
	ccn _ 12345.
	cced _ '022000'.
	cco _ 'Marcela'.
	
	aCart addBook: book1Isbn quantity: 1.
	aCart addBook: book2Isbn quantity: 2.
	
	self 
        should: [ aCashier checkOutCart: aCart withCreditCardNumber: ccn andExpirationDate: cced andOwnersName:cco. ]
        raise: Error
        asserting: [ :anError |
		self assert: Cashier checkOutCannotBeExecutedWithExpiredCreditCardErrorMessage equals: anError messageText].
	
	! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'CZ 2/17/2021 19:21:20'!
test06CheckOutCannotBeExecutedWithCreditCardOwnersNameLongerThanThirtyCharacters
	
	| aCart cced ccn cco aCashier book1Isbn book2Isbn |
	
	aCart _ Cart new.
	aCashier _ Cashier new.
	
	book1Isbn _ 9789877250244.
	book2Isbn _ 9789585118300.
	ccn _ 12345.
	cced _ '022050'.
	cco _ 'un nombre cualquiera de la tarjeta de credito'.
	
	aCart addBook: book1Isbn quantity: 1.
	aCart addBook: book2Isbn quantity: 2.
	
	self 
        should: [ aCashier checkOutCart: aCart withCreditCardNumber: ccn andExpirationDate: cced andOwnersName:cco. ]
        raise: Error
        asserting: [ :anError |
		self assert: Cashier checkOutCannotBeExecutedWithCreditCardOwnersNameLongerThanThirtyCharactersErrorMessage equals: anError messageText].
	
	
	! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'CZ 2/17/2021 19:22:13'!
test07CheckOutCannotBeExecutedWithCreditCardWithoutASixDigitExpirationDate
	
	| aCart cced ccn cco aCashier book1Isbn book2Isbn |
	
	aCart _ Cart new.
	aCashier _ Cashier new.
	
	book1Isbn _ 9789877250244.
	book2Isbn _ 9789585118300.
	ccn _ 12345.
	cced _ '0220'.
	cco _ 'Marcela'.
	
	aCart addBook: book1Isbn quantity: 1.
	aCart addBook: book2Isbn quantity: 2.
	
	self 
        should: [ aCashier checkOutCart: aCart withCreditCardNumber: ccn andExpirationDate: cced andOwnersName:cco. ]
        raise: Error
        asserting: [ :anError |
		self assert: Cashier checkOutCannotBeExecutedWithCreditCardWithoutASixDigitExpirationDateErrorMessage equals: anError messageText].
	! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'CZ 2/17/2021 19:30:16'!
test09CashierKnowsTheHistoryOfSalesWhenMultipleCheckOutsAreExecuted

	| cart1 cart2 cced1 cced2 ccn1 ccn2 cco1 cco2 aCashier book1Isbn book2Isbn book3Isbn book4Isbn expectedTotalSales |
	
	cart1 _ Cart new.
	cart2 _ Cart new.
	aCashier _ Cashier new.
	
	book1Isbn _ 9789877250244.
	book2Isbn _ 9789585118300.
	book3Isbn  _ 9788408081548.
	book4Isbn _ 9789870711544.
	
	ccn1 _ 12345.
	cced1 _ '022050'.
	cco1 _ 'Marcela'.
	ccn2 _ 67890.
	cced2 _ '102025'.
	cco2 _ 'Pedro'.
	
	cart1 addBook: book1Isbn quantity: 1.
	cart1 addBook: book2Isbn quantity: 2.
	cart2 addBook: book3Isbn quantity: 2.
	cart2 addBook: book4Isbn quantity: 1.
	
	aCashier checkOutCart: cart1 withCreditCardNumber: ccn1 andExpirationDate: cced1 andOwnersName: cco1.
	aCashier checkOutCart: cart2 withCreditCardNumber: ccn2 andExpirationDate: cced2 andOwnersName: cco2.
	
	expectedTotalSales _ Dictionary with: cart1 -> (3000.48*peso) with: cart2 -> (2902.30*peso).
	
	self assert: expectedTotalSales equals: aCashier totalSales.
	! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'CZ 2/17/2021 19:02:32'!
_test10
	"El MP devuelve error"
	| aCart cced ccn cco aCashier book1Isbn book2Isbn |
	
	aCart _ Cart new.
	aCashier _ Cashier new.
	
	book1Isbn _ 9789877250244.
	book2Isbn _ 9789585118300.
	ccn _ 12345.
	cced _ 022050.
	cco _ 'Marcela'.
	
	aCart addBook: book1Isbn quantity: 1.
	aCart addBook: book2Isbn quantity: 2.

	self 
        should: [ aCashier checkOutCart: aCart withCreditCardNumber: ccn andExpirationDate: cced andOwnersName: cco.]
        raise: Error
        asserting: [ :anError |
		self assert: Cashier checkOutCannotBeExecutedDueToMerchantProcessorConnectionFailureErrorMessage equals: anError messageText].
	
	! !


!classDefinition: #Cart category: 'TusLibros-Ejercicio'!
Object subclass: #Cart
	instanceVariableNames: 'books'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!Cart methodsFor: 'initialization' stamp: 'CZ 2/8/2021 21:35:25'!
initialize

	books _ OrderedCollection new.! !


!Cart methodsFor: 'signal error' stamp: 'CZ 2/11/2021 10:08:37'!
signalInvalidIsbnCannotBeAddedToCart
	
	self error: self class invalidIsbnCannotBeAddedToCartErrorMessage.! !

!Cart methodsFor: 'signal error' stamp: 'CZ 2/11/2021 10:08:46'!
signalQuantityCannotBeLessThanOne 
	
	self error: self class quantityCannotBeLessThanOneErrorMessage.! !


!Cart methodsFor: 'testing' stamp: 'CZ 2/11/2021 13:31:33'!
hasBook: bookIsbnToVerify

	^self booksStored includes: 	bookIsbnToVerify.! !

!Cart methodsFor: 'testing' stamp: 'CZ 2/11/2021 12:03:43'!
isEmpty

	^self booksStored isEmpty.! !


!Cart methodsFor: 'accessing' stamp: 'CZ 2/11/2021 13:32:24'!
numberOfCopiesOf: bookIsbnToVerify

	^self booksStored occurrencesOf: bookIsbnToVerify.! !

!Cart methodsFor: 'accessing' stamp: 'CZ 2/11/2021 12:04:15'!
size

	^self booksStored size.! !


!Cart methodsFor: 'cart management' stamp: 'CZ 2/11/2021 13:31:42'!
addBook: bookIsbn quantity: numberOfCopies

	self assertCanAddBook: bookIsbn withNumberOfCopies: numberOfCopies.
	
	numberOfCopies timesRepeat: [self booksStored add: bookIsbn].
	! !

!Cart methodsFor: 'cart management' stamp: 'JT 2/11/2021 21:29:12'!
booksStored
	
	^books.! !

!Cart methodsFor: 'cart management' stamp: 'JT 2/11/2021 21:19:37'!
removeBooks
	
	books removeAll.! !


!Cart methodsFor: 'assertions' stamp: 'JT 2/11/2021 20:59:31'!
assertCanAddBook: bookIsbnToVerify withNumberOfCopies: numberOfCopiesToVerify

	(numberOfCopiesToVerify < 1) ifTrue: [self signalQuantityCannotBeLessThanOne].
	
	(Publisher new hasBookInCatalog: bookIsbnToVerify) ifFalse:[self signalInvalidIsbnCannotBeAddedToCart].  ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: 'TusLibros-Ejercicio'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'error messages' stamp: 'CZ 2/11/2021 10:34:39'!
invalidIsbnCannotBeAddedToCartErrorMessage

	^'Invalid ISBN cannot be added to cart'! !

!Cart class methodsFor: 'error messages' stamp: 'CZ 2/11/2021 10:34:46'!
quantityCannotBeLessThanOneErrorMessage

	^'Quantity cannot be less than one'! !


!classDefinition: #Cashier category: 'TusLibros-Ejercicio'!
Object subclass: #Cashier
	instanceVariableNames: 'transactionAmount issuedBill totalSales'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!Cashier methodsFor: 'initialization' stamp: 'CZ 2/17/2021 18:42:27'!
initialize

	totalSales _ Dictionary new.! !


!Cashier methodsFor: 'as yet unclassified' stamp: 'JT 2/18/2021 00:04:39'!
assertCanExecuteCheckOutOf: aCartToCheckOut
	
	aCartToCheckOut isEmpty ifTrue: [self signalCheckOutCannotBeExecutedWithEmptyCart.].! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'CZ 2/17/2021 17:38:55'!
calculateTransactionAmount: aCart

	| catalog total |
	catalog _ Publisher new catalog.
	
	total _ 0.
	aCart booksStored do: [:isbn | 
		total _ total + (catalog at: isbn).].
	
	transactionAmount _ total.! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'JT 2/18/2021 00:06:37'!
checkOutCart: aCart withCreditCardNumber: creditCardNumber andExpirationDate: expirationDate andOwnersName: ownersName
	
	| aMerchantProcessor |
	
	self calculateTransactionAmount: aCart. 
	
	self assertCanExecuteCheckOutOf: aCart.
	
	aMerchantProcessor _ MerchantProcessor new.
	
	aMerchantProcessor assertCanExecutePaymentWithCreditCardExpirationDate: expirationDate andOwnersName: ownersName.
	
	"self processPayment: totalPaid."
	
	self issueBill: aCart.
	
	self updateTotalSalesWithCart: aCart andTransactionAmount: self transactionAmount.
	
	aCart removeBooks.! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'CZ 2/17/2021 17:40:47'!
issueBill: aCart

	| catalog finalBill |

	finalBill _ Dictionary new.
	catalog _ Publisher new catalog.
	
	aCart booksStored do: [:isbn | finalBill add: isbn->(catalog at: isbn)].

	issuedBill _ finalBill.! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'CZ 2/17/2021 17:40:46'!
issuedBill
	
	^issuedBill.! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'JT 2/11/2021 21:37:49'!
signalCheckOutCannotBeExecutedWithEmptyCart
	
	self error: self class checkOutCannotBeExecutedWithEmptyCartErrorMessage .! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'CZ 2/17/2021 18:57:37'!
totalSales

	^totalSales.! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'CZ 2/17/2021 17:39:57'!
transactionAmount
	
	^transactionAmount.! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'CZ 2/17/2021 18:43:13'!
updateTotalSalesWithCart: aCart andTransactionAmount: aTransactionAmount

	totalSales add: aCart -> aTransactionAmount.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: 'TusLibros-Ejercicio'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'as yet unclassified' stamp: 'JT 2/17/2021 01:06:45'!
checkOutCannotBeExecutedWithEmptyCartErrorMessage

	^'Check out cannot be executed with empty cart'! !


!classDefinition: #MerchantProcessor category: 'TusLibros-Ejercicio'!
Object subclass: #MerchantProcessor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!MerchantProcessor methodsFor: 'as yet unclassified' stamp: 'JT 2/18/2021 00:08:00'!
assertCanExecutePaymentWithCreditCardExpirationDate: expirationDate andOwnersName: ownersName
	
	self validateCreditCardExpirationDate: expirationDate.
	
	self validateCreditCardOwnersName: ownersName.! !

!MerchantProcessor methodsFor: 'as yet unclassified' stamp: 'JT 2/18/2021 00:08:15'!
signalPaymentCannotBeExecutedWithCreditCardOwnersNameLongerThanThirtyCharacters
	
	self error: self class paymentCannotBeExecutedWithCreditCardOwnersNameLongerThanThirtyCharactersErrorMessage.! !

!MerchantProcessor methodsFor: 'as yet unclassified' stamp: 'JT 2/18/2021 00:08:44'!
signalPaymentCannotBeExecutedWithCreditCardWithoutASixDigitExpirationDate
	
	self error: self class paymentCannotBeExecutedWithCreditCardWithoutASixDigitExpirationDateErrorMessage.! !

!MerchantProcessor methodsFor: 'as yet unclassified' stamp: 'JT 2/18/2021 00:09:14'!
signalPaymentCannotBeExecutedWithExpiredCreditCard
	
	self error: self class paymentCannotBeExecutedWithExpiredCreditCardErrorMessage.! !

!MerchantProcessor methodsFor: 'as yet unclassified' stamp: 'JT 2/18/2021 00:03:51'!
validateCreditCardExpirationDate: expirationDate

	| todayDate todayMonth todayYear todayMonthAndYear |
	
	todayDate _ Date today.
	todayMonth _ todayDate monthIndex asString.
	todayYear _ todayDate year yearNumber asString.
	
	todayMonth size = 1 ifTrue:[	todayMonthAndYear _ '0',todayMonth,todayYear.] ifFalse:[	todayMonthAndYear _ todayMonth,todayYear].
	
	expirationDate size ~= 6 ifTrue:[self signalCheckOutCannotBeExecutedWithCreditCardWithoutASixDigitExpirationDate].
	expirationDate < todayMonthAndYear ifTrue: [self signalCheckOutCannotBeExecutedWithExpiredCreditCard].
	! !

!MerchantProcessor methodsFor: 'as yet unclassified' stamp: 'JT 2/18/2021 00:04:07'!
validateCreditCardOwnersName: ownersName

	ownersName size > 30 ifTrue: [self signalCheckOutCannotBeExecutedWithCreditCardOwnersNameLongerThanThirtyCharacters.].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MerchantProcessor class' category: 'TusLibros-Ejercicio'!
MerchantProcessor class
	instanceVariableNames: ''!

!MerchantProcessor class methodsFor: 'as yet unclassified' stamp: 'JT 2/18/2021 00:10:21'!
paymentCannotBeExecutedWithCreditCardOwnersNameLongerThanThirtyCharactersErrorMessage

	^'Payment cannot be executed with credit card owner''s name longer than thirty characters'! !

!MerchantProcessor class methodsFor: 'as yet unclassified' stamp: 'JT 2/18/2021 00:10:47'!
paymentCannotBeExecutedWithCreditCardWithoutASixDigitExpirationDateErrorMessage

	^'Payment cannot be executed with credit card without a six-digit expiration date'.! !

!MerchantProcessor class methodsFor: 'as yet unclassified' stamp: 'JT 2/18/2021 00:11:12'!
paymentCannotBeExecutedWithExpiredCreditCardErrorMessage

	^'Payment cannot be executed with expired credit card'! !

!MerchantProcessor class methodsFor: 'as yet unclassified' stamp: 'JT 2/18/2021 00:11:33'!
paymentCannotBeExecutedWithTransactionAmountLargerThanTheLimitErrorMessage

	^'Payment cannot be executed with transaction amount larger than the limit'! !


!classDefinition: #Publisher category: 'TusLibros-Ejercicio'!
Object subclass: #Publisher
	instanceVariableNames: 'catalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!Publisher methodsFor: 'publisher management' stamp: 'CZ 2/11/2021 10:52:05'!
catalog
	
	^catalog.! !


!Publisher methodsFor: 'initialization' stamp: 'CZ 2/17/2021 19:00:24'!
initialize

	catalog _ Dictionary with: 9789877250244->(1000.50*peso) with: 9789585118300->(999.99*peso) with: 9788408081548->(700.75*peso) with: 9789870711544->(1500.80*peso) with: 9789871534388->(2000.00*peso) with: 9788477511205->(1750.35*peso).! !


!Publisher methodsFor: 'as yet unclassified' stamp: 'JT 2/16/2021 22:36:53'!
hasBookInCatalog: bookToVerify
	
	^self catalog includesKey: bookToVerify.! !
