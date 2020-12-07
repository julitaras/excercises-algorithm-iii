!classDefinition: #MarsRoverTest category: 'MarsRover-Ejercicio'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: 'north south east west forward backwards rotateLeft rotateRight anInvalidCommand'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!MarsRoverTest methodsFor: 'setUp' stamp: 'CZ 12/7/2020 18:34:04'!
setUp
	
	north := North new.
	south := South new.
	east := East new.
	west := West new.
	
	forward := $f.
	backwards := $b.
	rotateLeft := $l.
	rotateRight := $r.
	anInvalidCommand := $x.
	! !


!MarsRoverTest methodsFor: 'tests' stamp: 'CZ 12/7/2020 16:34:26'!
test01MoveForwardWhilePointingToNorthChangesCoordenateCorrectly

	| marsRover |
	
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: north.
	marsRover executeCommand: forward.
	
	self assert: (marsRover isIn: 0@1 andPointsTo: north).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'CZ 12/7/2020 16:35:34'!
test02MoveForwardWhilePointingToSouthChangesCoordenateCorrectly
	
	| marsRover |
	
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: south.
	marsRover executeCommand: forward.
	
	self assert: (marsRover isIn: 0@-1 andPointsTo: south).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'CZ 12/7/2020 16:35:58'!
test03MoveForwardWhilePointingToEastChangesCoordenateCorrectly
	
	| marsRover |
	
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: east.
	marsRover executeCommand: forward.
	
	self assert: (marsRover isIn: 1@0 andPointsTo: east).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'CZ 12/7/2020 16:36:26'!
test04MoveForwardWhilePointingToWestChangesCoordenateCorrectly

	| marsRover |
	
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: west.
	marsRover executeCommand: forward.
	
	self assert: (marsRover isIn: -1@0 andPointsTo: west).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'CZ 12/7/2020 16:37:33'!
test05MoveBackwardsWhilePointingToNorthChangesCoordenateCorrectly

	| marsRover |
	
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: north.
	marsRover executeCommand:  backwards.
	
	self assert: (marsRover isIn: 0@-1 andPointsTo: north).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'CZ 12/7/2020 16:38:00'!
test06MoveBackwardsWhilePointingToSouthChangesCoordenateCorrectly
	
	| marsRover |
	
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: south.
	marsRover executeCommand: backwards.
	
	self assert: (marsRover isIn: 0@1 andPointsTo: south).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'CZ 12/7/2020 16:38:25'!
test07MoveBackwardsWhilePointingToEastChangesCoordenateCorrectly
	
	| marsRover |
	
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: east.
	marsRover executeCommand: backwards.
	
	self assert: (marsRover isIn: -1@0 andPointsTo: east).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'CZ 12/7/2020 16:42:02'!
test08MoveBackwardsWhilePointingToWestChangesCoordenateCorrectly
	
	| marsRover |
	
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: west.
	marsRover executeCommand: backwards.
	
	self assert: (marsRover isIn: 1@0 andPointsTo: west).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'CZ 12/7/2020 16:50:18'!
test09RotateLeftWhilePointingToNorthChangesToWest

	| marsRover |
	
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: north.
	marsRover executeCommand: rotateLeft.
	
	self assert: (marsRover isIn: 0@0 andPointsTo: west).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'CZ 12/7/2020 16:50:45'!
test10RotateLeftWhilePointingToSouthChangesToEast

	| marsRover |

	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: south.
	marsRover executeCommand: rotateLeft.
	
	self assert: (marsRover isIn: 0@0 andPointsTo: east).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'CZ 12/7/2020 16:51:28'!
test11RotateLeftWhilePointingToEastChangesToNorth
	
	| marsRover |
	
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: east.
	marsRover executeCommand: rotateLeft.
	
	self assert: (marsRover isIn: 0@0 andPointsTo: north).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'CZ 12/7/2020 16:52:12'!
test12RotateLeftWhilePointingToWestChangesToSouth

	| marsRover |
	
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: west.
	marsRover executeCommand: rotateLeft.
	
	self assert: (marsRover isIn: 0@0 andPointsTo: south).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'CZ 12/7/2020 16:52:40'!
