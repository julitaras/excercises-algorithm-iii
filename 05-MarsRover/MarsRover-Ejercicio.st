!classDefinition: #MarsRoverTest category: 'MarsRover-Ejercicio'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: 'north south east west forward backwards rotateLeft rotateRight invalidCommand'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 14:06:38'!
setUp
	
	north := North new.
	south := South new.
	east := East new.
	west := West new.
	forward := 'f'.
	backwards := 'b'.
	rotateLeft := 'l'.
	rotateRight := 'r'.
	invalidCommand := 'x'.
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:53:17'!
test01
	
	| marsRover |
	
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: north.
	
	self assert: (marsRover isIn: 0@0 andPointsTo: north).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:53:12'!
test02
	
	| marsRover |
	
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: north.
	
	self deny: (marsRover isIn: 0@0 andPointsTo: south).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:53:07'!
test03
	
	| marsRover |
	
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: north.
	
	self deny: (marsRover isIn: 0@1 andPointsTo: north).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:58:21'!
test04

	| marsRover |
	
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: north.
	marsRover executeCommand: forward.
	
	self assert: (marsRover isIn: 0@1 andPointsTo: north).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:58:27'!
test05
	
	| marsRover |
	
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: south.
	marsRover executeCommand: forward.
	
	self assert: (marsRover isIn: 0@-1 andPointsTo: south).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:58:31'!
test06
	
	| marsRover |
	
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: east.
	marsRover executeCommand: forward.
	
	self assert: (marsRover isIn: 1@0 andPointsTo: east).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:58:36'!
test07

	| marsRover |
	
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: west.
	marsRover executeCommand: forward.
	
	self assert: (marsRover isIn: -1@0 andPointsTo: west).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:58:47'!
test08

	| marsRover |
	
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: north.
	marsRover executeCommand:  backwards.
	
	self assert: (marsRover isIn: 0@-1 andPointsTo: north).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:58:52'!
test09
	
	| marsRover |
	
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: south.
	marsRover executeCommand: backwards.
	
	self assert: (marsRover isIn: 0@1 andPointsTo: south).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:59:00'!
test10
	
	| marsRover |
	
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: east.
	marsRover executeCommand: backwards.
	
	self assert: (marsRover isIn: -1@0 andPointsTo: east).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:59:09'!
test11

	| marsRover |
	
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: north.
	marsRover executeCommand: rotateLeft.
	
	self assert: (marsRover isIn: 0@0 andPointsTo: west).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:59:13'!
test12

	| marsRover |

	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: south.
	marsRover executeCommand: rotateLeft.
	
	self assert: (marsRover isIn: 0@0 andPointsTo: east).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:59:19'!
test13
	
	| marsRover |
	
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: east.
	marsRover executeCommand: rotateLeft.
	
	self assert: (marsRover isIn: 0@0 andPointsTo: north).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:59:24'!
test14

	| marsRover |
	
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: west.
	marsRover executeCommand: rotateLeft.
	
	self assert: (marsRover isIn: 0@0 andPointsTo: south).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:59:32'!
test15
	
	| marsRover |
	
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: north.
	marsRover executeCommand: rotateRight.
	
	self assert: (marsRover isIn: 0@0 andPointsTo: east).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:59:44'!
test16

	| marsRover |

	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: south.
	marsRover executeCommand: rotateRight.
	
	self assert: (marsRover isIn: 0@0 andPointsTo: west).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 13:00:00'!
test17

	| marsRover |

	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: east.
	marsRover executeCommand: rotateRight.
	
	self assert: (marsRover isIn: 0@0 andPointsTo: south).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 13:00:09'!
test18

	| marsRover |

	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: west.
	marsRover executeCommand: rotateRight.
	
	self assert: (marsRover isIn: 0@0 andPointsTo: north).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 14:02:17'!
test19

	| marsRover |

	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: north.
	
	[ marsRover executeCommand: invalidCommand.
		self fail]
			on: Error 
			do: [ :anError | 	
				self assert: (marsRover isIn: 0@0 andPointsTo: north).
				"self assert: anError messageText = Invalid"
				]
	
	! !


!classDefinition: #CardinalDirections category: 'MarsRover-Ejercicio'!
Object subclass: #CardinalDirections
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!CardinalDirections methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:04:14'!
= anotherCardinalDirection
	^self isKindOf: anotherCardinalDirection class.! !

!CardinalDirections methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:48:51'!
doBackwardsMovement
 	self subclassResponsibility! !

!CardinalDirections methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:48:57'!
doForwardMovement
 	self subclassResponsibility! !

!CardinalDirections methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:49:04'!
doRotateLeftMovement
 	self subclassResponsibility! !

!CardinalDirections methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:49:10'!
doRotateRightMovement
 	self subclassResponsibility! !


!classDefinition: #East category: 'MarsRover-Ejercicio'!
CardinalDirections subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!East methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:43:07'!
doBackwardsMovement
 	
	^-1@0! !

