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

!CashierTest methodsFor: 'tests' stamp: 'JT 2/18/2021 18:11:44'!
test01CheckOutCannotBeExecutedWithEmptyCart

	| aCart aCashier ccn cced cco aMerchantProcessorMock |
	
	aCart _ Cart new.
	aCashier _ Cashier new.
	aMerchantProcessorMock _ MerchantProcessorMock createWithError: false.
	
	ccn _ 5589043461258803.
	cced _ '012025'.
	cco _ 'Mary'.
	
	self 
       		should: [ aCashier checkOutCart: aCart withCreditCardNumber: ccn andExpirationDate: cced andOwnersName:cco through: aMerchantProcessorMock]
       		raise: Error
       		asserting: [ :anError |
			self assert: Cashier checkOutCannotBeExecutedWithEmptyCartErrorMessage equals: anError messageText].
	
	

	! !

!CashierTest methodsFor: 'tests' stamp: 'JT 2/18/2021 18:11:47'!
test02CheckOutWithOneBookCanBeExecuted

	| aCart aCashier aBookIsbn ccn cced cco aMerchantProcessorMock |
	
	aCart _ Cart new.
	aCashier _ Cashier new.
	aMerchantProcessorMock _ MerchantProcessorMock createWithError: false.
	
	aBookIsbn _ 9789877250244.
	ccn _ 5589043461258903.
	cced _ '022023'.
	cco _ 'Sarah'.
	
	aCart addBook: aBookIsbn quantity: 1.
	aCashier checkOutCart: aCart withCreditCardNumber: ccn andExpirationDate: cced andOwnersName: cco through: aMerchantProcessorMock.
	
	self assert: aCart isEmpty.
	self assert: 1000.5*peso equals: aCashier transactionAmount.
	
	! !

!CashierTest methodsFor: 'tests' stamp: 'JT 2/18/2021 18:11:51'!
test03CheckOutWithMultipleBooksCanBeExecuted

	| aCart aCashier book1Isbn book2Isbn ccn cced cco aMerchantProcessorMock |
	
	aCart _ Cart new.
	aCashier _ Cashier new.
	aMerchantProcessorMock _ MerchantProcessorMock createWithError: false.
	
	book1Isbn _ 9789877250244.
	book2Isbn _ 9789585118300.
	ccn _ 5589043471258803.
	cced _ '022023'.
	cco _ 'James'.
	
	aCart addBook: book1Isbn quantity: 3.
	aCart addBook: book2Isbn quantity: 2.
	aCashier checkOutCart: aCart withCreditCardNumber: ccn andExpirationDate: cced andOwnersName: cco through: aMerchantProcessorMock.
	
	self assert: aCart isEmpty.
	self assert: 5001.48*peso equals: aCashier transactionAmount.
	
	! !

!CashierTest methodsFor: 'tests' stamp: 'JT 2/18/2021 18:11:56'!
test04CashierCanIssueTheBillAfterCheckOut

	| aCart aCashier book1Isbn book2Isbn ccn cced cco expectedBill aMerchantProcessorMock |
	
	aCart _ Cart new.
	aCashier _ Cashier new.
	aMerchantProcessorMock _ MerchantProcessorMock createWithError: false.
	
	book1Isbn _ 9789877250244.
	book2Isbn _ 9789585118300.
	ccn _ 5589043461258803.
	cced _ '022023'.
	cco _ 'Mary'.
	
	aCart addBook: book1Isbn quantity: 1.
	aCart addBook: book2Isbn quantity: 2.
	aCashier checkOutCart: aCart withCreditCardNumber: ccn andExpirationDate: cced andOwnersName: cco through: aMerchantProcessorMock.
	
	expectedBill _ Dictionary with: 9789877250244->(1000.5*peso) with: 9789585118300->(999.99*peso) with: 9789585118300->(999.99*peso).
	
	self assert: expectedBill equals: aCashier issuedBill.
	
	! !

