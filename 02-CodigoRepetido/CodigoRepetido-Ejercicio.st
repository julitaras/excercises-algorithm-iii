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

!CustomerBookTest methodsFor: 'complementary tests' stamp: 'CZ 11/9/2020 02:59:53'!
testCanNotSuspendCustomer1: suspendedCustomer in: customerBook andCheckExistanceOfCustomer2: customerThatShouldBeInBook
	
	"Chequea que a partir de que se retorna una excepcion (CantSuspend) a la hora de suspender a un cliente (suspendedCustomer), la cantidad de clientes en customerBook sea 1 y el nombre del cliente recibido como ultimo parametro se encuentre en customerBook. "

	[ customerBook suspendCustomerNamed: suspendedCustomer.
		self fail ]
			on: CantSuspend 
			do: [ :anError | 
				self assert: customerBook numberOfCustomers = 1.
				self assert: (customerBook includesCustomerNamed: customerThatShouldBeInBook) ]
! !

!CustomerBookTest methodsFor: 'complementary tests' stamp: 'CZ 11/9/2020 02:32:20'!
testCustomerAction: actionName shouldNotTakeMoreThan: referenceTimeInMilliseconds

	"Chequea que realizar una determinada accion sobre un cliente no tarde mas de un tiempo (en milisegundos) recibido por parametro."
	
	|millisecondsBeforeRunning millisecondsAfterRunning|.
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	actionName value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (referenceTimeInMilliseconds * millisecond).! !

!CustomerBookTest methodsFor: 'complementary tests' stamp: 'CZ 11/9/2020 03:04:16'!
testExpectedNumbersIn: customerBook ofActiveCustomers: number1 andSuspendedCustomers: number2 andTotalCustomers: number3 assessing: expectedCondition

	"Chequea que de acuerdo a la informacion contenida en customerBook, se encuentre la cantidad correcta de clientes activos, suspendidos y totales. Tambien evalua que se cumpla la condicion recibida como ultimo parametro."

	self assert: number1 equals: customerBook numberOfActiveCustomers.
	self assert: number2 equals: customerBook numberOfSuspendedCustomers.
	self assert: number3 equals: customerBook numberOfCustomers.
	self assert: expectedCondition value.! !


!CustomerBookTest methodsFor: 'tests' stamp: 'CZ 11/9/2020 02:29:05'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	"Chequea que agregar un cliente a customerBook no tarde mas 50 milisegundos."
	
	| customerBook |
	
	customerBook := CustomerBook new.
	
	self testCustomerAction: [customerBook addCustomerNamed: 'John Lennon'] shouldNotTakeMoreThan: 50.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'CZ 11/9/2020 02:07:46'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds
	
	"Chequea que remover un cliente de customerBook no tarde mas de 100 milisegundos."

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	
	self testCustomerAction: [customerBook removeCustomerNamed: paulMcCartney] shouldNotTakeMoreThan: 100.
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'CZ 11/9/2020 02:10:30'!
test03CanNotAddACustomerWithEmptyName 
	
	"Chequea que no se puede agregar un cliente con nombre vacio a customerBook."
	
	| customerBook|
			
	customerBook := CustomerBook new.

	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'tests' stamp: 'CZ 11/9/2020 02:11:07'!
test04CanNotRemoveAnInvalidCustomer
	
	"Chequea que no se puede remover un cliente inexistente de customerBook."
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	[ customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		on: NotFound 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]! !

!CustomerBookTest methodsFor: 'tests' stamp: 'CZ 11/9/2020 03:03:27'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	"Chequea que suspender a un cliente no lo remueva de customerBook."

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self testExpectedNumbersIn: customerBook ofActiveCustomers: 0 andSuspendedCustomers: 1 andTotalCustomers: 1 assessing: [customerBook includesCustomerNamed: paulMcCartney].

	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'CZ 11/9/2020 03:03:20'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	"Chequea que remover un cliente suspendido, efectivamente lo remueva de customerBook."

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self testExpectedNumbersIn: customerBook ofActiveCustomers: 0 andSuspendedCustomers: 0 andTotalCustomers: 0 assessing: [(customerBook includesCustomerNamed: paulMcCartney)not].! !

!CustomerBookTest methodsFor: 'tests' stamp: 'CZ 11/9/2020 02:57:00'!
test07CanNotSuspendAnInvalidCustomer
	
	"Chequea que no se puede suspender a un cliente inexistente en customerBook."	
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self testCanNotSuspendCustomer1: 'Ringo Starr' in: customerBook andCheckExistanceOfCustomer2: johnLennon.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'CZ 11/9/2020 02:57:09'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	"Chequea que no se puede suspender a un cliente previamente suspendido en customerBook."
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self testCanNotSuspendCustomer1: johnLennon in: customerBook andCheckExistanceOfCustomer2: johnLennon.! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'CZ 11/9/2020 02:39:18'!
initialize

	"Crea dos colecciones ordenadas llamadas active y suspended. "
	
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'CZ 11/9/2020 02:47:58'!
addCustomerNamed: aName

	"Agrega a la OrderedCollection active al cliente cuyo nombre es el recibido por parametro (aName). Si este nombre es vacio o ya existe en la coleccion, retorna una excepcion."

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	active add: aName.! !

!CustomerBook methodsFor: 'customer management' stamp: 'CZ 11/9/2020 02:48:03'!
removeCustomerNamed: aName 
 	
	"Remueve de la coleccion active al cliente cuyo nombre es el recibido por parametro (aName). Si no lo encuentra, lo busca en la coleccion suspended y lo remueve. Si no se encuentra en ninguna de las dos, retorna una excepcion."
	
	(active includes: aName) ifTrue: [active remove: aName. ^aName].
	
	(suspended includes: aName) ifTrue: [suspended remove: aName. ^aName].
	
 
	^ NotFound signal.
	
	
	
	
	
	
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
	]."! !

!CustomerBook methodsFor: 'customer management' stamp: 'CZ 11/9/2020 02:47:20'!
suspendCustomerNamed: aName 

	"Si el cliente cuyo nombre es el recibido por parametro (aName) se encuentra en la coleccion active, lo remueve de la misma y lo agrega a la coleccion suspended. Caso contrario, retorna una excepcion."
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'CZ 11/9/2020 02:40:24'!
numberOfActiveCustomers

	"Retorna el tamaño de la coleccion de clientes activos."
	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'CZ 11/9/2020 02:41:09'!
numberOfCustomers

	"Retorna la suma del numero de clientes activos y el numero de clientes suspendidos."
	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers.! !

!CustomerBook methodsFor: 'accessing' stamp: 'CZ 11/9/2020 02:40:43'!
numberOfSuspendedCustomers
	
	"Retorna el tamaño de la coleccion de clientes suspendidos."
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'CZ 11/9/2020 02:49:17'!
includesCustomerNamed: aName

	"Retorna True si el cliente cuyo nombre es el recibido por parametro (aName) se encuentra en las colecciones active o suspended. Caso contrario, retorna False."
	
	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'CZ 11/9/2020 02:42:14'!
isEmpty

	"Retorna True si ambas colecciones active y suspended se encuentran vacias. Caso contrario, retorna False."
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'signal errors' stamp: 'CZ 11/9/2020 02:42:23'!
signalCustomerAlreadyExists 

	"Retorna una excepcion para indicar que un cliente ya existe."
	
	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'CZ 11/9/2020 02:42:40'!
signalCustomerNameCannotBeEmpty

	"Retorna una excepcion para indicar que el nombre de un cliente no puede ser vacio."
	
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
