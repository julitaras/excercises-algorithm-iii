!classDefinition: #CartTest category: 'TusLibros-Ejercicio'!
TestCase subclass: #CartTest
	instanceVariableNames: 'objectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!CartTest methodsFor: 'tests' stamp: 'LL 2/16/2021 19:50:24'!
setUp

	objectsFactory := PublisherTestObjectsFactory new! !

!CartTest methodsFor: 'tests' stamp: 'LL 1/21/2021 20:09:58'!
test01NewCartIsEmpty

	| cart |
	
	cart := self createCart.
	
	self assert: cart isEmpty.! !

!CartTest methodsFor: 'tests' stamp: 'LL 2/16/2021 19:50:24'!
test02CanAddABookToACart

	| cart |
	cart := self createCart.
	
	cart add: objectsFactory bookFromTheEditorial.
	
	self deny: cart isEmpty.! !

!CartTest methodsFor: 'tests' stamp: 'LL 1/21/2021 21:25:18'!
test03CannotAddABookNotInCatalog

	| cart bookNotInCatalog |
	cart := self createCart.
	bookNotInCatalog := 'DEF456'.

	self assert: cart isEmptyAfter: [ cart add: bookNotInCatalog ] raisesErrorWithMessage: Cart bookNotInCatalogErrorMessage.
	! !

!CartTest methodsFor: 'tests' stamp: 'LL 2/16/2021 19:50:24'!
test04CanAddTwoCopiesOfABook

	| cart |
	cart := self createCart.
	
	cart add: objectsFactory bookFromTheEditorial quantity: 2.
	
	self assert: (cart quantityOf: objectsFactory bookFromTheEditorial) equals: 2.! !

!CartTest methodsFor: 'tests' stamp: 'LL 2/16/2021 19:50:24'!
test05CannotAddNonPositiveNumberOfCopiesOfABook

	| cart |
	cart := self createCart.

	self assert: cart isEmptyAfter: [ cart add: objectsFactory bookFromTheEditorial quantity: -1 ] raisesErrorWithMessage: Cart invalidNumberOfCopiesErrorMessage.! !

!CartTest methodsFor: 'tests' stamp: 'LL 2/16/2021 19:50:24'!
test06CartRemembersAddedBooks

	| cart |
	cart := self createCart.
	
	cart add: objectsFactory bookFromTheEditorial quantity: 2.
	cart add: objectsFactory bookFromTheEditorial quantity: 1.
	
	self assert: (cart includes: objectsFactory bookFromTheEditorial).
	self assert: (cart quantityOf: objectsFactory bookFromTheEditorial) equals: 3! !

!CartTest methodsFor: 'tests' stamp: 'LL 1/21/2021 21:26:35'!
test07CannotAddTwoCopiesOfABookNotInCatalog

	| cart bookNotInCatalog |
	cart := self createCart.
	bookNotInCatalog := 'DEF123'.
	
	self assert: cart isEmptyAfter: [ cart add: bookNotInCatalog quantity: 2 ] raisesErrorWithMessage: Cart bookNotInCatalogErrorMessage.! !


!CartTest methodsFor: 'private' stamp: 'LL 1/21/2021 21:24:13'!
assert: cart isEmptyAfter: blockExpectedToFail raisesErrorWithMessage: errorMessage
	
	self should: blockExpectedToFail raise: Error withExceptionDo: [ :anException |
		self assert: anException messageText equals: errorMessage.
		self assert: cart isEmpty.
	]! !

!CartTest methodsFor: 'private' stamp: 'LL 2/16/2021 19:50:24'!
createCart

	^ objectsFactory anEmptyCart! !


!classDefinition: #CashierTest category: 'TusLibros-Ejercicio'!
TestCase subclass: #CashierTest
	instanceVariableNames: 'objectsFactory merchantProcessorBehaviour'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!CashierTest methodsFor: 'tests' stamp: 'LL 2/16/2021 19:50:04'!
setUp

	objectsFactory := PublisherTestObjectsFactory new.
	merchantProcessorBehaviour := [ :anAmountToDebit :aCreditCard |  ]! !

!CashierTest methodsFor: 'tests' stamp: 'LL 2/16/2021 19:51:40'!
test01CannotCheckoutAnEmptyCart

	| cart salesBook cashier |
	cart := objectsFactory anEmptyCart.
	salesBook := objectsFactory anEmptySalesBook.
	cashier := Cashier registeringSalesOn: salesBook.
	
	self should: [ self cashier: cashier checkout: cart ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: Cashier cannotCheckoutAnEmptyCart.
			self assert: salesBook isEmpty
		]! !

!CashierTest methodsFor: 'tests' stamp: 'LL 2/16/2021 19:50:05'!
test02TotalIsCalculatedCorrectlyAfterCheckout

	| cart ticket cashier |
	cart := objectsFactory cartWithABook.
	cashier := objectsFactory aCashier.
	
	ticket := self cashier: cashier checkout: cart.
	
	self assert: objectsFactory bookFromTheEditorialPrice equals: ticket value.! !

!CashierTest methodsFor: 'tests' stamp: 'LL 2/16/2021 19:51:50'!
test03CannotCheckoutIfCardIsExpired

	| cart cashier merchantProcessorWasContacted salesBook |
	cart := objectsFactory cartWithABook.
	salesBook := objectsFactory anEmptySalesBook.
	cashier := Cashier registeringSalesOn: salesBook.
	
	merchantProcessorWasContacted := false.
	self merchantProcessorBehaviour: [ :amountToDebit :aCreditCard |  merchantProcessorWasContacted := true ].
	
	self should: [ self cashier: cashier checkout: cart debitingOn: objectsFactory anExpiredCreditCard ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: Cashier cannotCheckoutUsingAnExpiredCard.
			self deny: merchantProcessorWasContacted.
			self assert: salesBook isEmpty.
		]! !