!CashierTest methodsFor: 'tests' stamp: 'JT 2/18/2021 18:12:00'!
test05PaymentCannotBeExecutedWithExpiredCreditCard

	| aCart aCashier book1Isbn book2Isbn ccn cced cco aMerchantProcessorMock |
	
	aCart _ Cart new.
	aCashier _ Cashier new.
	aMerchantProcessorMock _ MerchantProcessorMock createWithError: false.
	
	book1Isbn _ 9789877250244.
	book2Isbn _ 9789585118300.
	ccn _ 5589443461258803.
	cced _ '022000'.
	cco _ 'Megan'.
	
	aCart addBook: book1Isbn quantity: 1.
	aCart addBook: book2Isbn quantity: 2.
	
	self 
       		should: [ aCashier checkOutCart: aCart withCreditCardNumber: ccn andExpirationDate: cced andOwnersName: cco through: aMerchantProcessorMock. ]
       		raise: Error
       		asserting: [ :anError |
			self assert: MerchantProcessorMock paymentCannotBeExecutedWithExpiredCreditCardErrorMessage equals: anError messageText].
	
	! !

!CashierTest methodsFor: 'tests' stamp: 'JT 2/18/2021 18:12:05'!
test06PaymentCannotBeExecutedWithCreditCardWithoutASixDigitExpirationDate
	
	| aCart aCashier book1Isbn book2Isbn ccn cced cco aMerchantProcessorMock |
	
	aCart _ Cart new.
	aCashier _ Cashier new.
	aMerchantProcessorMock _ MerchantProcessorMock createWithError: false.
	
	book1Isbn _ 9789877250244.
	book2Isbn _ 9789585118300.
	ccn _ 5589043461258803.
	cced _ '0220'.
	cco _ 'Mary'.
	
	aCart addBook: book1Isbn quantity: 1.
	aCart addBook: book2Isbn quantity: 2.
	
	self 
       		should: [ aCashier checkOutCart: aCart withCreditCardNumber: ccn andExpirationDate: cced andOwnersName: cco through: aMerchantProcessorMock. ]
       		raise: Error
       		asserting: [ :anError |
			self assert: MerchantProcessorMock paymentCannotBeExecutedWithCreditCardWithoutASixDigitExpirationDateErrorMessage equals: anError messageText].
	! !

!CashierTest methodsFor: 'tests' stamp: 'JT 2/18/2021 18:12:08'!
test07CashierKnowsTheHistoryOfSalesWhenMultipleCheckOutsAreExecuted

	| cart1 cart2 aCashier book1Isbn book2Isbn book3Isbn book4Isbn ccn1 cced1 cco1 ccn2 cced2 cco2 expectedTotalSales aMerchantProcessorMock |
	
	cart1 _ Cart new.
	cart2 _ Cart new.
	aCashier _ Cashier new.
	aMerchantProcessorMock _ MerchantProcessorMock createWithError: false.
	
	book1Isbn _ 9789877250244.
	book2Isbn _ 9789585118300.
	book3Isbn  _ 9788408081548.
	book4Isbn _ 9789870711544.
	
	ccn1 _ 5589443461258803.
	cced1 _ '032030'.
	cco1 _ 'Megan'.
	ccn2 _ 4852355390716725.
	cced2 _ '102025'.
	cco2 _ 'Nathan'.
	
	cart1 addBook: book1Isbn quantity: 1.
	cart1 addBook: book2Isbn quantity: 2.
	cart2 addBook: book3Isbn quantity: 2.
	cart2 addBook: book4Isbn quantity: 1.
	
	aCashier checkOutCart: cart1 withCreditCardNumber: ccn1 andExpirationDate: cced1 andOwnersName: cco1 through: aMerchantProcessorMock.
	aCashier checkOutCart: cart2 withCreditCardNumber: ccn2 andExpirationDate: cced2 andOwnersName: cco2 through: aMerchantProcessorMock..
	
	expectedTotalSales _ Dictionary with: cart1 -> (3000.48*peso) with: cart2 -> (2902.30*peso).
	
	self assert: expectedTotalSales equals: aCashier totalSales.
	! !

!CashierTest methodsFor: 'tests' stamp: 'JT 2/18/2021 18:12:12'!
test08PaymentCannotBeExecutedDueToMerchantProcessorConnectionFailure
	
	| aCart aCashier book1Isbn book2Isbn ccn cced cco aMerchantProcessorMock |
	
	aCart _ Cart new.
	aCashier _ Cashier new.
	aMerchantProcessorMock _ MerchantProcessorMock createWithError: true.
	
	book1Isbn _ 9789877250244.
	book2Isbn _ 9789585118300.
	ccn _ 5589043461258803.
	cced _ '022050'.
	cco _ 'Mary'.
	
	aCart addBook: book1Isbn quantity: 1.
	aCart addBook: book2Isbn quantity: 2.
	
	self 
       		should: [ aCashier checkOutCart: aCart withCreditCardNumber: ccn andExpirationDate: cced andOwnersName: cco through: aMerchantProcessorMock. ]
       		raise: Error
       		asserting: [ :anError |
			self assert: MerchantProcessorMock paymentCannotBeExecutedDueToMerchantProcessorConnectionFailureErrorMessage equals: anError messageText.
			self deny: aCart isEmpty.].
	! !