test13RotateRightWhilePointingToNorthChangesToEast
	
	| marsRover |
	
	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: north.
	marsRover executeCommand: rotateRight.
	
	self assert: (marsRover isIn: 0@0 andPointsTo: east).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'CZ 12/7/2020 16:53:14'!
test14RotateRightWhilePointingToSouthChangesToWest

	| marsRover |

	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: south.
	marsRover executeCommand: rotateRight.
	
	self assert: (marsRover isIn: 0@0 andPointsTo: west).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'CZ 12/7/2020 16:53:43'!
test15RotateRightWhilePointingToEastChangesToSouth

	| marsRover |

	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: east.
	marsRover executeCommand: rotateRight.
	
	self assert: (marsRover isIn: 0@0 andPointsTo: south).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'CZ 12/7/2020 16:54:09'!
test16RotateRightWhilePointingToWestChangesToNorth

	| marsRover |

	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: west.
	marsRover executeCommand: rotateRight.
	
	self assert: (marsRover isIn: 0@0 andPointsTo: north).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'CZ 12/7/2020 18:34:31'!
test17CanNotExecuteAnInvalidCommand
	
	| marsRover |

	marsRover  := MarsRover initializeIn: 0@0 andPointsTo: north.
	
	[ marsRover executeCommand: anInvalidCommand.
		self fail]
			on: Error 
			do: [ :anError | 	
				self assert: (marsRover isIn: 0@0 andPointsTo: north).
				self assert: anError messageText = Commands canNotExecuteAnInvalidCommand.
				]
	
	! !


!classDefinition: #CardinalDirections category: 'MarsRover-Ejercicio'!
Object subclass: #CardinalDirections
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!CardinalDirections methodsFor: 'movements' stamp: 'CZ 12/7/2020 18:20:40'!
doBackwardsMovement

 	self subclassResponsibility! !

!CardinalDirections methodsFor: 'movements' stamp: 'CZ 12/7/2020 18:20:44'!
doForwardMovement

 	self subclassResponsibility! !

!CardinalDirections methodsFor: 'movements' stamp: 'CZ 12/7/2020 18:20:53'!
doRotateLeftMovement

 	self subclassResponsibility! !

!CardinalDirections methodsFor: 'movements' stamp: 'CZ 12/7/2020 18:20:58'!
doRotateRightMovement

 	self subclassResponsibility! !


!CardinalDirections methodsFor: 'testing' stamp: 'CZ 12/7/2020 18:20:30'!
= aCardinalDirection

	^self isKindOf: aCardinalDirection class.! !


!classDefinition: #East category: 'MarsRover-Ejercicio'!
CardinalDirections subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!East methodsFor: 'movements' stamp: 'CZ 12/7/2020 18:22:13'!
doBackwardsMovement
 	
	^-1@0.! !

!East methodsFor: 'movements' stamp: 'CZ 12/7/2020 18:22:19'!
doForwardMovement
		
	^1@0.
	
	
	! !

!East methodsFor: 'movements' stamp: 'CZ 12/7/2020 18:21:20'!
doRotateLeftMovement
		
	^ North new.! !

!East methodsFor: 'movements' stamp: 'CZ 12/7/2020 18:21:29'!
doRotateRightMovement
		
	^ South new.! !


!classDefinition: #North category: 'MarsRover-Ejercicio'!
CardinalDirections subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!North methodsFor: 'movements' stamp: 'CZ 12/7/2020 18:21:42'!
doBackwardsMovement
	
	^0@-1.! !

!North methodsFor: 'movements' stamp: 'CZ 12/7/2020 18:21:51'!
doForwardMovement
	
	^0@1.! !

!North methodsFor: 'movements' stamp: 'CZ 12/7/2020 18:21:59'!
doRotateLeftMovement
	
	^ West new.! !

!North methodsFor: 'movements' stamp: 'CZ 12/7/2020 18:22:05'!
doRotateRightMovement
	
	^ East new.! !