!CashierTest methodsFor: 'tests' stamp: 'LL 2/16/2021 23:04:34'!
test04CheckoutDebitsCreditCardUsingMerchantProcessor

	| cart ticket cashier debitedAmountFromCreditCard debitedCreditCard creditCard |
	cart := objectsFactory cartWithABook.
	cashier := objectsFactory aCashier.
	creditCard := objectsFactory aValidCreditCard.
		
	self merchantProcessorBehaviour: [ :anAmountToDebit :aCreditCard | 
		debitedAmountFromCreditCard := anAmountToDebit.
		debitedCreditCard := aCreditCard.
	].
	
	ticket := self cashier: cashier checkout: cart debitingOn: creditCard.
	
	self assert: debitedAmountFromCreditCard equals: ticket value.
	self assert: debitedCreditCard equals: creditCard.! !

!CashierTest methodsFor: 'tests' stamp: 'JT 2/25/2021 02:07:34'!
test05CheckoutFailsIfMerchantProcessorCantProcessPayment

	| cart cashier salesBook |
	cart := objectsFactory cartWithABook.
	salesBook := objectsFactory anEmptySalesBook.
	cashier := Cashier registeringSalesOn: salesBook.
	
	self merchantProcessorBehaviour: [ :anAmountToDebit :aCreditCard | Error new signal ].
	
	self should: [ self cashier: cashier checkout: cart ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :exceptionRaised | 
			self assert: exceptionRaised messageText equals: Cashier couldNotProcessPaymentErrorMessage.
			self assert: salesBook isEmpty.
		]! !

!CashierTest methodsFor: 'tests' stamp: 'LL 2/16/2021 19:52:03'!
test06CheckingOutACartRegistersASale

	| cart cashier ticket salesBook |
	cart := objectsFactory cartWithABook.
	salesBook := objectsFactory anEmptySalesBook.
	cashier := Cashier registeringSalesOn: salesBook.	
	
	ticket := self cashier: cashier checkout: cart.
	
	self assert: salesBook size equals: 1.
	self assert: salesBook first equals: ticket.! !


!CashierTest methodsFor: 'merchat processor protocol' stamp: 'LL 1/24/2021 18:26:00'!
debit: anAmountToDebit from: aCreditCard

	^merchantProcessorBehaviour value: anAmountToDebit value: aCreditCard! !


!CashierTest methodsFor: 'change mp behaviour' stamp: 'LL 1/24/2021 18:26:00'!
merchantProcessorBehaviour: newBehaviour

	merchantProcessorBehaviour := newBehaviour! !


!CashierTest methodsFor: 'private' stamp: 'LL 2/16/2021 19:50:05'!
cashier: cashier checkout: cart

	^self cashier: cashier checkout: cart debitingOn: objectsFactory aValidCreditCard! !

!CashierTest methodsFor: 'private' stamp: 'LL 2/16/2021 19:50:04'!
cashier: cashier checkout: cart debitingOn: aCreditCard

	^cashier checkout: cart payingWith: aCreditCard through: self merchantProcessorForTest on: objectsFactory now.! !

!CashierTest methodsFor: 'private' stamp: 'LL 2/16/2021 18:29:57'!
merchantProcessorForTest
	
	^self! !


!classDefinition: #CreditCardTest category: 'TusLibros-Ejercicio'!
TestCase subclass: #CreditCardTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!CreditCardTest methodsFor: 'tests' stamp: 'LL 1/24/2021 18:15:23'!
test01CreditCardOwnerNameCannotBeBlank

	^self should: [ CreditCard of: '' number: 11111111 expiringOn: (FixedGregorianDate today) monthOfYear ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :exceptionRaised | 
			self assert: exceptionRaised messageText equals: CreditCard nameCannotBeBlankErrorMessage.
		]! !


!classDefinition: #InterfaceRestTest category: 'TusLibros-Ejercicio'!
TestCase subclass: #InterfaceRestTest
	instanceVariableNames: 'publisherObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!InterfaceRestTest methodsFor: 'set up' stamp: 'CZ 2/22/2021 13:43:53'!
setUp

	publisherObjectsFactory := PublisherTestObjectsFactory new.! !


!InterfaceRestTest methodsFor: 'tests' stamp: 'CZ 2/25/2021 18:43:13'!
test01CannotCreateACartWithInvalidClientId
	
	| anInterface aClientId aPassword |
	
	aClientId _ '12345'.
	aPassword _ publisherObjectsFactory aValidClientPassword.
	anInterface _ publisherObjectsFactory anInterfaceRest.
	
	self should: [anInterface createCartWithClientId: aClientId andPassword: aPassword ]
		raise: Error
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: InterfaceRest cannotExecuteOperationWithInvalidClientsCredentialsErrorMessage.
		]



! !