!CashierTest methodsFor: 'assertions' stamp: 'JT 2/11/2021 21:35:30'!
should: aBlockThatShouldFail raise: anExceptionType asserting: aVerificationBlock

	[ aBlockThatShouldFail value.
    	self fail ]
        		on: anExceptionType 
       		do: aVerificationBlock! !


!classDefinition: #Cart category: 'TusLibros-Ejercicio'!
Object subclass: #Cart
	instanceVariableNames: 'booksStored'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!Cart methodsFor: 'initialization' stamp: 'CZ 2/18/2021 03:12:41'!
initialize

	booksStored _ OrderedCollection new.! !


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

!Cart methodsFor: 'cart management' stamp: 'CZ 2/18/2021 03:12:41'!
booksStored
	
	^booksStored.! !

!Cart methodsFor: 'cart management' stamp: 'CZ 2/18/2021 03:12:41'!
removeBooks
	
	booksStored removeAll.! !


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


!Cashier methodsFor: 'signal error' stamp: 'JT 2/11/2021 21:37:49'!
signalCheckOutCannotBeExecutedWithEmptyCart
	
	self error: self class checkOutCannotBeExecutedWithEmptyCartErrorMessage .! !


!Cashier methodsFor: 'cashier management' stamp: 'CZ 2/17/2021 17:38:55'!
calculateTransactionAmount: aCart

	| catalog total |
	catalog _ Publisher new catalog.
	
	total _ 0.
	aCart booksStored do: [:isbn | 
		total _ total + (catalog at: isbn).].
	
	transactionAmount _ total.! !

!Cashier methodsFor: 'cashier management' stamp: 'JT 2/18/2021 18:07:39'!
checkOutCart: aCart withCreditCardNumber: creditCardNumber andExpirationDate: expirationDate andOwnersName: ownersName through: aMerchantProcessorMock
	
	self calculateTransactionAmount: aCart. 
	
	self assertCanExecuteCheckOutOf: aCart.
	
	aMerchantProcessorMock assertCanProcessPaymentWithCreditCardExpirationDate: expirationDate.
	
	self issueBill: aCart.
	
	self updateTotalSalesWithCart: aCart andTransactionAmount: self transactionAmount.
	
	aCart removeBooks.! !

!Cashier methodsFor: 'cashier management' stamp: 'CZ 2/17/2021 17:40:47'!
issueBill: aCart

	| catalog finalBill |

	finalBill _ Dictionary new.
	catalog _ Publisher new catalog.
	
	aCart booksStored do: [:isbn | finalBill add: isbn->(catalog at: isbn)].

	issuedBill _ finalBill.! !

!Cashier methodsFor: 'cashier management' stamp: 'CZ 2/17/2021 17:40:46'!
issuedBill
	
	^issuedBill.! !

!Cashier methodsFor: 'cashier management' stamp: 'CZ 2/17/2021 18:57:37'!
totalSales

	^totalSales.! !

!Cashier methodsFor: 'cashier management' stamp: 'CZ 2/17/2021 17:39:57'!
transactionAmount
	
	^transactionAmount.! !

!Cashier methodsFor: 'cashier management' stamp: 'CZ 2/17/2021 18:43:13'!
updateTotalSalesWithCart: aCart andTransactionAmount: aTransactionAmount

	totalSales add: aCart -> aTransactionAmount.! !


!Cashier methodsFor: 'assertions - private' stamp: 'CZ 2/18/2021 02:40:52'!
assertCanExecuteCheckOutOf: aCartToCheckOut
	
	aCartToCheckOut isEmpty ifTrue: [self signalCheckOutCannotBeExecutedWithEmptyCart].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: 'TusLibros-Ejercicio'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'as yet unclassified' stamp: 'JT 2/17/2021 01:06:45'!
checkOutCannotBeExecutedWithEmptyCartErrorMessage

	^'Check out cannot be executed with empty cart'! !