!classDefinition: #South category: 'MarsRover-Ejercicio'!
CardinalDirections subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!South methodsFor: 'movements' stamp: 'CZ 12/7/2020 18:22:33'!
doBackwardsMovement
	
	^ 0@1.! !

!South methodsFor: 'movements' stamp: 'CZ 12/7/2020 18:22:41'!
doForwardMovement
	
	^ 0@-1.! !

!South methodsFor: 'movements' stamp: 'CZ 12/7/2020 18:22:49'!
doRotateLeftMovement
	
	^ East new.! !

!South methodsFor: 'movements' stamp: 'CZ 12/7/2020 18:22:54'!
doRotateRightMovement
	
	^ West new.! !


!classDefinition: #West category: 'MarsRover-Ejercicio'!
CardinalDirections subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!West methodsFor: 'movements' stamp: 'CZ 12/7/2020 18:23:04'!
doBackwardsMovement
	
	^1@0.! !

!West methodsFor: 'movements' stamp: 'CZ 12/7/2020 18:23:12'!
doForwardMovement
	
	^-1@0.! !

!West methodsFor: 'movements' stamp: 'CZ 12/7/2020 18:23:19'!
doRotateLeftMovement
	
	^ South new.! !

!West methodsFor: 'movements' stamp: 'CZ 12/7/2020 18:23:24'!
doRotateRightMovement
	
	^ North new.! !


!classDefinition: #MarsRover category: 'MarsRover-Ejercicio'!
Object subclass: #MarsRover
	instanceVariableNames: 'actualCoordenate actualCardinalDirection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!MarsRover methodsFor: 'testing' stamp: 'CZ 12/7/2020 18:38:29'!
isIn: aCoordenate andPointsTo: aCardinalDirection

	^(actualCoordenate = aCoordenate  and: actualCardinalDirection = aCardinalDirection).! !


!MarsRover methodsFor: 'initialization' stamp: 'CZ 12/7/2020 18:40:22'!
initializeIn: newCoordenate andPointsTo: newCardinalDirection

	actualCoordenate := newCoordenate .
	actualCardinalDirection := newCardinalDirection .! !


!MarsRover methodsFor: 'accessing' stamp: 'JT 12/7/2020 10:34:25'!
actualCardinalDirection
	
	^actualCardinalDirection! !

!MarsRover methodsFor: 'accessing' stamp: 'JT 12/7/2020 10:34:10'!
actualCoordenate
	
	^actualCoordenate! !


!MarsRover methodsFor: 'mars rover management' stamp: 'CZ 12/7/2020 18:39:45'!
executeCommand: aCommandToExecute
	
	| aCommand |
	
	aCommand := Commands getInstanceForCommand: aCommandToExecute.
	
	^ aCommand executeCommandFor: self.
	! !

!MarsRover methodsFor: 'mars rover management' stamp: 'JT 12/7/2020 11:02:05'!
modifyActualCardinalDirectionWith: newCardinalDirection
	
	actualCardinalDirection := newCardinalDirection ! !

!MarsRover methodsFor: 'mars rover management' stamp: 'JT 12/7/2020 11:01:37'!
modifyActualCoordenateWith: newCoordenate
	
	actualCoordenate := newCoordenate ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-Ejercicio'!
MarsRover class
	instanceVariableNames: 'actualCoordenate actualCardinalDirection'!

!MarsRover class methodsFor: 'accessing' stamp: 'CZ 12/7/2020 18:38:09'!
initializeIn: newCooordenate andPointsTo: newCardinalDirection

	^self new initializeIn: newCooordenate andPointsTo: newCardinalDirection ! !


!classDefinition: #Commands category: 'MarsRover-Ejercicio'!
MarsRover subclass: #Commands
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!Commands methodsFor: 'commands management' stamp: 'JT 12/7/2020 11:39:28'!
executeCommandFor: aMarsRover

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Commands class' category: 'MarsRover-Ejercicio'!
Commands class
	instanceVariableNames: ''!