!InterfaceRestTest methodsFor: 'tests' stamp: 'CZ 2/25/2021 18:43:30'!
test02CannotCreateACartWithInvalidClientPassword
	
	| anInterface aClientId aPassword |
	
	aClientId _ publisherObjectsFactory aValidClientId.
	aPassword _ 56789.
	anInterface _ publisherObjectsFactory anInterfaceRest.
	
	self should: [anInterface createCartWithClientId: aClientId andPassword: aPassword ]
		raise: Error
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: InterfaceRest cannotExecuteOperationWithInvalidClientsCredentialsErrorMessage.
		]



! !

!InterfaceRestTest methodsFor: 'tests' stamp: 'CZ 2/25/2021 18:43:39'!
test03CanCreateACartWithValidClientCredentials
	
	| anInterface aClientId aPassword booksInCart aCartId|
	
	aClientId _ publisherObjectsFactory aValidClientId.
	aPassword _ publisherObjectsFactory aValidClientPassword.
	anInterface _ publisherObjectsFactory anInterfaceRest.
	
	aCartId _ anInterface createCartWithClientId: aClientId andPassword: aPassword.
	booksInCart _ anInterface listCartWithId: aCartId.
	
	self assert: booksInCart isEmpty.


! !

!InterfaceRestTest methodsFor: 'tests' stamp: 'CZ 2/25/2021 18:43:55'!
test04EveryNewCartHasAUniqueCartId
	
	| anInterface aClientId aPassword aCartId1 aCartId2 |
	
	aClientId _ publisherObjectsFactory aValidClientId.
	aPassword _ publisherObjectsFactory aValidClientPassword.
	anInterface _ publisherObjectsFactory anInterfaceRest.
	
	aCartId1 _ anInterface createCartWithClientId: aClientId andPassword: aPassword.
	aCartId2 _ anInterface createCartWithClientId: aClientId andPassword: aPassword.
	
	self assert: aCartId1 ~= aCartId2.
	


! !

!InterfaceRestTest methodsFor: 'tests' stamp: 'CZ 2/25/2021 18:44:14'!
test05CanAddABookToCartWithValidId
	
	| anInterface aClientId aPassword aCartId booksInCart|
	
	aClientId _ publisherObjectsFactory aValidClientId.
	aPassword _ publisherObjectsFactory aValidClientPassword.
	anInterface _ publisherObjectsFactory anInterfaceRest.
	
	aCartId _ anInterface createCartWithClientId: aClientId andPassword: aPassword.
	anInterface addToCart: aCartId aBook: publisherObjectsFactory bookFromTheEditorial quantity: 2.
	booksInCart _ anInterface listCartWithId: aCartId.
	
	self deny: booksInCart isEmpty.
	


! !

!InterfaceRestTest methodsFor: 'tests' stamp: 'CZ 2/25/2021 18:44:47'!
test06CannotAddABookToCartWithInvalidId
	
	| anInterface |
	
	anInterface _ publisherObjectsFactory anInterfaceRest.
	
	self should: [anInterface addToCart: 3 aBook: publisherObjectsFactory bookFromTheEditorial quantity: 1]
		raise: Error
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: InterfaceRest cannotExecuteOperationWithInvalidCartIdErrorMessage.
		]




! !

!InterfaceRestTest methodsFor: 'tests' stamp: 'CZ 2/25/2021 18:45:03'!
test07ACartKnowsItsContent

	| anInterface aClientId aPassword aCartId booksInCart expectedBooksInCart |

	aClientId _ publisherObjectsFactory aValidClientId.
 	aPassword _ publisherObjectsFactory aValidClientPassword.
 	anInterface _ publisherObjectsFactory anInterfaceRest.

  	aCartId _ anInterface createCartWithClientId: aClientId andPassword: aPassword.
	anInterface addToCart: aCartId aBook: publisherObjectsFactory bookFromTheEditorial quantity: 2.
	booksInCart _ anInterface listCartWithId: aCartId.
	expectedBooksInCart _ Bag with: publisherObjectsFactory bookFromTheEditorial with: publisherObjectsFactory bookFromTheEditorial.
	
	self assert: expectedBooksInCart equals: booksInCart.! !

!InterfaceRestTest methodsFor: 'tests' stamp: 'CZ 2/25/2021 18:45:12'!
test08CannotCheckoutACartWithInvalidId

	| anInterface aClientId aPassword |
	
	aClientId _ publisherObjectsFactory aValidClientId.
 	aPassword _ publisherObjectsFactory aValidClientPassword.
 	anInterface _ publisherObjectsFactory anInterfaceRest.
	
	
	self should: [ anInterface checkoutCartWithId: 3 andCreditCardNumber: publisherObjectsFactory aValidCreditCardNumber andExpiratioDate: publisherObjectsFactory aValidCreditCardExpirationDate andOwnersName: publisherObjectsFactory aValidCreditCardOwnersName]
		raise: Error
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: InterfaceRest cannotExecuteOperationWithInvalidCartIdErrorMessage.
			self assert: (anInterface listPurchasesOf: aClientId withPassword: aPassword) isEmpty.
		]
! !

!InterfaceRestTest methodsFor: 'tests' stamp: 'CZ 2/25/2021 18:45:23'!
test09CanCheckoutACartWithValidId
	
	| anInterface aClientId aPassword aCartId aTicket |

 	aClientId _ publisherObjectsFactory aValidClientId.
 	aPassword _ publisherObjectsFactory aValidClientPassword.
 	anInterface _ publisherObjectsFactory anInterfaceRest.

  	aCartId _ anInterface createCartWithClientId: aClientId andPassword: aPassword.
	anInterface addToCart: aCartId aBook: publisherObjectsFactory bookFromTheEditorial quantity: 2.
	
	aTicket _ anInterface checkoutCartWithId: aCartId andCreditCardNumber: publisherObjectsFactory aValidCreditCardNumber andExpiratioDate: publisherObjectsFactory aValidCreditCardExpirationDate andOwnersName: publisherObjectsFactory aValidCreditCardOwnersName.
	
	self assert: (2000*peso) equals: aTicket.
	
	! !