!classDefinition: #MerchantProcessorMock category: 'TusLibros-Ejercicio'!
Object subclass: #MerchantProcessorMock
	instanceVariableNames: 'errorOccurred'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!MerchantProcessorMock methodsFor: 'assertions - private' stamp: 'JT 2/18/2021 18:07:10'!
assertCanProcessPaymentWithCreditCardExpirationDate: expirationDate  
	
	| expirationMonth expirationYear expirationDate2 |
	
	expirationDate size ~= 6 ifTrue:[self signalPaymentCannotBeExecutedWithCreditCardWithoutASixDigitExpirationDate].
	
	expirationMonth _ GregorianMonth numbered: (expirationDate copyFrom: 1 to: 2) asInteger.
	expirationYear _ (expirationDate copyFrom: 3 to: 6) asInteger.
	expirationDate2 _ (expirationMonth, expirationYear) lastDate.
	
	expirationDate2 < FixedGregorianDate today ifTrue:[self signalPaymentCannotBeExecutedWithExpiredCreditCard].
	
	errorOccurred ifTrue:[self signalPaymentCannotBeExecutedDueToMerchantProcessorConnectionFailure].! !


!MerchantProcessorMock methodsFor: 'initialization' stamp: 'JT 2/18/2021 18:09:29'!
updateError: boolean

	errorOccurred _ boolean.! !


!MerchantProcessorMock methodsFor: 'signal error' stamp: 'JT 2/18/2021 17:52:42'!
signalPaymentCannotBeExecutedDueToMerchantProcessorConnectionFailure
	
	self error: self class paymentCannotBeExecutedDueToMerchantProcessorConnectionFailureErrorMessage.! !

!MerchantProcessorMock methodsFor: 'signal error' stamp: 'JT 2/18/2021 00:08:44'!
signalPaymentCannotBeExecutedWithCreditCardWithoutASixDigitExpirationDate
	
	self error: self class paymentCannotBeExecutedWithCreditCardWithoutASixDigitExpirationDateErrorMessage.! !

!MerchantProcessorMock methodsFor: 'signal error' stamp: 'JT 2/18/2021 00:09:14'!
signalPaymentCannotBeExecutedWithExpiredCreditCard
	
	self error: self class paymentCannotBeExecutedWithExpiredCreditCardErrorMessage.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MerchantProcessorMock class' category: 'TusLibros-Ejercicio'!
MerchantProcessorMock class
	instanceVariableNames: ''!

!MerchantProcessorMock class methodsFor: 'error messages' stamp: 'JT 2/18/2021 17:53:17'!
paymentCannotBeExecutedDueToMerchantProcessorConnectionFailureErrorMessage

	^'Payment cannot be executed due to Merchant Processor connection failure'! !

!MerchantProcessorMock class methodsFor: 'error messages' stamp: 'JT 2/18/2021 00:10:47'!
paymentCannotBeExecutedWithCreditCardWithoutASixDigitExpirationDateErrorMessage

	^'Payment cannot be executed with credit card without a six-digit expiration date'.! !

!MerchantProcessorMock class methodsFor: 'error messages' stamp: 'JT 2/18/2021 00:11:12'!
paymentCannotBeExecutedWithExpiredCreditCardErrorMessage

	^'Payment cannot be executed with expired credit card'! !


!MerchantProcessorMock class methodsFor: 'as yet unclassified' stamp: 'JT 2/18/2021 18:11:19'!
createWithError: boolean
	
	^self new updateError: boolean.
	! !


!classDefinition: #Publisher category: 'TusLibros-Ejercicio'!
Object subclass: #Publisher
	instanceVariableNames: 'catalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!Publisher methodsFor: 'publisher management' stamp: 'CZ 2/11/2021 10:52:05'!
catalog
	
	^catalog.! !


!Publisher methodsFor: 'initialization' stamp: 'CZ 2/18/2021 01:12:25'!
initialize

	catalog _ Dictionary with: 9789877250244->(1000.50*peso) with: 9789585118300->(999.99*peso) with: 9788408081548->(700.75*peso) with: 9789870711544->(1500.80*peso) with: 9789871534388->(2000.00*peso) with: 9788477511205->(1000000000000000.00*peso).! !


!Publisher methodsFor: 'testing' stamp: 'JT 2/16/2021 22:36:53'!
hasBookInCatalog: bookToVerify
	
	^self catalog includesKey: bookToVerify.! !
