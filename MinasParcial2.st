!classDefinition: #Board category: #MinasParcial!
Object subclass: #Board
	instanceVariableNames: 'boardSize positions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MinasParcial'!

!Board methodsFor: 'initilizing' stamp: 'v 7/6/2025 19:21:20'!
initializeWithSize: aBoardSize withPositionValues: valuesForPositions 
	
	boardSize := aBoardSize.
	positions := valuesForPositions.! !


!Board methodsFor: 'checking' stamp: 'v 7/6/2025 20:57:24'!
at: aPosition
	
	(positions includesKey: aPosition) ifTrue: [^positions at: aPosition ].
	! !

!Board methodsFor: 'checking' stamp: 'v 7/6/2025 19:23:16'!
hasValidSize
	
	^boardSize >= (2@2)! !

!Board methodsFor: 'checking' stamp: 'v 7/6/2025 23:28:16'!
isInsideBoard: aPosition
	
	^aPosition between: 1@1 and: boardSize ! !

!Board methodsFor: 'checking' stamp: 'v 7/6/2025 20:05:04'!
validPlayerStartingPosition: aStartingPlayerPosition
	
	^boardSize y = (aStartingPlayerPosition y) and: (aStartingPlayerPosition x <= (boardSize x)).
	! !


!Board methodsFor: 'asserting' stamp: 'v 7/6/2025 20:14:30'!
playerPositionIs: aRenameMe1 
	self shouldBeImplemented.! !

!Board methodsFor: 'asserting' stamp: 'v 7/6/2025 19:28:36'!
positionIsEmptyAt: aPosition
	
	^true 
	! !