!InterfaceRestTest methodsFor: 'tests' stamp: 'CZ 2/25/2021 18:45:32'!
test10CannotListACartWithInvalidId
	
	| anInterface |
	
 	anInterface _ publisherObjectsFactory anInterfaceRest.
	
	self should: [ anInterface listCartWithId: 5]
		raise: Error
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: InterfaceRest cannotExecuteOperationWithInvalidCartIdErrorMessage.
		]
	
	! !

!InterfaceRestTest methodsFor: 'tests' stamp: 'CZ 2/25/2021 18:45:58'!
test11CannotListPurchasesOfClientWithInvalidId
	
	| anInterface aClientId aPassword |
	
	aClientId _ 5678.
 	aPassword _ 1234.
 	anInterface _ publisherObjectsFactory anInterfaceRest.
	
	self should: [ anInterface listPurchasesOf: aClientId withPassword: aPassword]
		raise: Error
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: InterfaceRest cannotExecuteOperationWithInvalidClientsCredentialsErrorMessage.
		]
! !

!InterfaceRestTest methodsFor: 'tests' stamp: 'CZ 2/25/2021 18:46:14'!
test12CannotListPurchasesOfClientWithInvalidPassword
	
	| anInterface aClientId aPassword |
	
	aClientId _ publisherObjectsFactory aValidClientId.
 	aPassword _ 9999.
 	anInterface _ publisherObjectsFactory anInterfaceRest.

	
	self should: [ anInterface listPurchasesOf: aClientId withPassword: aPassword]
		raise: Error
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: InterfaceRest cannotExecuteOperationWithInvalidClientsCredentialsErrorMessage.
		]
! !

!InterfaceRestTest methodsFor: 'tests' stamp: 'CZ 2/25/2021 18:46:26'!
test13CanListPurchasesOfValidClient
	
	| anInterface aClientId aPassword aCartId listPurchasesExpected |

 	aClientId _ publisherObjectsFactory aValidClientId.
 	aPassword _ publisherObjectsFactory aValidClientPassword.
 	anInterface _ publisherObjectsFactory anInterfaceRest.

  	aCartId _ anInterface createCartWithClientId: aClientId andPassword: aPassword.
	anInterface addToCart: aCartId aBook: publisherObjectsFactory bookFromTheEditorial quantity: 2.
	
	listPurchasesExpected _ OrderedCollection with: publisherObjectsFactory bookFromTheEditorial with: publisherObjectsFactory bookFromTheEditorial.
	
	self assert: (listPurchasesExpected) equals: (anInterface listPurchasesOf: aClientId withPassword: aPassword).
	! !

!InterfaceRestTest methodsFor: 'tests' stamp: 'CZ 2/25/2021 18:42:30'!
test14CannotAddABookToExpiredCart
	
	| anInterface aClientId aPassword aCartId |
	
	aClientId _ publisherObjectsFactory aValidClientId.
	aPassword _ publisherObjectsFactory aValidClientPassword.
	anInterface _ publisherObjectsFactory anInterfaceRest.
	
	aCartId _ anInterface createCartWithClientId: aClientId andPassword: aPassword.
	anInterface forwardClockTime: (Duration minutes: 30).
	
	self should: [ anInterface addToCart: aCartId aBook: publisherObjectsFactory bookFromTheEditorial quantity: 2]
		raise: Error
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: InterfaceRest cannotExecuteOperationWithExpiredCartErrorMessage.
		]
! !

!InterfaceRestTest methodsFor: 'tests' stamp: 'CZ 2/25/2021 18:42:34'!
test15CannotCheckoutAnExpiredCart
	
	| anInterface aClientId aPassword aCreditCard aCartId |
	
	aClientId _ publisherObjectsFactory aValidClientId.
	aPassword _ publisherObjectsFactory aValidClientPassword.
	anInterface _ publisherObjectsFactory anInterfaceRest.
	aCreditCard _ publisherObjectsFactory aValidCreditCard.
	
	aCartId _ anInterface createCartWithClientId: aClientId andPassword: aPassword.
	
	anInterface addToCart: aCartId aBook: publisherObjectsFactory bookFromTheEditorial quantity: 2.
	
	anInterface forwardClockTime: (Duration minutes: 30).
	
	self should: [ anInterface checkoutCartWithId: aCartId andCreditCardNumber: aCreditCard creditCardNumber andExpiratioDate: aCreditCard expirationDate andOwnersName: aCreditCard ownersName]
		raise: Error
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: InterfaceRest cannotExecuteOperationWithExpiredCartErrorMessage.
		]
! !

!InterfaceRestTest methodsFor: 'tests' stamp: 'CZ 2/25/2021 18:42:39'!
test16CannotListAnExpiredCart
	
	| anInterface aClientId aPassword aCartId |
	
	aClientId _ publisherObjectsFactory aValidClientId.
	aPassword _ publisherObjectsFactory aValidClientPassword.
	anInterface _ publisherObjectsFactory anInterfaceRest.
	
	aCartId _ anInterface createCartWithClientId: aClientId andPassword: aPassword.
	
	anInterface forwardClockTime: (Duration minutes: 30).
	
	self should: [anInterface listCartWithId: aCartId]
		raise: Error
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: InterfaceRest cannotExecuteOperationWithExpiredCartErrorMessage.
		]