!East methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:44:18'!
doForwardMovement
		
	^1@0
	"(param isKindOf: Backwards) ifTrue: [^-1@0].
	
	(param isKindOf: Forward ) ifTrue: [^1@0].
	
	(param isKindOf: RotateLeft) ifTrue: [^ North new.].
	
	(param isKindOf: RotateRight) ifTrue: [^ South new.]."
	
	
	
	! !

!East methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:44:39'!
doRotateLeftMovement
		
	^ North new.
	"(param isKindOf: Backwards) ifTrue: [^-1@0].
	
	(param isKindOf: Forward ) ifTrue: [^1@0].
	
	(param isKindOf: RotateLeft) ifTrue: [^ North new.].
	
	(param isKindOf: RotateRight) ifTrue: [^ South new.]."
	
	
	
	! !

!East methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:44:51'!
doRotateRightMovement
		
	^ South new.
	
	"(param isKindOf: Backwards) ifTrue: [^-1@0].
	
	(param isKindOf: Forward ) ifTrue: [^1@0].
	
	(param isKindOf: RotateLeft) ifTrue: [^ North new.].
	
	(param isKindOf: RotateRight) ifTrue: [^ South new.]."
	
	
	
	! !


!classDefinition: #North category: 'MarsRover-Ejercicio'!
CardinalDirections subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!North methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:45:32'!
doBackwardsMovement
	
	^0@-1
	"(param isKindOf: Backwards ) ifTrue: [^0@-1].
	
	(param isKindOf: Forward) ifTrue: [^0@1].
	
	(param isKindOf: RotateLeft) ifTrue: [^ West new.].
	
	(param isKindOf: RotateRight) ifTrue: [^ East new.]."

	
	

	! !

!North methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:45:42'!
doForwardMovement
	
	^0@1
	"(param isKindOf: Backwards ) ifTrue: [^0@-1].
	
	(param isKindOf: Forward) ifTrue: [^0@1].
	
	(param isKindOf: RotateLeft) ifTrue: [^ West new.].
	
	(param isKindOf: RotateRight) ifTrue: [^ East new.]."

	
	

	! !

!North methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:45:54'!
doRotateLeftMovement
	
	^ West new.
	"(param isKindOf: Backwards ) ifTrue: [^0@-1].
	
	(param isKindOf: Forward) ifTrue: [^0@1].
	
	(param isKindOf: RotateLeft) ifTrue: [^ West new.].
	
	(param isKindOf: RotateRight) ifTrue: [^ East new.]."

	
	

	! !

!North methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:46:02'!
doRotateRightMovement
	
	^ East new.
	"(param isKindOf: Backwards ) ifTrue: [^0@-1].
	
	(param isKindOf: Forward) ifTrue: [^0@1].
	
	(param isKindOf: RotateLeft) ifTrue: [^ West new.].
	
	(param isKindOf: RotateRight) ifTrue: [^ East new.]."

	
	

	! !


!classDefinition: #South category: 'MarsRover-Ejercicio'!
CardinalDirections subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!South methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:46:38'!
doBackwardsMovement
	
	^ 0@1
	"(param isKindOf: Backwards ) ifTrue: [^ 0@1].
	
	(param isKindOf: Forward) ifTrue: [^ 0@-1].
	
	(param isKindOf: RotateLeft) ifTrue: [^ East new.].
	
	(param isKindOf: RotateRight) ifTrue: [^  West new.]."
	
	! !

!South methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:46:49'!
doForwardMovement
	
	^ 0@-1
	"(param isKindOf: Backwards ) ifTrue: [^ 0@1].
	
	(param isKindOf: Forward) ifTrue: [^ 0@-1].
	
	(param isKindOf: RotateLeft) ifTrue: [^ East new.].
	
	(param isKindOf: RotateRight) ifTrue: [^  West new.]."
	
	! !

!South methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:47:01'!
doRotateLeftMovement
	
	^ East new.
	"(param isKindOf: Backwards ) ifTrue: [^ 0@1].
	
	(param isKindOf: Forward) ifTrue: [^ 0@-1].
	
	(param isKindOf: RotateLeft) ifTrue: [^ East new.].
	
	(param isKindOf: RotateRight) ifTrue: [^  West new.]."
	
	! !

!South methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:47:13'!
doRotateRightMovement
	
	^ West new.
	"(param isKindOf: Backwards ) ifTrue: [^ 0@1].
	
	(param isKindOf: Forward) ifTrue: [^ 0@-1].
	
	(param isKindOf: RotateLeft) ifTrue: [^ East new.].
	
	(param isKindOf: RotateRight) ifTrue: [^  West new.]."
	
	! !


!classDefinition: #West category: 'MarsRover-Ejercicio'!
CardinalDirections subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!West methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:47:48'!
doBackwardsMovement
	
	^1@0
	
	"(param isKindOf: Backwards ) ifTrue: [^ 1@0].
	
	(param isKindOf: Forward ) ifTrue: [^-1@0].
	
	(param isKindOf: RotateLeft) ifTrue: [^ South new.].
	
	(param isKindOf: RotateRight) ifTrue: [^ North new.].	"! !

