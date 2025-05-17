!classDefinition: #TestMarsRover category: #MarsRover!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'v 5/16/2025 21:07:11'!
test01MarsRoberDoesntMoveGivenAnEmptyString
	|robot|
	robot := MarsRober initializeWithPosition: 0@0.
	robot executeComands: ''.
	self assert: robot position equals: 0@0
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'v 5/16/2025 21:06:44'!
test02MarsRoberMovesOnePositionIfComandIsFoward
	|robot|
	robot := MarsRober initializeWithPosition: 0@0.
	robot executeComands: 'r'.
	self assert: robot position equals: 0@1
	
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'v 5/16/2025 21:18:14'!
test03MarsRoberMovesTwoPositionsIfAllComandsAreForward
	|robot|
	robot := MarsRober initializeWithPosition: 0@0.
	robot executeComands: 'rr'.
	self assert: robot position equals: 0@2
	
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'v 5/16/2025 21:27:08'!
test04MarsRoberMovesBackwardsGivenBackwardsCommand
	|robot|
	robot := MarsRober initializeWithPosition: 0@1.
	robot executeComands: 'b'.
	self assert: robot position equals: 0@0
	
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'v 5/16/2025 21:27:55'!
test05MarsRoberMovesTwiceBackwardsGivenBackwardsCommands
	|robot|
	robot := MarsRober initializeWithPosition: 0@2.
	robot executeComands: 'bb'.
	self assert: robot position equals: 0@0
	
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'v 5/16/2025 21:34:45'!
test06MarsRoberMovesRightGivenRightCommand
	|robot|
	robot := MarsRober initializeWithPosition: 0@2.
	robot executeComands: 'r'.
	self assert: robot position equals: 0@0
	
	! !


!classDefinition: #MarsRober category: #MarsRover!
Object subclass: #MarsRober
	instanceVariableNames: 'position renameMe1 initialPosition coordenate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRober methodsFor: 'initialize' stamp: 'v 5/16/2025 20:40:46'!
initializeInitializeWithPosition: aInitialPosition 
	
	position := aInitialPosition.! !

!MarsRober methodsFor: 'initialize' stamp: 'v 5/16/2025 20:45:29'!
initializeInitializeWithPosition: aPosition andCoordenate: aCoordenate 
	
	position := aPosition.
	coordenate := aCoordenate.! !

!MarsRober methodsFor: 'initialize' stamp: 'v 5/16/2025 20:37:33'!
initializeWithPosition: aRenameMe1 
	self shouldBeImplemented.
	renameMe1 := aRenameMe1.! !


!MarsRober methodsFor: 'accessing' stamp: 'v 5/16/2025 20:45:44'!
coordenate
	
	^coordenate! !

!MarsRober methodsFor: 'accessing' stamp: 'v 5/16/2025 20:40:58'!
position

	^position! !


!MarsRober methodsFor: 'actions' stamp: 'v 5/16/2025 21:29:37'!
executeComands: aSequenceOfComands 
	
	aSequenceOfComands ifEmpty: [^self].
	 aSequenceOfComands size timesRepeat: [ 
		
		(aSequenceOfComands first = $r) ifTrue:[  position:= position + (0@1)].
		(aSequenceOfComands first = $b) ifTrue:[ 									 position:= position - (0@1)	].
												].
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRober class' category: #MarsRover!
MarsRober class
	instanceVariableNames: ''!

!MarsRober class methodsFor: 'instance creation' stamp: 'v 5/16/2025 20:38:52'!
initializeWithPosition: aInitialPosition 
	
	
	^self new initializeInitializeWithPosition: aInitialPosition ! !

!MarsRober class methodsFor: 'instance creation' stamp: 'v 5/16/2025 20:44:55'!
initializeWithPosition: aPosition andCoordenate: aCoordenate 
	
	^self new initializeInitializeWithPosition: aPosition andCoordenate: aCoordenate ! !