! !

!InterfaceRestTest methodsFor: 'tests' stamp: 'CZ 2/25/2021 18:42:44'!
test17MultipleOperationsCanBeExecutedIfSumOfWaitingSpansIsLargerThanTheExpirationTime
	
	| anInterface aClientId aPassword aCartId aCreditCard listPurchasesExpected |
	
	aClientId _ publisherObjectsFactory aValidClientId.
	aPassword _ publisherObjectsFactory aValidClientPassword.
	anInterface _ publisherObjectsFactory anInterfaceRest.
	aCreditCard _ publisherObjectsFactory aValidCreditCard.
	
	aCartId _ anInterface createCartWithClientId: aClientId andPassword: aPassword.
	anInterface forwardClockTime: (Duration minutes: 20).
	
	anInterface addToCart: aCartId aBook: publisherObjectsFactory bookFromTheEditorial quantity: 2.
	anInterface forwardClockTime: (Duration minutes: 15).
	
	anInterface listCartWithId: aCartId.
	anInterface forwardClockTime: (Duration minutes: 29).
	
	anInterface checkoutCartWithId: aCartId andCreditCardNumber: aCreditCard creditCardNumber andExpiratioDate: aCreditCard expirationDate andOwnersName: aCreditCard ownersName.
	
	listPurchasesExpected _ OrderedCollection with: publisherObjectsFactory bookFromTheEditorial with: publisherObjectsFactory bookFromTheEditorial.
	
	self assert: (listPurchasesExpected) equals: (anInterface listPurchasesOf: aClientId withPassword: aPassword).

! !


!classDefinition: #Cart category: 'TusLibros-Ejercicio'!
Object subclass: #Cart
	instanceVariableNames: 'books bookCatalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!Cart methodsFor: 'initialization' stamp: 'LL 1/25/2021 18:50:24'!
initializeWithCatalog: aBookCatalog
	
	bookCatalog := aBookCatalog.
	books := Bag new.! !


!Cart methodsFor: 'adding' stamp: 'LL 1/21/2021 20:24:07'!
add: aBook
	
	self add: aBook quantity: 1.! !

!Cart methodsFor: 'adding' stamp: 'LL 1/21/2021 20:23:42'!
add: aBook quantity: numberOfBooksToAdd

	self assertIsInCatalog: aBook.
	self assertValidNumberOfCopies: numberOfBooksToAdd.
	
	books add: aBook withOccurrences: numberOfBooksToAdd.! !


!Cart methodsFor: 'accessing' stamp: 'LL 1/20/2021 21:51:06'!
quantityOf: aBook
	
	^books occurrencesOf: aBook! !

!Cart methodsFor: 'accessing' stamp: 'LL 1/24/2021 17:42:15'!
total
	
	^books sum: [ :aBook | bookCatalog at: aBook ].! !


!Cart methodsFor: 'testing' stamp: 'LL 1/21/2021 21:39:26'!
includes: aBook

	^ books includes: aBook! !

!Cart methodsFor: 'testing' stamp: 'LL 1/20/2021 21:33:04'!
isEmpty

	^books isEmpty! !


!Cart methodsFor: 'private - assertions' stamp: 'LL 1/24/2021 15:49:03'!
assertIsInCatalog: aBook

	^ (bookCatalog includesKey: aBook) ifFalse: [ self error: self class bookNotInCatalogErrorMessage ]! !

!Cart methodsFor: 'private - assertions' stamp: 'LL 1/21/2021 21:27:21'!
assertValidNumberOfCopies: numberOfBooksToAdd

	^ numberOfBooksToAdd strictlyPositive ifFalse: [ self error: self class invalidNumberOfCopiesErrorMessage ]! !


!Cart methodsFor: 'as yet unclassified' stamp: 'CZ 2/22/2021 14:03:17'!
books

	^books copy.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: 'TusLibros-Ejercicio'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'LL 1/25/2021 18:29:34'!
acceptingItemsOf: aBookCatalog
 
	^self new initializeWithCatalog: aBookCatalog ! !


!Cart class methodsFor: 'error messages' stamp: 'LL 1/20/2021 21:45:09'!
bookNotInCatalogErrorMessage

	^'Cannot add a book that is not from the editorial'! !

!Cart class methodsFor: 'error messages' stamp: 'LL 1/21/2021 21:27:21'!
invalidNumberOfCopiesErrorMessage

	^'Cannot add zero books'! !


!classDefinition: #Cashier category: 'TusLibros-Ejercicio'!
Object subclass: #Cashier
	instanceVariableNames: 'salesBook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!Cashier methodsFor: 'initialization' stamp: 'LL 1/25/2021 18:49:19'!
initializeWithSalesBook: aSalesBook

	salesBook := aSalesBook! !


!Cashier methodsFor: 'checkout' stamp: 'LL 1/25/2021 23:10:38'!
checkout: aCart payingWith: aCreditCard through: aMerchantProcessor on: aCheckoutDateTime  

	| ticket |
	self assertCanCheckout: aCart using: aCreditCard on: aCheckoutDateTime.
	
	ticket := aCart total.
	
	self debit: ticket value from: aCreditCard using: aMerchantProcessor.
	
	self registerSale: ticket.
	
	^ticket! !


