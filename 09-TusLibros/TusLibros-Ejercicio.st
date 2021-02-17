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

!CashierTest methodsFor: 'as yet unclassified' stamp: 'JT 2/16/2021 22:28:55'!
test01
	"No se puede hacer checkout del carrito vacio"
	| aCart cced ccn cco aCashier |
	
	aCart _ Cart new.
	aCashier _ Cashier new.

	ccn _ 12345.
	cced _ 022023.
	cco _ 'Marcela'.
	
	self 
        should: [ aCashier checkOutCart: aCart WithCreditCardNumber: ccn andExpirationDate: cced andOwnersName:cco. ]
        raise: Error
        asserting: [ :anError |
		self assert: Cashier checkOutCannotBeExecutedWithEmptyCartErrorMessage equals: anError messageText].
	
	

	! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'JT 2/16/2021 22:28:27'!
test02
	"Si se puede hacer checkout del carrito con un libro"
	| aCart aBook1Isbn cced ccn cco aCashier |
	
	aCart _ Cart new.
	aCashier _ Cashier new.
	
	aBook1Isbn _ 9789877250244.
	ccn _ 12345.
	cced _ 022023.
	cco _ 'Marcela'.
	
	aCart addBook: aBook1Isbn quantity: 1.
	aCashier checkOutCart: aCart WithCreditCardNumber: ccn andExpirationDate: cced andOwnersName: cco.
	
	self assert: aCart isEmpty.
	self assert: 100* peso equals: aCashier totalAmountCashed.
	
	! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'JT 2/16/2021 22:28:11'!
test03
	"Si se puede hacer checkout del carrito con un libro"
	| aCart cced ccn cco aCashier book1Isbn book2Isbn |
	
	aCart _ Cart new.
	aCashier _ Cashier new.
	
	book1Isbn _ 9789877250244.
	book2Isbn _ 9789585118300.
	ccn _ 12345.
	cced _ 022023.
	cco _ 'Marcela'.
	
	aCart addBook: book1Isbn quantity: 3.
	aCart addBook: book2Isbn quantity: 2.
	aCashier checkOutCart: aCart WithCreditCardNumber: ccn andExpirationDate: cced andOwnersName: cco.
	
	self assert: aCart isEmpty.
	self assert: 700 * peso equals: aCashier totalAmountCashed.
	
	! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'JT 2/16/2021 23:31:48'!
test04
	"Listar las compras que se realizo"
	| aCart cced ccn cco aCashier book1Isbn book2Isbn expectedBill |
	
	aCart _ Cart new.
	aCashier _ Cashier new.
	
	book1Isbn _ 9789877250244.
	book2Isbn _ 9789585118300.
	ccn _ 12345.
	cced _ 022023.
	cco _ 'Marcela'.
	
	aCart addBook: book1Isbn quantity: 1.
	aCart addBook: book2Isbn quantity: 2.
	aCashier checkOutCart: aCart WithCreditCardNumber: ccn andExpirationDate: cced andOwnersName: cco.
	
	expectedBill _ Dictionary with: 9789877250244->(100*peso) with: 9789585118300->(200*peso) with: 9789585118300->(200*peso).
	
	self assert: expectedBill equals: aCashier bill.
	
	! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'JT 2/17/2021 00:05:10'!
_test05
	"Tarjeta expirada"
	| aCart cced ccn cco aCashier book1Isbn book2Isbn expectedBill |
	
	aCart _ Cart new.
	aCashier _ Cashier new.
	
	book1Isbn _ 9789877250244.
	book2Isbn _ 9789585118300.
	ccn _ 12345.
	cced _ 022023.
	cco _ 'Marcela'.
	
	aCart addBook: book1Isbn quantity: 1.
	aCart addBook: book2Isbn quantity: 2.
	
	self 
        should: [ aCashier checkOutCart: aCart WithCreditCardNumber: ccn andExpirationDate: cced andOwnersName:cco. ]
        raise: Error
        asserting: [ :anError |
		self assert: Cashier checkOutCannotBeExecutedWithExpiredCreditCardErrorMessage equals: anError messageText].
	
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
	instanceVariableNames: 'totalPaid bill'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!Cashier methodsFor: 'as yet unclassified' stamp: 'JT 2/16/2021 23:32:40'!
bill
	
	^bill.! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'JT 2/16/2021 23:26:03'!
calculateTotalPaid: aCart

	| catalog total |
	catalog _ Publisher new catalog.
	
	total _ 0.
	aCart booksStored do: [:isbn | 
		total _ total + (catalog at: isbn).].
	
	totalPaid _ total.! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'JT 2/17/2021 00:01:09'!
checkOutCart: aCart WithCreditCardNumber: creditCardNumber andExpirationDate: expirationDate andOwnersName: ownersName
	
	aCart isEmpty ifTrue: [self signalCheckOutCannotBeExecutedWithEmptyCart.].
	
	
	
	self calculateTotalPaid: aCart.
	
	self issueBill: aCart.
	
	aCart removeBooks.! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'JT 2/16/2021 23:56:23'!
issueBill: aCart

	| catalog finalBill |

	finalBill _ Dictionary new.
	catalog _ Publisher new catalog.
	
	aCart booksStored do: [:isbn | finalBill add: isbn->(catalog at: isbn)].

	bill _ finalBill.! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'JT 2/11/2021 21:37:49'!
signalCheckOutCannotBeExecutedWithEmptyCart
	
	self error: self class checkOutCannotBeExecutedWithEmptyCartErrorMessage .! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'JT 2/16/2021 23:59:26'!
signalCheckOutCannotBeExecutedWithExpiredCreditCard
	
	self error: self class checkOutCannotBeExecutedWithExpiredCreditCardErrorMessage.! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'JT 2/16/2021 22:46:05'!
totalAmountCashed
	
	^totalPaid.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: 'TusLibros-Ejercicio'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'as yet unclassified' stamp: 'JT 2/11/2021 21:36:41'!
checkOutCannotBeExecutedWithEmptyCartErrorMessage

	^'CheckOut cannot be executed with empty cart'! !

!Cashier class methodsFor: 'as yet unclassified' stamp: 'JT 2/16/2021 23:59:02'!
checkOutCannotBeExecutedWithExpiredCreditCardErrorMessage

	^'CheckOut cannot be executed with expired credit card'! !


!classDefinition: #Publisher category: 'TusLibros-Ejercicio'!
Object subclass: #Publisher
	instanceVariableNames: 'catalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!Publisher methodsFor: 'publisher management' stamp: 'CZ 2/11/2021 10:52:05'!
catalog
	
	^catalog.! !


!Publisher methodsFor: 'initialization' stamp: 'JT 2/16/2021 23:25:31'!
initialize

	catalog _ Dictionary with: 9789877250244->(100*peso) with: 9789585118300->(200*peso) with: 9788408081548->(100*peso) with: 9789870711544->(100*peso) with: 9789871534388->(100*peso) with: 9788477511205->(100*peso).! !


!Publisher methodsFor: 'as yet unclassified' stamp: 'JT 2/16/2021 22:36:53'!
hasBookInCatalog: bookToVerify
	
	^self catalog includesKey: bookToVerify.! !
