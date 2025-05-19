!classDefinition: #TestMarsRover category: #MarsRover!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'v 5/19/2025 00:21:32'!
test01MarsRoberDoesntMoveGivenAnEmptyString
	|robot|
	robot := MarsRober initializeWithPosition: 0@0 andCoordenate: North .
	robot executeComands: ''.
	self assert: robot position equals: 0@0
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'v 5/19/2025 00:21:41'!
test02MarsRoberMovesOnePositionIfComandIsFoward
	|robot|
	robot := MarsRober initializeWithPosition: 0@0 andCoordenate: North.
	robot executeComands: 'f'.
	self assert: robot position equals: 0@1
	
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'v 5/19/2025 00:21:47'!
test03MarsRoberMovesTwoPositionsIfAllComandsAreForward
	|robot|
	robot := MarsRober initializeWithPosition: 0@0 andCoordenate: North .
	robot executeComands: 'ff'.
	self assert: robot position equals: 0@2
	
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'v 5/19/2025 00:21:55'!
test04MarsRoberMovesBackwardsGivenBackwardsCommand
	|robot|
	robot := MarsRober initializeWithPosition: 1@0 andCoordenate: East.
	robot executeComands: 'b'.
	self assert: robot position equals: 0@0
	
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'v 5/19/2025 00:22:03'!
test05MarsRoberMovesTwiceBackwardsGivenBackwardsCommands
	|robot|
	robot := MarsRober initializeWithPosition: 0@2 andCoordenate: North .
	robot executeComands: 'bb'.
	self assert: robot position equals: 0@0
	
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'v 5/19/2025 00:23:41'!
test06MarsRoberRotatesToRightLookingEastChangesToSouth
	|robot|
	robot := MarsRober initializeWithPosition: 0@0 andCoordenate: East.
	robot executeComands: 'r'.
	self assert: robot coordenate equals: South
	
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'v 5/19/2025 00:23:47'!
test07MarsRoberRotatesToRightMultipleTimesCorrrectly
	|robot|
	robot := MarsRober initializeWithPosition: 0@0 andCoordenate: East.
	robot executeComands: 'rr'.
	self assert: robot coordenate equals: West
	
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'v 5/19/2025 00:23:53'!
test08MarsRoberRotatesToLeftLookingEastChangesToNorth
	|robot|
	robot := MarsRober initializeWithPosition: 0@0 andCoordenate: East.
	robot executeComands: 'l'.
	self assert: robot coordenate equals: North
	
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'v 5/19/2025 00:22:40'!
test09MarsRoberRotatesToLeftMultipleTimesCorrrectly
	|robot|
	robot := MarsRober initializeWithPosition: 0@0 andCoordenate: East.
	robot executeComands: 'll'.
	self assert: robot coordenate equals: West
	
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'v 5/19/2025 00:22:51'!
test10MarsRoberMovesForwardAndBackwardsSoPositionDoesntChange
	|robot|
	robot := MarsRober initializeWithPosition: 0@0 andCoordenate: East.
	robot executeComands: 'fb'.
	self assert: robot position equals: 0@0.
	self assert: robot coordenate equals: East
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'v 5/19/2025 00:23:00'!
test11MarsRoberRotatesRightAndMovesForward
	|robot|
	robot := MarsRober initializeWithPosition: 2@2 andCoordenate: East.
	robot executeComands: 'rf'.
	self assert: robot position equals: 2@1.
	self assert: robot coordenate equals: South
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'v 5/19/2025 00:23:21'!
test12MarsRoberRotatesRightAndMovesBackward
	|robot|
	robot := MarsRober initializeWithPosition: 2@2 andCoordenate: East.
	robot executeComands: 'rb'.
	self assert: robot position equals: 2@3.
	self assert: robot coordenate equals: South
	! !


!classDefinition: #CardinalPoint category: #MarsRover!
Object subclass: #CardinalPoint
	instanceVariableNames: 'marsRober'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!CardinalPoint methodsFor: 'as yet unclassified' stamp: 'v 5/19/2025 00:05:55'!
initializeWith: aMarsRober 
	
	marsRober := aMarsRober ! !

!CardinalPoint methodsFor: 'as yet unclassified' stamp: 'v 5/19/2025 00:29:27'!
moveBackward

	self subclassResponsibility! !

!CardinalPoint methodsFor: 'as yet unclassified' stamp: 'v 5/19/2025 00:03:54'!
moveForward

	self subclassResponsibility! !