!Cashier methodsFor: 'assertions' stamp: 'LL 1/25/2021 23:10:22'!
assertCanCheckout: aCart using: aCreditCard on: aDateTime 

	self assertContainsBooks: aCart.
	self assertIsNotExpired: aCreditCard on: aDateTime! !

!Cashier methodsFor: 'assertions' stamp: 'LL 1/24/2021 17:45:42'!
assertContainsBooks: aCart

	^ aCart isEmpty ifTrue: [	 self error: Cashier cannotCheckoutAnEmptyCart ]! !

!Cashier methodsFor: 'assertions' stamp: 'LL 1/25/2021 23:11:12'!
assertIsNotExpired: aCreditCard on: aDateTime 

	^ (aCreditCard isExpiredOn: aDateTime) ifTrue: [ self error: Cashier cannotCheckoutUsingAnExpiredCard ]! !


!Cashier methodsFor: 'private' stamp: 'LL 1/24/2021 18:23:28'!
debit: anAmount from: aCreditCard using: aMerchantProcessor

	^ [ aMerchantProcessor debit: anAmount from: aCreditCard ]
		on: Error - MessageNotUnderstood 
		do: [ :exceptionRaised |
			self error: self class couldNotProcessPaymentErrorMessage.
		]! !

!Cashier methodsFor: 'private' stamp: 'LL 1/25/2021 19:50:24'!
registerSale: ticket

	^ salesBook add: ticket! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: 'TusLibros-Ejercicio'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'as yet unclassified' stamp: 'LL 1/21/2021 21:50:07'!
cannotCheckoutAnEmptyCart
	^'Cannot checkout an empty cart'! !

!Cashier class methodsFor: 'as yet unclassified' stamp: 'LL 1/24/2021 16:44:06'!
cannotCheckoutUsingAnExpiredCard

	^'Cannot checkout using an expired card'! !

!Cashier class methodsFor: 'as yet unclassified' stamp: 'LL 1/24/2021 18:13:36'!
couldNotProcessPaymentErrorMessage

	^'Cart was rejected'! !

!Cashier class methodsFor: 'as yet unclassified' stamp: 'LL 1/25/2021 18:48:59'!
registeringSalesOn: aSalesBook

	^ self new initializeWithSalesBook: aSalesBook.! !


!classDefinition: #ClockMock category: 'TusLibros-Ejercicio'!
Object subclass: #ClockMock
	instanceVariableNames: 'currentTime'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!ClockMock methodsFor: 'clock mock management' stamp: 'CZ 2/25/2021 16:46:14'!
currentTime

	^currentTime copy.! !

!ClockMock methodsFor: 'clock mock management' stamp: 'CZ 2/25/2021 16:16:33'!
forwardTime: aSpan

	currentTime _ currentTime + aSpan.! !


!ClockMock methodsFor: 'initialization' stamp: 'CZ 2/25/2021 16:25:18'!
initialize

	currentTime _ DateAndTime now.! !


!classDefinition: #CreditCard category: 'TusLibros-Ejercicio'!
Object subclass: #CreditCard
	instanceVariableNames: 'creditCardNumber owner expirationDate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!CreditCard methodsFor: 'initialization' stamp: 'LL 2/16/2021 18:05:42'!
initializeOf: aPerson number: aCreditCardNumber expiringOn: aMonthOfYear 

	owner := aPerson.
	creditCardNumber := aCreditCardNumber.
	expirationDate := aMonthOfYear.! !


!CreditCard methodsFor: 'testing' stamp: 'LL 2/16/2021 18:05:42'!
isExpiredOn: aDateTime

	^ aDateTime > (expirationDate lastDate)! !


!CreditCard methodsFor: 'as yet unclassified' stamp: 'CZ 2/24/2021 23:27:33'!
creditCardNumber

	^creditCardNumber copy.! !

!CreditCard methodsFor: 'as yet unclassified' stamp: 'CZ 2/24/2021 23:28:34'!
expirationDate

	^expirationDate copy.! !

!CreditCard methodsFor: 'as yet unclassified' stamp: 'CZ 2/24/2021 23:28:16'!
ownersName

	^owner copy.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: 'TusLibros-Ejercicio'!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'LL 1/24/2021 18:15:40'!
of: nameOfTheOwner number: aCreditCardNumber expiringOn: aMonthOfYear

	nameOfTheOwner isEmpty ifTrue: [ self error: self nameCannotBeBlankErrorMessage ].
	
	^self new initializeOf: nameOfTheOwner number: aCreditCardNumber expiringOn: aMonthOfYear ! !


!CreditCard class methodsFor: 'as yet unclassified' stamp: 'LL 1/24/2021 18:01:14'!
nameCannotBeBlankErrorMessage

	^'Name cannot be blank'! !


!classDefinition: #InterfaceRest category: 'TusLibros-Ejercicio'!
Object subclass: #InterfaceRest
	instanceVariableNames: 'clientId clientPassword carts actualCartId catalog cartAndClientIds clients clock timesOfLastOperationOnCarts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!InterfaceRest methodsFor: 'interface rest management' stamp: 'CZ 2/25/2021 18:38:28'!
addToCart: aCartId aBook: aBookIsbn quantity: aQuantity
	
	| aCart |
		
	aCart _ self assertExistenceOfCartWithId: aCartId.
	
	self validateExpirationTimeOfCartWithId: aCartId.

	aCart add: aBookIsbn quantity: aQuantity.
	
	self updateTimeOfLastOperationOnCartWithId: aCartId.
	
	
	

	! !

