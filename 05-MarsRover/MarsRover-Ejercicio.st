!classDefinition: #MarsRoverTest category: 'MarsRover-Ejercicio'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'CZ 12/5/2020 22:48:05'!
setUp
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'CZ 12/5/2020 20:03:00'!
test01
	| marsRover |
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: 'N'.
	
	self assert: (marsRover isIn: 0@0 andPointsTo: 'N').! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'CZ 12/5/2020 20:34:57'!
test02
	| marsRover |
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: 'N'.
	
	self deny: (marsRover isIn: 0@0 andPointsTo: 'S').! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'CZ 12/5/2020 20:37:44'!
test03
	| marsRover |
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: 'N'.
	
	self deny: (marsRover isIn: 0@1 andPointsTo: 'N').! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'CZ 12/5/2020 23:16:29'!
test04
	| marsRover|
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: 'N'.
	marsRover executeCommand: 'f'.
	
	self assert: (marsRover isIn: 0@1 andPointsTo: 'N').! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'CZ 12/5/2020 20:40:59'!
test05
	| marsRover |
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: 'S'.
	marsRover executeCommand: 'f'.
	
	self assert: (marsRover isIn: 0@-1 andPointsTo: 'S').! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'CZ 12/5/2020 20:44:54'!
test06
	| marsRover |
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: 'E'.
	marsRover executeCommand: 'f'.
	
	self assert: (marsRover isIn: 1@0 andPointsTo: 'E').! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'CZ 12/5/2020 20:53:04'!
test07
	| marsRover |
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: 'W'.
	marsRover executeCommand: 'f'.
	
	self assert: (marsRover isIn: -1@0 andPointsTo: 'W').! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'CZ 12/5/2020 20:54:23'!
test08
	| marsRover |
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: 'N'.
	marsRover executeCommand: 'b'.
	
	self assert: (marsRover isIn: 0@-1 andPointsTo: 'N').! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'CZ 12/5/2020 20:56:25'!
test09
	| marsRover |
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: 'S'.
	marsRover executeCommand: 'b'.
	
	self assert: (marsRover isIn: 0@1 andPointsTo: 'S').! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'CZ 12/5/2020 20:58:00'!
test10
	| marsRover |
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: 'E'.
	marsRover executeCommand: 'b'.
	
	self assert: (marsRover isIn: -1@0 andPointsTo: 'E').! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'CZ 12/5/2020 21:01:09'!
test11
	| marsRover |
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: 'N'.
	marsRover executeCommand: 'l'.
	
	self assert: (marsRover isIn: 0@0 andPointsTo: 'W').! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'CZ 12/5/2020 21:05:48'!
test12
	| marsRover |
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: 'S'.
	marsRover executeCommand: 'l'.
	
	self assert: (marsRover isIn: 0@0 andPointsTo: 'E').! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'CZ 12/5/2020 21:07:06'!
test13
	| marsRover |
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: 'E'.
	marsRover executeCommand: 'l'.
	
	self assert: (marsRover isIn: 0@0 andPointsTo: 'N').! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'CZ 12/5/2020 21:14:34'!
test14
	| marsRover |
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: 'W'.
	marsRover executeCommand: 'l'.
	
	self assert: (marsRover isIn: 0@0 andPointsTo: 'S').! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'CZ 12/5/2020 21:39:07'!
test15
	| marsRover |
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: 'N'.
	marsRover executeCommand: 'r'.
	
	self assert: (marsRover isIn: 0@0 andPointsTo: 'E').! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'CZ 12/5/2020 21:40:09'!
test16
	| marsRover |
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: 'S'.
	marsRover executeCommand: 'r'.
	
	self assert: (marsRover isIn: 0@0 andPointsTo: 'W').! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'CZ 12/5/2020 21:40:51'!
test17
	| marsRover |
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: 'E'.
	marsRover executeCommand: 'r'.
	
	self assert: (marsRover isIn: 0@0 andPointsTo: 'S').! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'CZ 12/5/2020 21:41:32'!
test18
	| marsRover |
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: 'W'.
	marsRover executeCommand: 'r'.
	
	self assert: (marsRover isIn: 0@0 andPointsTo: 'N').! !


!classDefinition: #MarsRover category: 'MarsRover-Ejercicio'!
Object subclass: #MarsRover
	instanceVariableNames: 'actualCoordenate actualCardinalDirection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'CZ 12/5/2020 20:11:58'!
