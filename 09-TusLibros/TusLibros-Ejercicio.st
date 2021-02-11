!classDefinition: #CartTest category: 'TusLibros-Ejercicio'!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!CartTest methodsFor: 'tests' stamp: 'JT 2/10/2021 21:23:24'!
test01
"Se crea un carrito y esta vacio"
	
	| aCart |
	
	aCart _ Cart new.
	
	self assert: (aCart isEmpty).! !

!CartTest methodsFor: 'tests' stamp: 'JT 2/10/2021 21:22:13'!
test02
"se agrega libro al carrito vacio"
	
	| aCart aBook |
	
	aCart _ Cart new.
	aBook _ 'Libro nuevo'.
	
	aCart addBook: aBook quantity: 1.
	
	self deny: (aCart isEmpty).! !

!CartTest methodsFor: 'tests' stamp: 'JT 2/10/2021 21:22:10'!
test03
"se agregan varios libros al carrito vacio"
	
	| aCart aBook anotherBook |
	
	aCart _ Cart new.
	aBook _ 'A book'.
	anotherBook _ 'Another book'.
	
	aCart addBook: aBook quantity: 1.
	aCart addBook: anotherBook quantity: 1.
	
	self deny: (aCart isEmpty).! !

!CartTest methodsFor: 'tests' stamp: 'JT 2/10/2021 21:22:06'!
test04
"se verifica la existencia de ciertos libros en el carrito"
	
	| aCart aBook anotherBook |
	
	aCart _ Cart new.
	aBook _ 'A book'.
	anotherBook _ 'Another book'.
	
	aCart addBook: aBook quantity: 1.
	aCart addBook: anotherBook quantity: 1.
	
	self assert: (aCart hasBook: aBook).
	self assert: (aCart hasBook: anotherBook).! !

!CartTest methodsFor: 'tests' stamp: 'JT 2/10/2021 21:22:02'!
test05
"se verifica la existencia de ciertos libros en el carrito"
	
	| aCart aBook anotherBook |
	
	aCart _ Cart new.
	aBook _ 'A book'.
	anotherBook _ 'Another book'.
	
	aCart addBook: aBook quantity: 1.
	
	self assert: (aCart hasBook: aBook).
	self deny: (aCart hasBook: anotherBook).! !

!CartTest methodsFor: 'tests' stamp: 'JT 2/10/2021 21:21:55'!
test06
"Que este la cantidad total agregada y que sean efectivamente los libros que se agregaron"
	
	| aCart aBook anotherBook |
	
	aCart _ Cart new.
	aBook _ 'A book'.
	anotherBook _ 'Another book'.
	
	aCart addBook: aBook quantity: 2.
	aCart addBook: anotherBook quantity: 1.
	
	self assert: (aCart size = 3).
	self assert: ((aCart numberOfCopiesOf: aBook) = 2).
	self assert: ((aCart numberOfCopiesOf: anotherBook) = 1).
! !

!CartTest methodsFor: 'tests' stamp: 'JT 2/10/2021 21:21:51'!
test07
"La cantidad agregada de libros no puede ser menor a 1"
	
	| aCart aBook |
	
	aCart _ Cart new.
	aBook _ 'A book'.
	
	self 
        should: [ aCart addBook: aBook quantity: 0 ]
        raise: Error
        asserting: [ :anError |
            self assert: anError messageText = Cart quantityCannotBeLessThanOneErrorMessage.
            self assert: aCart isEmpty].
	
	
! !


!CartTest methodsFor: 'assertions' stamp: 'JT 2/10/2021 21:17:14'!
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


!Cart methodsFor: 'signal error' stamp: 'JT 2/10/2021 21:11:50'!
signalQuantityCannotBeLessThanOne 

    self error: self class quantityCannotBeLessThanOneErrorMessage.! !


!Cart methodsFor: 'testing' stamp: 'CZ 2/8/2021 21:52:43'!
hasBook: bookToVerify

	^books includes: 	bookToVerify.! !

!Cart methodsFor: 'testing' stamp: 'CZ 2/8/2021 21:35:15'!
isEmpty

	^books isEmpty.! !

!Cart methodsFor: 'testing' stamp: 'JT 2/10/2021 20:29:39'!
numberOfCopiesOf: bookToVerify

	^books occurrencesOf: bookToVerify.! !


!Cart methodsFor: 'as yet unclassified' stamp: 'JT 2/10/2021 21:13:24'!
addBook: bookToAdd quantity: numberOfCopies

	(numberOfCopies < 1) ifTrue: [^self signalQuantityCannotBeLessThanOne].
	
	numberOfCopies timesRepeat: [books add: bookToAdd].
	! !

!Cart methodsFor: 'as yet unclassified' stamp: 'JT 2/10/2021 20:21:40'!
size

	^books size.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: 'TusLibros-Ejercicio'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'as yet unclassified' stamp: 'JT 2/10/2021 21:11:12'!
quantityCannotBeLessThanOneErrorMessage

    ^'Quantity cannot be less than one'! !