!Commands class methodsFor: 'errors management' stamp: 'JT 12/7/2020 13:44:02'!
canNotExecuteAnInvalidCommand

	^'Cannot Execute An Invalid Command'! !

!Commands class methodsFor: 'errors management' stamp: 'CZ 12/7/2020 18:26:10'!
signalCanNotExecuteAnInvalidCommand

	self error: self canNotExecuteAnInvalidCommand.! !


!Commands class methodsFor: 'testing' stamp: 'CZ 12/7/2020 18:19:12'!
equals: commandIdentifierToCompare
	
	self subclassResponsibility.! !


!Commands class methodsFor: 'accessing' stamp: 'CZ 12/7/2020 18:27:25'!
getInstanceForCommand: commandToIdentify

	| identifiedCommand|
	
	identifiedCommand := self allSubclasses detect:
		[:aCommand | aCommand equals: commandToIdentify]
		ifNone: [^self signalCanNotExecuteAnInvalidCommand].
		
	^identifiedCommand new.! !


!classDefinition: #Backwards category: 'MarsRover-Ejercicio'!
Commands subclass: #Backwards
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!Backwards methodsFor: 'commands management' stamp: 'JT 12/7/2020 12:50:37'!
executeCommandFor: aMarsRover
	
	| tempCoordenate |
	
	tempCoordenate := aMarsRover actualCardinalDirection doBackwardsMovement.
	
	aMarsRover modifyActualCoordenateWith: tempCoordenate.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Backwards class' category: 'MarsRover-Ejercicio'!
Backwards class
	instanceVariableNames: ''!

!Backwards class methodsFor: 'testing' stamp: 'CZ 12/7/2020 18:19:24'!
equals: commandIdentifierToCompare
	
	^commandIdentifierToCompare = $b.! !


!classDefinition: #Forward category: 'MarsRover-Ejercicio'!
Commands subclass: #Forward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!Forward methodsFor: 'commands management' stamp: 'JT 12/7/2020 12:50:55'!
executeCommandFor: aMarsRover
	
	| tempCoordenate |
	
	tempCoordenate := aMarsRover actualCardinalDirection doForwardMovement.
	
	aMarsRover modifyActualCoordenateWith: tempCoordenate.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Forward class' category: 'MarsRover-Ejercicio'!
Forward class
	instanceVariableNames: ''!

!Forward class methodsFor: 'testing' stamp: 'CZ 12/7/2020 18:19:33'!
equals: commandIdentifierToCompare
	
	^commandIdentifierToCompare = $f.! !


!classDefinition: #RotateLeft category: 'MarsRover-Ejercicio'!
Commands subclass: #RotateLeft
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!RotateLeft methodsFor: 'commands management' stamp: 'JT 12/7/2020 12:51:09'!
executeCommandFor: aMarsRover
	
	| tempCardinalDirection |
	
	tempCardinalDirection := aMarsRover actualCardinalDirection doRotateLeftMovement.
	
	aMarsRover modifyActualCardinalDirectionWith: tempCardinalDirection.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotateLeft class' category: 'MarsRover-Ejercicio'!
RotateLeft class
	instanceVariableNames: ''!

!RotateLeft class methodsFor: 'testing' stamp: 'CZ 12/7/2020 18:19:42'!
equals: commandIdentifierToCompare
	
	^commandIdentifierToCompare = $l.! !


!classDefinition: #RotateRight category: 'MarsRover-Ejercicio'!
Commands subclass: #RotateRight
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!RotateRight methodsFor: 'commands management' stamp: 'JT 12/7/2020 12:51:46'!
executeCommandFor: aMarsRover

	| tempCardinalDirection |
	
	tempCardinalDirection := aMarsRover actualCardinalDirection doRotateRightMovement.
	
	aMarsRover modifyActualCardinalDirectionWith: tempCardinalDirection.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotateRight class' category: 'MarsRover-Ejercicio'!
RotateRight class
	instanceVariableNames: ''!

!RotateRight class methodsFor: 'testing' stamp: 'CZ 12/7/2020 18:19:53'!
equals: commandIdentifierToCompare
	
	^commandIdentifierToCompare = $r.! !