initializeIn: newCoordenate andPointsTo: newCardinalDirection 
	actualCoordenate := newCoordenate .
	actualCardinalDirection := newCardinalDirection .! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'CZ 12/5/2020 20:38:28'!
isIn: aCoordenate andPointsTo: aCardinalDirection
	^(actualCoordenate = aCoordenate  and: actualCardinalDirection = aCardinalDirection).! !


!MarsRover methodsFor: 'accessing' stamp: 'CZ 12/5/2020 23:27:43'!
executeCommand: aCommand
	
	|command|
	
	aCommand = 'f' ifTrue: [command := Forward new].

	aCommand = 'b' ifTrue: [command := Backwards new].
	
	aCommand = 'l' ifTrue: [command := RotateLeft new].
	
	aCommand = 'r' ifTrue: [command := RotateRight new].
	
	^ command executeCommand.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-Ejercicio'!
MarsRover class
	instanceVariableNames: 'actualCoordenate actualCardinalDirection'!

!MarsRover class methodsFor: 'accessing' stamp: 'CZ 12/5/2020 20:20:47'!
initializeIn: newCooordenate andPointsTo: newCardinalDirection 
	^self new initializeIn: newCooordenate andPointsTo: newCardinalDirection ! !


!classDefinition: #Commands category: 'MarsRover-Ejercicio'!
MarsRover subclass: #Commands
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!Commands methodsFor: 'as yet unclassified' stamp: 'CZ 12/5/2020 22:40:28'!
executeCommand
	self subclassResponsibility! !


!classDefinition: #Backwards category: 'MarsRover-Ejercicio'!
Commands subclass: #Backwards
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!Backwards methodsFor: 'as yet unclassified' stamp: 'CZ 12/5/2020 22:38:19'!
executeCommand
	
	actualCardinalDirection = 'N' ifTrue: [actualCoordenate := 0@-1].
	actualCardinalDirection = 'S' ifTrue: [actualCoordenate := 0@1].
	actualCardinalDirection = 'E' ifTrue: [actualCoordenate := -1@0].
	actualCardinalDirection = 'W' ifTrue: [actualCoordenate := 1@0].! !


!classDefinition: #Forward category: 'MarsRover-Ejercicio'!
Commands subclass: #Forward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!Forward methodsFor: 'as yet unclassified' stamp: 'CZ 12/5/2020 22:37:42'!
executeCommand

	actualCardinalDirection = 'N' ifTrue: [actualCoordenate := 0@1].
	actualCardinalDirection = 'S' ifTrue: [actualCoordenate := 0@-1].
	actualCardinalDirection = 'E' ifTrue: [actualCoordenate := 1@0].
	actualCardinalDirection = 'W' ifTrue: [actualCoordenate := -1@0].! !


!classDefinition: #RotateLeft category: 'MarsRover-Ejercicio'!
Commands subclass: #RotateLeft
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!RotateLeft methodsFor: 'as yet unclassified' stamp: 'CZ 12/5/2020 22:40:51'!
executeCommand
	|tempCardinalDirection|
	actualCardinalDirection = 'N' ifTrue: [tempCardinalDirection := 'W'].
	actualCardinalDirection = 'S' ifTrue: [tempCardinalDirection := 'E'].
	actualCardinalDirection = 'E' ifTrue: [tempCardinalDirection := 'N'].
	actualCardinalDirection = 'W' ifTrue: [tempCardinalDirection := 'S'].
	
	actualCardinalDirection := tempCardinalDirection.! !


!classDefinition: #RotateRight category: 'MarsRover-Ejercicio'!
Commands subclass: #RotateRight
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!RotateRight methodsFor: 'as yet unclassified' stamp: 'CZ 12/5/2020 22:40:56'!
executeCommand
	|tempCardinalDirection|
	actualCardinalDirection = 'N' ifTrue: [tempCardinalDirection := 'E'].
	actualCardinalDirection = 'S' ifTrue: [tempCardinalDirection := 'W'].
	actualCardinalDirection = 'E' ifTrue: [tempCardinalDirection := 'S'].
	actualCardinalDirection = 'W' ifTrue: [tempCardinalDirection := 'N'].
	
	actualCardinalDirection := tempCardinalDirection.! !