!InterfaceRest methodsFor: 'interface rest management' stamp: 'CZ 2/25/2021 18:39:10'!
checkoutCartWithId: aCartId andCreditCardNumber: aCreditCardNumber andExpiratioDate: anExpirationDate andOwnersName: anOwnersName
	
	| aCart aCreditCard aCashier aSalesBook |
	
	aCart _ self assertExistenceOfCartWithId: aCartId.
	
	self validateExpirationTimeOfCartWithId: aCartId.
	
	aCreditCard _ CreditCard new initializeOf: anOwnersName number: aCreditCardNumber expiringOn: anExpirationDate.
	
	aSalesBook := OrderedCollection new.
	aCashier := Cashier registeringSalesOn: aSalesBook.
	
	self updateTimeOfLastOperationOnCartWithId: aCartId.
	
	^aCashier checkout: aCart payingWith: aCreditCard through: MerchantProcessorMock new on: (GregorianDateTime now).! !

!InterfaceRest methodsFor: 'interface rest management' stamp: 'CZ 2/25/2021 17:08:55'!
createCartWithClientId: aClientId andPassword: aPassword
	
	(clients includesKey: aClientId) ifFalse:[self signalCannotExecuteOperationWithInvalidClientsCredentials ].
	(clients at: aClientId) = aPassword ifFalse:[self signalCannotExecuteOperationWithInvalidClientsCredentials].

	
	actualCartId _ actualCartId + 1.
    	carts at: actualCartId put: (Cart acceptingItemsOf: catalog).
	cartAndClientIds at: actualCartId put: aClientId. "Id carrito -> Id cliente"
    	timesOfLastOperationOnCarts at: actualCartId put: clock currentTime.

   	^actualCartId.

	! !

!InterfaceRest methodsFor: 'interface rest management' stamp: 'CZ 2/25/2021 17:33:21'!
forwardClockTime: aSpan

	clock forwardTime: aSpan! !

!InterfaceRest methodsFor: 'interface rest management' stamp: 'CZ 2/25/2021 18:38:50'!
updateTimeOfLastOperationOnCartWithId: aCartId

	timesOfLastOperationOnCarts at: aCartId put: clock currentTime.! !


!InterfaceRest methodsFor: 'testing - private' stamp: 'CZ 2/25/2021 18:36:20'!
assertExistenceOfCartWithId: aCartId

	^carts at: aCartId ifAbsent:[self signalCannotExecuteOperationWithInvalidCartId].
! !

!InterfaceRest methodsFor: 'testing - private' stamp: 'CZ 2/25/2021 17:01:09'!
validateExpirationTimeOfCartWithId: aCartId

	(clock currentTime - (timesOfLastOperationOnCarts at: aCartId)) minutes >= 30 ifTrue:[self signalCannotExecuteOperationWithExpiredCart].! !


!InterfaceRest methodsFor: 'initialization' stamp: 'CZ 2/25/2021 16:50:01'!
initializeWithCatalog: aCatalog andClients: aClientsDictionary usingClock: aClock
	
	clients _ aClientsDictionary.
	carts _ Dictionary new.
	actualCartId _ 0.
	catalog _ 	aCatalog.
	cartAndClientIds _ Dictionary new.
	clock _ aClock.
	timesOfLastOperationOnCarts _ Dictionary new.
	! !


!InterfaceRest methodsFor: 'accessing' stamp: 'CZ 2/25/2021 18:39:17'!
listCartWithId: aCartId
	
	| aCart |
	
	aCart _ self assertExistenceOfCartWithId: aCartId.
	
	self validateExpirationTimeOfCartWithId: aCartId.
	
	self updateTimeOfLastOperationOnCartWithId: aCartId.
	
	^aCart books.! !

!InterfaceRest methodsFor: 'accessing' stamp: 'CZ 2/25/2021 15:38:08'!
listPurchasesOf: aClientId withPassword: aPassword

	| cartIdsOfClient listOfBooks |
	
	(clients includesKey: aClientId) ifFalse:[self signalCannotExecuteOperationWithInvalidClientsCredentials ].
	(clients at: aClientId) = aPassword ifFalse:[self signalCannotExecuteOperationWithInvalidClientsCredentials].
	
	cartIdsOfClient _ cartAndClientIds select: [:c | c = aClientId ].
	
	listOfBooks _ OrderedCollection new.
	
	cartIdsOfClient keysDo: [ :aCartId | (carts at: aCartId) books do: [:aBookIsbn | listOfBooks add: aBookIsbn]].
	
	^listOfBooks.! !


!InterfaceRest methodsFor: 'signal errors' stamp: 'CZ 2/24/2021 20:39:29'!
signalCannotAddToCartABookAbsentInCatalog

	^self error: self class cannotAddToCartABookAbsentInCatalogErrorMessage! !

!InterfaceRest methodsFor: 'signal errors' stamp: 'CZ 2/25/2021 17:02:11'!
signalCannotExecuteOperationWithExpiredCart

	^self error: self class cannotExecuteOperationWithExpiredCartErrorMessage.! !

!InterfaceRest methodsFor: 'signal errors' stamp: 'CZ 2/25/2021 18:26:47'!
signalCannotExecuteOperationWithInvalidCartId
	
	^self error: self class cannotExecuteOperationWithInvalidCartIdErrorMessage.! !