!CardinalPoint methodsFor: 'as yet unclassified' stamp: 'v 5/19/2025 00:46:30'!
turnLeft

	self subclassResponsibility! !

!CardinalPoint methodsFor: 'as yet unclassified' stamp: 'v 5/19/2025 00:35:46'!
turnRight

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CardinalPoint class' category: #MarsRover!
CardinalPoint class
	instanceVariableNames: ''!

!CardinalPoint class methodsFor: 'as yet unclassified' stamp: 'v 5/19/2025 00:21:09'!
initializeWith: aMarsRober
	
	self subclassResponsibility ! !


!classDefinition: #East category: #MarsRover!
CardinalPoint subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!East methodsFor: 'as yet unclassified' stamp: 'v 5/19/2025 00:30:10'!
moveBackward

	marsRober moveBackwardsLookingEast ! !

!East methodsFor: 'as yet unclassified' stamp: 'v 5/19/2025 00:07:21'!
moveForward
	
	marsRober moveForwardLookingEast ! !

!East methodsFor: 'as yet unclassified' stamp: 'v 5/19/2025 00:46:49'!
turnLeft

	marsRober pointToNorth ! !

!East methodsFor: 'as yet unclassified' stamp: 'v 5/19/2025 00:44:05'!
turnRight
	
	marsRober pointToSouth ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'East class' category: #MarsRover!
East class
	instanceVariableNames: ''!

!East class methodsFor: 'as yet unclassified' stamp: 'v 5/19/2025 00:19:16'!
initializeWith: aMarsRober 
	
	^East new initializeWith: aMarsRober ! !


!classDefinition: #North category: #MarsRover!
CardinalPoint subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!North methodsFor: 'as yet unclassified' stamp: 'v 5/19/2025 00:30:03'!
moveBackward

	marsRober moveBackwardsLookingNorth ! !

!North methodsFor: 'as yet unclassified' stamp: 'v 5/19/2025 00:07:35'!
moveForward
	
		marsRober moveForwardLookingNorth ! !

!North methodsFor: 'as yet unclassified' stamp: 'v 5/19/2025 00:47:02'!
turnLeft

	marsRober pointToWest ! !

!North methodsFor: 'as yet unclassified' stamp: 'v 5/19/2025 00:44:43'!
turnRight
	
	marsRober pointToEast! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'North class' category: #MarsRover!
North class
	instanceVariableNames: ''!

!North class methodsFor: 'as yet unclassified' stamp: 'v 5/19/2025 00:19:54'!
initializeWith: aMarsRober 
	
	^North new initializeWith: aMarsRober ! !


!classDefinition: #South category: #MarsRover!
CardinalPoint subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!South methodsFor: 'as yet unclassified' stamp: 'v 5/19/2025 00:29:52'!
moveBackward

	marsRober moveBackwardsLookingSouth ! !

!South methodsFor: 'as yet unclassified' stamp: 'v 5/19/2025 00:07:45'!
moveForward
	
		marsRober moveForwardLookingSouth ! !

!South methodsFor: 'as yet unclassified' stamp: 'v 5/19/2025 00:47:14'!
turnLeft

	marsRober pointToEast ! !

!South methodsFor: 'as yet unclassified' stamp: 'v 5/19/2025 00:44:26'!
turnRight
	
	marsRober pointToWest! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'South class' category: #MarsRover!
South class
	instanceVariableNames: ''!

!South class methodsFor: 'as yet unclassified' stamp: 'v 5/19/2025 00:20:03'!
initializeWith: aMarsRober 
	
	^South new initializeWith: aMarsRober ! !


!classDefinition: #West category: #MarsRover!
CardinalPoint subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!West methodsFor: 'as yet unclassified' stamp: 'v 5/19/2025 00:29:44'!
moveBackward

	marsRober moveBackwardsLookingWest ! !

!West methodsFor: 'as yet unclassified' stamp: 'v 5/19/2025 00:07:55'!
moveForward
	
		marsRober moveForwardLookingWest! !

!West methodsFor: 'as yet unclassified' stamp: 'v 5/19/2025 00:47:24'!
turnLeft

	marsRober pointToSouth ! !

!West methodsFor: 'as yet unclassified' stamp: 'v 5/19/2025 00:44:18'!
turnRight
	
	marsRober pointToNorth ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'West class' category: #MarsRover!
West class
	instanceVariableNames: ''!

