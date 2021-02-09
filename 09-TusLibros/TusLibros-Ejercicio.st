!classDefinition: #CartTest category: 'TusLibros-Ejercicio'!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!CartTest methodsFor: 'as yet unclassified' stamp: 'CZ 2/8/2021 21:36:57'!
test01
"carrito vacio"
	
	| aCart |
	aCart _ Cart new.
	
	self assert: (aCart isEmpty).! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'CZ 2/8/2021 21:37:08'!
test02
"se agrega libro al carrito vacio"
	
	| aCart aBook |
	aCart _ Cart new.
	aBook _ 'Libro nuevo'.
	
	aCart addBook: aBook.
	
	self deny: (aCart isEmpty).! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'CZ 2/8/2021 21:37:16'!
test03
"se agregan varios libros al carrito vacio"
	
	| aCart aBook anotherBook |
	aCart _ Cart new.
	aBook _ 'A book'.
	anotherBook _ 'Another book'.
	
	aCart addBook: aBook.
	aCart addBook: anotherBook.
	
	self deny: (aCart isEmpty).! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'CZ 2/8/2021 21:38:40'!
test04
"se verifica la existencia de ciertos libros en el carrito"
	
	| aCart aBook anotherBook |
	aCart _ Cart new.
	aBook _ 'A book'.
	anotherBook _ 'Another book'.
	
	aCart addBook: aBook.
	aCart addBook: anotherBook.
	
	self assert: (aCart hasBook: aBook).
	self assert: (aCart hasBook: anotherBook).! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'CZ 2/8/2021 21:49:55'!
test05
"se verifica la existencia de ciertos libros en el carrito"
	
	| aCart aBook anotherBook |
	aCart _ Cart new.
	aBook _ 'A book'.
	anotherBook _ 'Another book'.
	
	aCart addBook: aBook.
	
	self assert: (aCart hasBook: aBook).
	self deny: (aCart hasBook: anotherBook).! !


!classDefinition: #Cart category: 'TusLibros-Ejercicio'!
Object subclass: #Cart
	instanceVariableNames: 'books'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!Cart methodsFor: 'as yet unclassified' stamp: 'CZ 2/8/2021 21:34:00'!
addBook: bookToAdd
	
	books add: bookToAdd.
	! !

!Cart methodsFor: 'as yet unclassified' stamp: 'CZ 2/8/2021 21:52:43'!
hasBook: bookToVerify

	^books includes: 	bookToVerify.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'CZ 2/8/2021 21:35:25'!
initialize

	books _ OrderedCollection new.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'CZ 2/8/2021 21:35:15'!
isEmpty

	^books isEmpty.! !


!classDefinition: #NameOfSubclass category: 'TusLibros-Ejercicio'!
Object subclass: #NameOfSubclass
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!
