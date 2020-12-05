!classDefinition: #MarsRoverTest category: 'MarsRover-Ejercicio'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'JT 12/1/2020 02:54:52'!
test01

	| marsRover |
	marsRover := MarsRover initializeIn: 0@0 andPointsTo: 'N'.
	
	self assert: marsRover isIn = {0@0} 

! !


!classDefinition: #MarsRover category: 'MarsRover-Ejercicio'!
Object subclass: #MarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!
