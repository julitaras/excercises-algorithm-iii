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

!CartTest methodsFor: 'tests' stamp: 'CZ 2/11/2021 00:14:42'!
test02ABookIsAddedAndTheCartIsNotEmptyAnymore
	
	| aCart aBook |
	
	aCart _ Cart new.
	aBook _ 9789877250244.
	
	aCart addBook: aBook quantity: 1.
	
	self deny: (aCart isEmpty).! !

!CartTest methodsFor: 'tests' stamp: 'CZ 2/11/2021 00:14:52'!
test03MultipleBooksAreAddedAndTheCartIsNotEmptyAnymore
	
	| aCart aBook anotherBook |
	
	aCart _ Cart new.
	aBook _ 9789877250244.
	anotherBook _ 9789585118300.
	
	aCart addBook: aBook quantity: 1.
	aCart addBook: anotherBook quantity: 1.
	
	self deny: (aCart isEmpty).! !

!CartTest methodsFor: 'tests' stamp: 'CZ 2/11/2021 00:15:02'!
test04MultipleBooksAreAddedAndTheyAreStoredInTheCart
	
	| aCart aBook anotherBook |
	
	aCart _ Cart new.
	aBook _ 9789877250244.
	anotherBook _ 9789585118300.
	
	aCart addBook: aBook quantity: 1.
	aCart addBook: anotherBook quantity: 1.
	
	self assert: (aCart hasBook: aBook).
	self assert: (aCart hasBook: anotherBook).! !

!CartTest methodsFor: 'tests' stamp: 'CZ 2/10/2021 23:15:49'!
test05ABookThatIsNotAddedIsNotStoredInTheCart
	
	| aCart aBook anotherBook |
	
	aCart _ Cart new.
	aBook _ 9789877250244.
	anotherBook _ 9789585118300.
	
	aCart addBook: aBook quantity: 1.
	
	self assert: (aCart hasBook: aBook).
	self deny: (aCart hasBook: anotherBook).! !

!CartTest methodsFor: 'tests' stamp: 'CZ 2/11/2021 00:15:21'!
test06ABookIsAddedMoreThanOnceAndTheNumberOfCopiesAndSizeOfCartAreCorrect
	
	| aCart aBook anotherBook |
	
	aCart _ Cart new.
	aBook _ 9789877250244.
	anotherBook _ 9789585118300.
	
	aCart addBook: aBook quantity: 2.
	aCart addBook: anotherBook quantity: 1.
	
	self assert: (aCart size = 3).
	self assert: ((aCart numberOfCopiesOf: aBook) = 2).
	self assert: ((aCart numberOfCopiesOf: anotherBook) = 1).
! !

!CartTest methodsFor: 'tests' stamp: 'CZ 2/11/2021 10:09:39'!
test07BookQuantityCannotBeLessThanOne
	
	| aCart aBook |
	
	aCart _ Cart new.
	aBook _ 9789877250244.
	
	self 
        should: [ aCart addBook: aBook quantity: 0 ]
        raise: Error
        asserting: [ :anError |
		self assert: anError messageText = Cart quantityCannotBeLessThanOneErrorMessage.
		self assert: aCart isEmpty].
	
	
! !

!CartTest methodsFor: 'tests' stamp: 'CZ 2/10/2021 23:37:58'!
test08AnInvalidBookIsbnCannotBeAddedToTheCart
	
	| aCart aBook |
	
	aCart _ Cart new.
	aBook _ 9789721091651.
	
	self 
        should: [ aCart addBook: aBook quantity: 1 ]
        raise: Error
        asserting: [ :anError |
		self assert: anError messageText = Cart invalidIsbnCannotBeAddedToCartErrorMessage.
		self assert: aCart isEmpty.
		self deny: (aCart hasBook: aBook)].
	
	
! !

!CartTest methodsFor: 'tests' stamp: 'CZ 2/11/2021 10:57:27'!
test09ACartKnowsItsContent
	
	| aCart aBook anotherBook expectedBooksInCart |
	
	aCart _ Cart new.
	aBook _ 9789877250244.
	anotherBook _ 9789585118300.
	
	aCart addBook: aBook quantity: 2.
	aCart addBook: anotherBook quantity: 1.
	
	expectedBooksInCart _ OrderedCollection with: aBook with: aBook with: anotherBook.
	
	self assert: (aCart booksStored = expectedBooksInCart).
	! !


!CartTest methodsFor: 'assertions' stamp: 'CZ 2/11/2021 00:13:25'!
should: aBlockThatShouldFail raise: anExceptionType asserting: aVerificationBlock

	[ aBlockThatShouldFail value.
    	self fail ]
        		on: anExceptionType 
       		do: aVerificationBlock! !


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


!Cart methodsFor: 'testing' stamp: 'CZ 2/8/2021 21:52:43'!
hasBook: bookToVerify

	^books includes: 	bookToVerify.! !

!Cart methodsFor: 'testing' stamp: 'CZ 2/8/2021 21:35:15'!
isEmpty

	^books isEmpty.! !


!Cart methodsFor: 'accessing' stamp: 'CZ 2/11/2021 10:57:27'!
booksStored
	
	^books.! !

!Cart methodsFor: 'accessing' stamp: 'JT 2/10/2021 20:29:39'!
numberOfCopiesOf: bookToVerify

	^books occurrencesOf: bookToVerify.! !

!Cart methodsFor: 'accessing' stamp: 'JT 2/10/2021 20:21:40'!
size

	^books size.! !


!Cart methodsFor: 'cart management' stamp: 'CZ 2/11/2021 11:50:26'!
addBook: bookToAdd quantity: numberOfCopies

	self assertCanAddBook: bookToAdd withNumberOfCopies: numberOfCopies.
	
	numberOfCopies timesRepeat: [books add: bookToAdd].
	! !


!Cart methodsFor: 'assertions' stamp: 'CZ 2/11/2021 11:04:11'!
assertCanAddBook: bookToVerify withNumberOfCopies: numberOfCopiesToVerify

	(numberOfCopiesToVerify < 1) ifTrue: [self signalQuantityCannotBeLessThanOne].
	
	(Publisher hasBookInCatalog: bookToVerify) ifFalse:[self signalInvalidIsbnCannotBeAddedToCart].  ! !

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


!classDefinition: #Publisher category: 'TusLibros-Ejercicio'!
Object subclass: #Publisher
	instanceVariableNames: 'catalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!Publisher methodsFor: 'publisher management' stamp: 'CZ 2/11/2021 10:52:05'!
catalog
	
	^catalog.! !


!Publisher methodsFor: 'initialization' stamp: 'CZ 2/11/2021 10:50:30'!
initialize

	catalog _ OrderedCollection with: 9789877250244 with: 9789585118300 with: 9788408081548 with: 9789870711544 with: 9789871534388 with: 9788477511205. 
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Publisher class' category: 'TusLibros-Ejercicio'!
Publisher class
	instanceVariableNames: ''!

!Publisher class methodsFor: 'testing' stamp: 'CZ 2/11/2021 10:51:00'!
hasBookInCatalog: bookToVerify
	
	^self new catalog includes: bookToVerify.! !
