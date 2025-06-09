!classDefinition: #MapTest category: #'Parcial 2022 1c'!
TestCase subclass: #MapTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial 2022 1c'!

!MapTest methodsFor: 'as yet unclassified' stamp: 'v 6/9/2025 00:35:53'!
test01PlayersStartAtTheGivenStartingPosition
	|game|
	
	game := SlicersGame withPlayers: #('Player1', 'Player2')
					withFloors: #((2@2) (2@2))
					startingAtFloor: 1 inPosition: 1@1 
					endingAtFloor: 2 inPosition: 2@2 withDice: Dice new.
					
	self assert: (game playerNumber: 1 IsInPosition: 1@1 inFloorNumber: 1).
	self assert: (game playerNumber: 2 IsInPosition: 1@1 inFloorNumber: 1).
	
	
	
	
	! !

!MapTest methodsFor: 'as yet unclassified' stamp: 'v 6/9/2025 00:35:53'!
test02PlayersDontStartAtAnotherPositionThatIsNotTheGivenStartingPosition
	|game|
	
	game := SlicersGame withPlayers: #('Player1', 'Player2')
					withFloors: #((2@2) (2@2))
					startingAtFloor: 1 inPosition: 1@1 
					endingAtFloor: 2 inPosition: 2@2 withDice: Dice new.
					
	self deny: (game playerNumber: 1 IsInPosition: 1@1 inFloorNumber: 2).
	self deny: (game playerNumber: 2 IsInPosition: 1@1 inFloorNumber: 2).
	
	
	
	
	! !

!MapTest methodsFor: 'as yet unclassified' stamp: 'v 6/9/2025 00:55:31'!
test03PlayersAreAbleToMoveAroundTheMap
	|game|
	
	game := SlicersGame withPlayers: #('Player1', 'Player2')
					withFloors: #((3@3) (3@3))
					startingAtFloor: 1 inPosition: 1@1 
					endingAtFloor: 2 inPosition: 2@2 
					withDice: Dice new.
					
	game playRound.
	self assert: (game playerNumber: 1 IsInPosition: 2@2 inFloorNumber: 1).
	self assert: (game playerNumber: 2 IsInPosition: 2@2 inFloorNumber: 1).

	
					
	
	
	
	
	
	! !


!classDefinition: #Dice category: #'Parcial 2022 1c'!
Object subclass: #Dice
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial 2022 1c'!

!Dice methodsFor: 'as yet unclassified' stamp: 'v 6/9/2025 00:49:55'!
roll
	
	^7! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Dice class' category: #'Parcial 2022 1c'!
Dice class
	instanceVariableNames: ''!

!Dice class methodsFor: 'as yet unclassified' stamp: 'v 6/9/2025 00:40:28'!
roll
	
	^7! !


!classDefinition: #Player category: #'Parcial 2022 1c'!
Object subclass: #Player
	instanceVariableNames: 'name actualPosition floorNumber'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial 2022 1c'!

!Player methodsFor: 'instance creation' stamp: 'v 6/8/2025 23:50:46'!
initializeNamed: aName startingAtPosition: aStartingPosition inFloorNumber: aFloorNumber 
	
	name := aName.
	actualPosition := aStartingPosition.
	floorNumber := aFloorNumber.! !


!Player methodsFor: 'assertion' stamp: 'v 6/8/2025 23:54:22'!
isInPosition: aPosition inFloorNumber: aFloor 
	
	^actualPosition = aPosition and: floorNumber = aFloor.! !


!Player methodsFor: 'action' stamp: 'v 6/9/2025 01:00:28'!
throwsDice: dice
	
	actualPosition :=actualPosition + ((dice roll - 6)@(dice roll -6))
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Player class' category: #'Parcial 2022 1c'!
Player class
	instanceVariableNames: ''!

!Player class methodsFor: 'instance creation' stamp: 'v 6/8/2025 23:50:11'!
named: aName startingAtPosition: aStartingPosition inFloorNumber: aFloorNumber 
	
	^self new initializeNamed: aName startingAtPosition: aStartingPosition inFloorNumber: aFloorNumber ! !


!classDefinition: #SlicersGame category: #'Parcial 2022 1c'!
Object subclass: #SlicersGame
	instanceVariableNames: 'listOfPlayers listOfFloors startingFloor startingPosition endingFloor endingPosition dice'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial 2022 1c'!

!SlicersGame methodsFor: 'instance creation' stamp: 'v 6/8/2025 23:52:57'!
createPlayersWithNames: aListOfPlayers startingAtPosition: aStartingPosition InFloorNumber: aFloorNumber
	|players|
	players := OrderedCollection new.
	aListOfPlayers do: [:name | players add: (Player named: name startingAtPosition: aStartingPosition inFloorNumber: aFloorNumber) ].
	^players ! !

!SlicersGame methodsFor: 'instance creation' stamp: 'v 6/9/2025 00:49:35'!
initializeWithPlayers: aListOfPlayers withFloors: aListOfFloors startingAtFloor: aStartingFloor inPosition: aStartingPosition endingAtFloor: anEndingFloor inPosition: anEndingPosition withDice: aDice  
	
	listOfPlayers := self createPlayersWithNames: aListOfPlayers  startingAtPosition: aStartingPosition InFloorNumber: aStartingFloor .
	listOfFloors := aListOfFloors.
	startingFloor := aStartingFloor.
	startingPosition := aStartingPosition.
	endingFloor := anEndingFloor.
	endingPosition := anEndingPosition.
	dice := aDice ! !


!SlicersGame methodsFor: 'asserting' stamp: 'v 6/8/2025 23:51:22'!
at: aPlayer isInPosition: aPosition inFloorNumber: aFloor 
	self shouldBeImplemented.! !

!SlicersGame methodsFor: 'asserting' stamp: 'v 6/8/2025 23:51:53'!
playerNumber: aPlayer IsInPosition: aPosition inFloorNumber: aFloor 
	
	^(listOfPlayers at: aPlayer) isInPosition: aPosition inFloorNumber: aFloor.
	
	! !


!SlicersGame methodsFor: 'action' stamp: 'v 6/9/2025 00:49:04'!
playRound
	
	listOfPlayers do: [:player | player throwsDice: dice].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SlicersGame class' category: #'Parcial 2022 1c'!
SlicersGame class
	instanceVariableNames: ''!

!SlicersGame class methodsFor: 'instance creation' stamp: 'v 6/9/2025 00:39:23'!
withPlayers: aListOfPlayers withFloors: aListOfFloors startingAtFloor: aStartingFloor inPosition: aStartingPosition endingAtFloor: anEndingFloor inPosition: anEndingPosition withDice: aDice  

	
	^self new initializeWithPlayers: aListOfPlayers withFloors: aListOfFloors startingAtFloor: aStartingFloor inPosition: aStartingPosition endingAtFloor: anEndingFloor inPosition: anEndingPosition withDice: aDice ! !