!Board methodsFor: 'action' stamp: 'v 7/6/2025 21:05:08'!
removePosition: aPosition 
	
	(positions includesKey: aPosition) ifTrue: [positions removeKey: aPosition ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Board class' category: #MinasParcial!
Board class
	instanceVariableNames: ''!

!Board class methodsFor: 'instance creation' stamp: 'v 7/6/2025 19:20:45'!
withSize: aBoardSize withPositionValues: valuesForPositions 
	
	^self new initializeWithSize: aBoardSize withPositionValues: valuesForPositions ! !


!classDefinition: #BoardPosition category: #MinasParcial!
Object subclass: #BoardPosition
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MinasParcial'!


!classDefinition: #HardMine category: #MinasParcial!
BoardPosition subclass: #HardMine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MinasParcial'!


!classDefinition: #SoftArmour category: #MinasParcial!
BoardPosition subclass: #SoftArmour
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MinasParcial'!


!classDefinition: #SoftMine category: #MinasParcial!
BoardPosition subclass: #SoftMine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MinasParcial'!


!classDefinition: #MinesGame category: #MinasParcial!
Object subclass: #MinesGame
	instanceVariableNames: 'board playerPosition playerLifes playerArmour'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MinasParcial'!

!MinesGame methodsFor: 'initializing' stamp: 'v 7/7/2025 00:05:01'!
initializeWithBoardSize: aBoardSize playerStartingAt: aStartingPlayerPosition withLifes: initialLifes  
	
	board := aBoardSize.
	playerPosition := aStartingPlayerPosition.
	playerLifes := initialLifes.
	playerArmour := NoArmour new ! !


!MinesGame methodsFor: 'actions' stamp: 'v 7/6/2025 23:01:17'!
playerMovesDown
	
	self playerMovesTo: playerPosition + (0@1).
	! !

!MinesGame methodsFor: 'actions' stamp: 'v 7/6/2025 23:01:00'!
playerMovesLeft
	
	self playerMovesTo: playerPosition - (1@0).
! !

!MinesGame methodsFor: 'actions' stamp: 'v 7/6/2025 23:00:47'!
playerMovesRight
		
	self playerMovesTo: playerPosition + (1@0).

	! !

!MinesGame methodsFor: 'actions' stamp: 'v 7/6/2025 23:00:25'!
playerMovesUp

	self playerMovesTo: playerPosition - (0@1).

! !


!MinesGame methodsFor: 'asserting' stamp: 'v 7/6/2025 20:46:21'!
playerLeftLifes: possibleAmountOfLifes
	
	^playerLifes = possibleAmountOfLifes 
	
	! !

!MinesGame methodsFor: 'asserting' stamp: 'v 7/7/2025 00:04:43'!
playerMovesTo: aPosition
	
	(board isInsideBoard: aPosition) ifTrue:[
		
	playerPosition := aPosition.
	
	((board at: aPosition) isKindOf: SoftMine) ifTrue: [ (playerArmour isKindOf: NoArmour ) ifTrue: [playerLifes := playerLifes -1. ]ifFalse: [playerArmour := NoArmour new].board removePosition: aPosition].
	((board at: aPosition) isKindOf: HardMine )ifTrue: [playerLifes := playerLifes -2. 
											self playerMovesTo: playerPosition - ((Random new nextInteger: 1) @ (Random new       nextInteger: 1)).board  removePosition: aPosition].
										
	((board at: aPosition) isKindOf: SoftArmour) ifTrue: [playerArmour := SoftArmour new. board removePosition: aPosition].									
	].! !

!MinesGame methodsFor: 'asserting' stamp: 'v 7/6/2025 20:15:43'!
playerPositionIs: aPossiblePlayerPosition 
	
	^playerPosition = aPossiblePlayerPosition ! !


!MinesGame methodsFor: 'accessing' stamp: 'v 7/6/2025 23:05:33'!
playerPosition
	
	^playerPosition! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MinesGame class' category: #MinasParcial!
MinesGame class
	instanceVariableNames: ''!

!MinesGame class methodsFor: 'Error' stamp: 'v 7/6/2025 18:59:29'!
invalidBoardError
	
	^'invalid board'! !

!MinesGame class methodsFor: 'Error' stamp: 'v 7/6/2025 19:10:18'!
playerInvalidStartingPosition

	^'Invalid starting position'! !

!MinesGame class methodsFor: 'Error' stamp: 'v 7/6/2025 19:34:58'!
validatePlayerStartingPosition
	self shouldBeImplemented.! !


!MinesGame class methodsFor: 'instance creation' stamp: 'v 7/6/2025 19:22:17'!
validateBoard: aBoard

	^ (aBoard hasValidSize) ifFalse: [Error new signal: self invalidBoardError ]! !

!MinesGame class methodsFor: 'instance creation' stamp: 'v 7/6/2025 20:36:54'!
withBoard: aBoard playerStartingAt: aStartingPlayerPosition withLifes: lifes  
	
	 self validateBoard: aBoard.
	 self validate: aStartingPlayerPosition in: aBoard.
	
	^self new initializeWithBoardSize: aBoard playerStartingAt: aStartingPlayerPosition withLifes: lifes ! !


!MinesGame class methodsFor: 'checking' stamp: 'v 7/6/2025 20:05:04'!
validate: aStartingPlayerPosition in: aBoard 
	
	(aBoard validPlayerStartingPosition: aStartingPlayerPosition ) ifFalse: [Error new signal: self playerInvalidStartingPosition]! !


!classDefinition: #NoArmour category: #MinasParcial!
Object subclass: #NoArmour
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MinasParcial'!


!classDefinition: #MinasTests category: #MinasParcial!
TestCase subclass: #MinasTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MinasParcial'!

!MinasTests methodsFor: 'as yet unclassified' stamp: 'v 7/6/2025 20:24:56'!
test01BoardInitializeWithValidSize
	| board |
	
	board := Board withSize: 1@1 withPositionValues: Dictionary new.
	self  should: [MinesGame withBoard: board playerStartingAt: 1@1 withLifes: 3.] 
	raise: Error - MessageNotUnderstood  withMessageText: MinesGame invalidBoardError.
	! !

!MinasTests methodsFor: 'as yet unclassified' stamp: 'v 7/6/2025 20:24:56'!
test02PlayerShouldStartInTheBottomOfTheBoard
	| board |
	
	board := Board withSize: 4@4 withPositionValues: Dictionary new.
	self  should: [MinesGame withBoard: board playerStartingAt: 1@1 withLifes: 3.] 
	raise: Error - MessageNotUnderstood  withMessageText: MinesGame playerInvalidStartingPosition.
	! !

!MinasTests methodsFor: 'as yet unclassified' stamp: 'v 7/6/2025 20:24:56'!
test03PlayerCantStartOutsideTheBoard
	| board |
	
	board := Board withSize: 4@4 withPositionValues: Dictionary new.
	self  should: [MinesGame withBoard: board playerStartingAt: 10@4 withLifes: 3.] 
	raise: Error - MessageNotUnderstood  withMessageText: MinesGame playerInvalidStartingPosition.
	! !

!MinasTests methodsFor: 'as yet unclassified' stamp: 'v 7/6/2025 20:24:56'!
test04PlayerStartingPositionIsEmpty
	|board|
	board := Board withSize: 4@4 withPositionValues: Dictionary new.
	MinesGame withBoard: board playerStartingAt: 1@4 withLifes: 3.
	self assert: (board positionIsEmptyAt: 1@4).
	
	! !

!MinasTests methodsFor: 'as yet unclassified' stamp: 'v 7/6/2025 20:24:56'!
test05PlayerMovesLeftToEmptyPosition
	|board game|
	board := Board withSize: 4@4 withPositionValues: Dictionary new.
	game := MinesGame withBoard: board playerStartingAt: 2@4 withLifes: 3.
	game playerMovesLeft.
	self assert: (game playerPositionIs: 1@4).
	
	! !

!MinasTests methodsFor: 'as yet unclassified' stamp: 'v 7/6/2025 20:24:56'!
test06PlayerMovesRightUpAndDownToEmptyPositions
	|board game|
	board := Board withSize: 4@4 withPositionValues: Dictionary new.
	game := MinesGame withBoard: board playerStartingAt: 2@4 withLifes: 3.
	game playerMovesRight.
	self assert: (game playerPositionIs: 3@4).
	game playerMovesUp.
	self assert: (game playerPositionIs: 3@3).
	game playerMovesDown.
	self assert: (game playerPositionIs: 3@4).
	

	
	! !

!MinasTests methodsFor: 'as yet unclassified' stamp: 'v 7/7/2025 00:03:56'!
test07PlayerEncountersWith3livesEncountersASoftMineAndLosesOneLife
	|board game positions|
	positions := Dictionary new.
	positions at: 2@4 put: SoftMine new.
	board := Board withSize: 4@4 withPositionValues: positions.
	game := MinesGame withBoard: board playerStartingAt: 1@4 withLifes: 3.

	game playerMovesRight.
	
	

	
	! !

!MinasTests methodsFor: 'as yet unclassified' stamp: 'v 7/7/2025 00:03:52'!
test08PlayerEncountersWith3livesEncountersASoftMineAndLosesOneLife
	|board game positions|
	positions := Dictionary new.
	positions at: 2@4 put: SoftMine new.
	board := Board withSize: 4@4 withPositionValues: positions.
	game := MinesGame withBoard: board playerStartingAt: 1@4 withLifes: 3.
	self assert: (game playerLeftLifes: 3).
	game playerMovesRight.
	self assert: (game playerLeftLifes: 2).
	
	
	

	
	! !

!MinasTests methodsFor: 'as yet unclassified' stamp: 'v 7/7/2025 00:03:49'!
test09IfPlayerVisitSoftMineAfterExplotionItProducesNoDamage
	|board game positions|
	positions := Dictionary new.
	positions at: 2@4 put: SoftMine new.
	board := Board withSize: 4@4 withPositionValues: positions.
	game := MinesGame withBoard: board playerStartingAt: 1@4 withLifes: 3.
	self assert: (game playerLeftLifes: 3).
	game playerMovesRight.
	self assert: (game playerLeftLifes: 2).
	game playerMovesRight .
	game  playerMovesLeft.
	self assert: (game playerLeftLifes: 2).

	
	
	

	
	! !

!MinasTests methodsFor: 'as yet unclassified' stamp: 'v 7/7/2025 00:03:44'!
test10PlayerEncounterWitHardMineLosesTwoLifes
	|board game positions|
	positions := Dictionary new.
	positions at: 2@4 put: HardMine new.
	board := Board withSize: 4@4 withPositionValues: positions.
	game := MinesGame withBoard: board playerStartingAt: 1@4 withLifes: 3.
	game playerMovesRight.
	self assert: (game playerLeftLifes: 1).
	
	
	
	

	
	! !

!MinasTests methodsFor: 'as yet unclassified' stamp: 'v 7/7/2025 00:03:39'!
test11PlayerEncounterWitHardMineFliesThroughTheAirToEmptyPosition
	|board game positions|
	positions := Dictionary new.
	positions at: 2@9 put: HardMine new.
	board := Board withSize: 10@10 withPositionValues: positions.
	game := MinesGame withBoard: board playerStartingAt: 2@10 withLifes: 3.
	game playerMovesUp.
	self assert: (game playerPositionIs: (2@9 - ((Random new nextInteger: 1) @ (Random new nextInteger: 1)))).
	
	
	
	

	
	! !

!MinasTests methodsFor: 'as yet unclassified' stamp: 'v 7/7/2025 00:03:36'!
test12AfterFirstExplotionHardMineIsDesactivated
	|board game positions|
	positions := Dictionary new.
	positions at: 2@4 put: HardMine new.
	board := Board withSize: 4@4 withPositionValues: positions.
	game := MinesGame withBoard: board playerStartingAt: 1@4 withLifes: 3.
	game playerMovesRight.
	game playerMovesRight.
	game playerMovesLeft.
	self assert: (game playerLeftLifes: 1).
	
	
	
	

	
	! !

!MinasTests methodsFor: 'as yet unclassified' stamp: 'v 7/7/2025 00:03:30'!
test13PlayerEncounterWithHardMineFliesOutsideTheBoardStaysInPosition
	|board game positions|
	positions := Dictionary new.
	positions at: 1@4 put: HardMine new.
	board := Board withSize: 4@4 withPositionValues: positions.
	game := MinesGame withBoard: board playerStartingAt: 2@4 withLifes: 3.
	game playerMovesLeft.
	self assert: (game playerPositionIs: 1@4).
	
	
	
	

	
	! !

!MinasTests methodsFor: 'as yet unclassified' stamp: 'v 7/7/2025 00:03:26'!
test14PlayerWithSoftArmourGoesIntoASoftMineAndStaysWithSameLifes
	|board game positions|
	positions := Dictionary new.
	positions at: 1@4 put: SoftArmour new.
	positions at: 1@3 put: SoftMine new.

	board := Board withSize: 4@4 withPositionValues: positions.
	game := MinesGame withBoard: board playerStartingAt: 2@4 withLifes: 3.
	game playerMovesLeft.
	game playerMovesUp.
	self assert: (game playerLeftLifes: 3).
	
	
	
	

	
	! !

!MinasTests methodsFor: 'as yet unclassified' stamp: 'v 7/7/2025 00:03:19'!
test15PlayerWithSoftArmourGoesIntoASoftMineAndLosesArmour
	|board game positions|
	positions := Dictionary new.
	positions at: 1@4 put: SoftArmour new.
	positions at: 1@3 put: SoftMine new.
	positions at: 2@3 put: SoftMine new.
	

	board := Board withSize: 4@4 withPositionValues: positions.
	game := MinesGame withBoard: board playerStartingAt: 2@4 withLifes: 3.
	game playerMovesLeft.
	game playerMovesUp.
	game playerMovesRight .
	self assert: (game playerLeftLifes: 2).
	
	
	
	

	
	! !

!MinasTests methodsFor: 'as yet unclassified' stamp: 'v 7/7/2025 00:03:07'!
test16PlayerCantGrabSoftArmourTwice
	|board game positions|
	positions := Dictionary new.
	positions at: 1@4 put: SoftArmour new.
	positions at: 1@3 put: SoftMine new.
	positions at: 1@2 put: SoftMine new.

	

	board := Board withSize: 4@4 withPositionValues: positions.
	game := MinesGame withBoard: board playerStartingAt: 2@4 withLifes: 3.
	game playerMovesLeft.
	game playerMovesUp.
	self assert: (game playerLeftLifes: 3).

	game playerMovesDown.
	game playerMovesUp; playerMovesUp.
	self assert: (game playerLeftLifes: 2).
	
	
	
	

	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MinasTests class' category: #MinasParcial!
MinasTests class
	instanceVariableNames: ''!

!MinasTests class methodsFor: 'testing' stamp: 'v 7/6/2025 23:05:52'!
nextInteger
	
	^2! !
