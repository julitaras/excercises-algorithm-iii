!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'JT 11/4/2020 22:29:52'!
canNotDo: customerAction causedBy: errorType shouldReturn: assert1 and: assert2

[customerAction value.
	self fail ]
		on: errorType 
		do: [ :anError | 
			self assert: assert1.
			self assert: assert2]! !

!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'JT 11/4/2020 22:33:20'!
canNotDo: customerAction causedBy: errorType with: anError shouldReturn: assert1 and: assert2

[customerAction value.
	self fail ]
		on: errorType 
		do: [ anError | 
			self assert: assert1.
			self assert: assert2]! !

!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'JT 11/4/2020 23:23:39'!
canNotSuspend: suspendedCustomer in: customerBook checkingExistanceOf: customerInBook
[ customerBook suspendCustomerNamed: suspendedCustomer.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: customerInBook) ]
! !

!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'JT 11/4/2020 23:10:55'!
evaluateActionOnSuspendedCustomerWith: customerBook hopingFor: numberOfActiveCustomersExpected and: numberOfSuspendedCustomersExpected and: numberOfCustomersExpected assessing: logicalExpression

	self assert: numberOfActiveCustomersExpected equals: customerBook numberOfActiveCustomers.
	self assert: numberOfSuspendedCustomersExpected equals: customerBook numberOfSuspendedCustomers.
	self assert: numberOfCustomersExpected equals: customerBook numberOfCustomers.
	logicalExpression value.! !

!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'CZ 11/2/2020 21:57:36'!
evaluateTimeWithCustomerActionAndName: customerActionAndName  From: referenceTime
	|millisecondsBeforeRunning millisecondsAfterRunning|.
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	customerActionAndName.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (referenceTime * millisecond).! !

!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'CZ 11/2/2020 21:32:48'!
initializeCustomerBook: customerName xxx: wantToAddACustomer
	|customerBook|
	customerBook  := CustomerBook new.
	wantToAddACustomer ifTrue: [customerBook addCustomerNamed: customerName]. 
	^customerBook.! !


!CustomerBookTest methodsFor: 'tests' stamp: 'CZ 11/2/2020 21:58:38'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self evaluateTimeWithCustomerActionAndName: (customerBook addCustomerNamed: 'John Lennon')  From: 50.

	
	"
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	customerBook addCustomerNamed: 'John Lennon'.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (50 * millisecond)"
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'JT 11/4/2020 23:50:58'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	
	self evaluateTimeWithCustomerActionAndName: (customerBook removeCustomerNamed: paulMcCartney )  From: 100.

	"
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	customerBook removeCustomerNamed: paulMcCartney.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (100 * millisecond)"
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'JT 11/4/2020 23:33:47'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	"self canNotDo: [customerBook addCustomerNamed: ''] causedBy: Error with: anError shouldReturn: (anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage) and: customerBook isEmpty."
	
	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'tests' stamp: 'JT 11/4/2020 23:34:03'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	"self canNotDo: [customerBook removeCustomerNamed: 'Paul McCartney'] causedBy: NotFound shouldReturn: (customerBook numberOfCustomers = 1) and: (customerBook includesCustomerNamed: johnLennon)."
	
	[ customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		on: NotFound 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'JT 11/4/2020 23:14:42'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self evaluateActionOnSuspendedCustomerWith: customerBook hopingFor: 0 and: 1 and: 1 assessing: [self assert: (customerBook includesCustomerNamed: paulMcCartney)].

	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'JT 11/4/2020 23:14:49'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self evaluateActionOnSuspendedCustomerWith: customerBook hopingFor: 0 and: 0 and: 0 assessing: [self deny: (customerBook includesCustomerNamed: paulMcCartney)].
	
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'JT 11/4/2020 23:24:20'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self canNotSuspend: 'Ringo Starr' in: customerBook checkingExistanceOf: johnLennon.
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'JT 11/4/2020 23:24:11'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self canNotSuspend: johnLennon in: customerBook  checkingExistanceOf: johnLennon.
! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'LL 10/30/2020 12:22:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'JT 11/5/2020 00:24:58'!
removeCustomerNamed: aName 
 	
	|name|
	name := self removeCustomerNamed: aName status: active.
	name = 'not found' ifFalse: [^name].
	

	
	name := self removeCustomerNamed: aName status: suspended.
	name = 'not found' ifFalse: [^name].
	
	"1 to: active size do: 
	[ :index |
		aName = (active at: index)
			ifTrue: [
				active removeAt: index.
				^ aName 
			] 
	].
	

	1 to: suspended size do: 	
	[ :index |
		aName = (suspended at: index)
			ifTrue: [
				suspended removeAt: index.
				^ aName 
			] 
	]."
	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'JT 11/5/2020 00:25:10'!
removeCustomerNamed: aName status: status
 
	1 to: status size do: 
	[ :index |
		aName = (status at: index)
			ifTrue: [
				status removeAt: index.
				^ aName 
			] 
	].


	^ 'not found'. ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