!West class methodsFor: 'as yet unclassified' stamp: 'v 5/19/2025 00:20:11'!
initializeWith: aMarsRober 
	
	^West new initializeWith: aMarsRober ! !


!classDefinition: #MarsRober category: #MarsRover!
Object subclass: #MarsRober
	instanceVariableNames: 'position renameMe1 initialPosition cardinalPoint'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRober methodsFor: 'initialize' stamp: 'v 5/19/2025 00:53:43'!
initializeInitializeWithPosition: aPosition andCoordenate: aCoordenate 
	
	position := aPosition.
	cardinalPoint := aCoordenate initializeWith: self.! !


!MarsRober methodsFor: 'accessing' stamp: 'v 5/19/2025 00:53:43'!
coordenate
	
	^cardinalPoint class! !

!MarsRober methodsFor: 'accessing' stamp: 'v 5/16/2025 20:40:58'!
position

	^position! !


!MarsRober methodsFor: 'actions' stamp: 'v 5/19/2025 00:48:19'!
executeComands: aSequenceOfComands 
	
	 aSequenceOfComands  do: [ :command | 
		
		(command = $f) ifTrue:  [ self moveForward].
		(command = $b) ifTrue: [ 					self moveBackward	].
		(command = $r) ifTrue:  [ self turnRight].
		(command = $l) ifTrue:  [ self turnLeft].
		
												].
	! !

!MarsRober methodsFor: 'actions' stamp: 'v 5/19/2025 00:53:43'!
moveBackward

	cardinalPoint moveBackward! !

!MarsRober methodsFor: 'actions' stamp: 'v 5/19/2025 00:56:07'!
moveBackwardsLookingEast

	 position:= position - (1@0)! !

!MarsRober methodsFor: 'actions' stamp: 'v 5/19/2025 00:55:50'!
moveBackwardsLookingNorth

	position:= position - (0@1)! !

!MarsRober methodsFor: 'actions' stamp: 'v 5/19/2025 00:55:45'!
moveBackwardsLookingSouth

	position:= position + (0@1)! !

!MarsRober methodsFor: 'actions' stamp: 'v 5/19/2025 00:55:41'!
moveBackwardsLookingWest

	position:= position + (1@0)! !

!MarsRober methodsFor: 'actions' stamp: 'v 5/19/2025 00:53:43'!
moveForward

	cardinalPoint moveForward! !

!MarsRober methodsFor: 'actions' stamp: 'v 5/19/2025 00:55:36'!
moveForwardLookingEast

	position:= position + (1@0)! !

!MarsRober methodsFor: 'actions' stamp: 'v 5/19/2025 00:55:32'!
moveForwardLookingNorth

	position:= position + (0@1)! !

!MarsRober methodsFor: 'actions' stamp: 'v 5/19/2025 00:55:28'!
moveForwardLookingSouth

	 position:= position - (0@1)! !

!MarsRober methodsFor: 'actions' stamp: 'v 5/19/2025 00:55:20'!
moveForwardLookingWest

	 position:= position - (1@0)! !

!MarsRober methodsFor: 'actions' stamp: 'v 5/19/2025 00:57:08'!
pointToEast

	cardinalPoint  := East initializeWith: self! !

!MarsRober methodsFor: 'actions' stamp: 'v 5/19/2025 00:56:59'!
pointToNorth

	 cardinalPoint  := North initializeWith: self! !

!MarsRober methodsFor: 'actions' stamp: 'v 5/19/2025 00:56:55'!
pointToSouth

	cardinalPoint  := South  initializeWith: self! !

!MarsRober methodsFor: 'actions' stamp: 'v 5/19/2025 00:57:03'!
pointToWest

	 cardinalPoint  := West initializeWith: self! !

!MarsRober methodsFor: 'actions' stamp: 'v 5/19/2025 00:53:43'!
turnLeft
	
	cardinalPoint turnLeft 
	! !

!MarsRober methodsFor: 'actions' stamp: 'v 5/19/2025 00:53:43'!
turnRight
	
	cardinalPoint turnRight ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRober class' category: #MarsRover!
MarsRober class
	instanceVariableNames: ''!

!MarsRober class methodsFor: 'instance creation' stamp: 'v 5/16/2025 20:44:55'!
initializeWithPosition: aPosition andCoordenate: aCoordenate 
	
	^self new initializeInitializeWithPosition: aPosition andCoordenate: aCoordenate ! !