!West methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:47:58'!
doForwardMovement
	
	^-1@0
	
	"(param isKindOf: Backwards ) ifTrue: [^ 1@0].
	
	(param isKindOf: Forward ) ifTrue: [^-1@0].
	
	(param isKindOf: RotateLeft) ifTrue: [^ South new.].
	
	(param isKindOf: RotateRight) ifTrue: [^ North new.].	"! !

!West methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:48:09'!
doRotateLeftMovement
	
	^ South new.
	
	"(param isKindOf: Backwards ) ifTrue: [^ 1@0].
	
	(param isKindOf: Forward ) ifTrue: [^-1@0].
	
	(param isKindOf: RotateLeft) ifTrue: [^ South new.].
	
	(param isKindOf: RotateRight) ifTrue: [^ North new.].	"! !

!West methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:48:16'!
doRotateRightMovement
	
	^ North new.
	
	"(param isKindOf: Backwards ) ifTrue: [^ 1@0].
	
	(param isKindOf: Forward ) ifTrue: [^-1@0].
	
	(param isKindOf: RotateLeft) ifTrue: [^ South new.].
	
	(param isKindOf: RotateRight) ifTrue: [^ North new.].	"! !


!classDefinition: #MarsRover category: 'MarsRover-Ejercicio'!
Object subclass: #MarsRover
	instanceVariableNames: 'actualCoordenate actualCardinalDirection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 10:34:25'!
actualCardinalDirection
	
	^actualCardinalDirection! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 10:34:10'!
actualCoordenate
	
	^actualCoordenate! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 14:06:21'!
executeCommand: aCommand
	
	| command |
	
	aCommand = 'f' ifTrue: [command := Forward new].

	aCommand = 'b' ifTrue: [command := Backwards new].
	
	aCommand = 'l' ifTrue: [command := RotateLeft new].
	
	aCommand = 'r' ifTrue: [command := RotateRight new].
	
	aCommand = 'x' ifTrue: [^aCommand class signalCanNotExecuteAnInvalidCommand ].
	
	^ command executeCommandFor: self.
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'CZ 12/5/2020 20:11:58'!
initializeIn: newCoordenate andPointsTo: newCardinalDirection 
	actualCoordenate := newCoordenate .
	actualCardinalDirection := newCardinalDirection .! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:01:38'!
isIn: aCoordenate andPointsTo: aCardinalDirection
	^(actualCoordenate = aCoordenate  and: actualCardinalDirection = aCardinalDirection).! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 11:02:05'!
modifyActualCardinalDirectionWith: newCardinalDirection
	
	actualCardinalDirection := newCardinalDirection ! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 11:01:37'!
modifyActualCoordenateWith: newCoordenate
	
	actualCoordenate := newCoordenate ! !


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

!Commands methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 11:39:28'!
executeCommandFor: aMarsRover

	self subclassResponsibility! !

!Commands methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 14:02:52'!
signalCanNotExecuteAnInvalidCommand

	self error: self class canNotExecuteAnInvalidCommand.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Commands class' category: 'MarsRover-Ejercicio'!
Commands class
	instanceVariableNames: ''!

!Commands class methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 13:44:02'!
canNotExecuteAnInvalidCommand

	^'Cannot Execute An Invalid Command'! !


!classDefinition: #Backwards category: 'MarsRover-Ejercicio'!
Commands subclass: #Backwards
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!Backwards methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:50:37'!
executeCommandFor: aMarsRover
	
	| tempCoordenate |
	
	tempCoordenate := aMarsRover actualCardinalDirection doBackwardsMovement.
	
	aMarsRover modifyActualCoordenateWith: tempCoordenate.! !


!classDefinition: #Forward category: 'MarsRover-Ejercicio'!
Commands subclass: #Forward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!Forward methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:50:55'!
executeCommandFor: aMarsRover
	
	| tempCoordenate |
	
	tempCoordenate := aMarsRover actualCardinalDirection doForwardMovement.
	
	aMarsRover modifyActualCoordenateWith: tempCoordenate.! !


!classDefinition: #RotateLeft category: 'MarsRover-Ejercicio'!
Commands subclass: #RotateLeft
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!RotateLeft methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:51:09'!
executeCommandFor: aMarsRover
	
	| tempCardinalDirection |
	
	tempCardinalDirection := aMarsRover actualCardinalDirection doRotateLeftMovement.
	
	aMarsRover modifyActualCardinalDirectionWith: tempCardinalDirection.! !


!classDefinition: #RotateRight category: 'MarsRover-Ejercicio'!
Commands subclass: #RotateRight
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!RotateRight methodsFor: 'as yet unclassified' stamp: 'JT 12/7/2020 12:51:46'!
executeCommandFor: aMarsRover

	| tempCardinalDirection |
	
	tempCardinalDirection := aMarsRover actualCardinalDirection doRotateRightMovement.
	
	aMarsRover modifyActualCardinalDirectionWith: tempCardinalDirection.! !