!InterfaceRest methodsFor: 'signal errors' stamp: 'CZ 2/25/2021 15:38:31'!
signalCannotExecuteOperationWithInvalidClientsCredentials

	^self error: self class cannotExecuteOperationWithInvalidClientsCredentialsErrorMessage.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InterfaceRest class' category: 'TusLibros-Ejercicio'!
InterfaceRest class
	instanceVariableNames: ''!

!InterfaceRest class methodsFor: 'error messages' stamp: 'CZ 2/24/2021 20:40:34'!
cannotAddToCartABookAbsentInCatalogErrorMessage

	^'Cannot add to cart a book absent in catalog'! !

!InterfaceRest class methodsFor: 'error messages' stamp: 'CZ 2/25/2021 17:02:25'!
cannotExecuteOperationWithExpiredCartErrorMessage
	
	^'Cannot execute operation with expired cart'! !

!InterfaceRest class methodsFor: 'error messages' stamp: 'CZ 2/25/2021 18:27:45'!
cannotExecuteOperationWithInvalidCartIdErrorMessage

	^'Cannot execute operation with invalid cart id'! !

!InterfaceRest class methodsFor: 'error messages' stamp: 'CZ 2/25/2021 15:38:47'!
cannotExecuteOperationWithInvalidClientsCredentialsErrorMessage

	^'Cannot execute operation with invalid clients credentials'.! !


!InterfaceRest class methodsFor: 'initialization' stamp: 'CZ 2/25/2021 16:34:54'!
createWithCatalog: aCatalog andClients: validClients usingClock: aClock

	^self new initializeWithCatalog: aCatalog andClients: validClients usingClock: aClock! !


!classDefinition: #MerchantProcessorMock category: 'TusLibros-Ejercicio'!
Object subclass: #MerchantProcessorMock
	instanceVariableNames: 'clientId clientPassword dateTimeOfLastOperation carts cartId actualCartId catalog debitedAmountFromCreditCard debitedCreditCard'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!MerchantProcessorMock methodsFor: 'merchant processor management' stamp: 'JT 2/25/2021 01:18:08'!
debit: anAmount from: aCreditCard

	debitedAmountFromCreditCard := anAmount.
	debitedCreditCard := aCreditCard.
	
! !


!classDefinition: #PublisherTestObjectsFactory category: 'TusLibros-Ejercicio'!
Object subclass: #PublisherTestObjectsFactory
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!PublisherTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'LL 2/16/2021 19:41:18'!
aCashier

	| salesBook |
	salesBook := OrderedCollection new.
	^ Cashier registeringSalesOn: salesBook.! !

!PublisherTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'CZ 2/24/2021 20:05:48'!
aCatalog

	^Dictionary newFromPairs: {self bookFromTheEditorial. self bookFromTheEditorialPrice}.! !

!PublisherTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'CZ 2/25/2021 16:26:42'!
aClock

	^ClockMock new.! !

!PublisherTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'CZ 2/25/2021 15:34:07'!
aValidClientId

	^1234! !

!PublisherTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'CZ 2/25/2021 15:34:15'!
aValidClientPassword

	^5678! !

!PublisherTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'JT 2/25/2021 00:46:45'!
aValidCreditCard

	| nextMonth |
	nextMonth := (FixedGregorianDate today next: GregorianMonth oneMonth) monthOfYear.
	^CreditCard of: 'Juan Perez' number: 11111111 expiringOn: nextMonth.! !

!PublisherTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'JT 2/25/2021 00:48:29'!
aValidCreditCardExpirationDate

	^(FixedGregorianDate today next: GregorianMonth oneMonth) monthOfYear.! !

!PublisherTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'CZ 2/24/2021 23:33:49'!
aValidCreditCardNumber

	^11111111.! !

!PublisherTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'CZ 2/24/2021 23:35:03'!
aValidCreditCardOwnersName

	^'Juan Perez'.! !

!PublisherTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'CZ 2/24/2021 20:05:03'!
anEmptyCart

	^Cart acceptingItemsOf: self aCatalog.! !

!PublisherTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'LL 2/16/2021 19:51:21'!
anEmptySalesBook

	^OrderedCollection new.! !

!PublisherTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'LL 2/16/2021 19:43:38'!
anExpiredCreditCard
	
	| lastMonth |
	lastMonth := (FixedGregorianDate today previous: GregorianMonth oneMonth) monthOfYear.
	^CreditCard of: 'Juan Perez' number: 11111111 expiringOn: lastMonth.! !

!PublisherTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'CZ 2/25/2021 16:36:18'!
anInterfaceRest

	^InterfaceRest createWithCatalog: self aCatalog andClients: self clientsIdsAndPasswords usingClock: self aClock ! !

!PublisherTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'LL 1/24/2021 15:59:26'!
bookFromTheEditorial

	^ 'ABC123'! !

!PublisherTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'LL 1/24/2021 17:11:28'!
bookFromTheEditorialPrice

	^ 1000 * peso! !

!PublisherTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'LL 2/16/2021 19:46:27'!
cartWithABook

	| cart |
	cart := self anEmptyCart.
	cart add: self bookFromTheEditorial.
	^cart! !

!PublisherTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'CZ 2/25/2021 15:28:46'!
clientsIdsAndPasswords

	^Dictionary with: 1234->5678 with: 3345->5432 with: 8902->1490 with: 3006->2457.! !

!PublisherTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'JT 2/22/2021 20:37:36'!
now 

	^GregorianDateTime now! !
