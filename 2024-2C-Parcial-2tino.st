!classDefinition: #Board2 category: #'2024-2C-Parcial-2'!
Object subclass: #Board2
	instanceVariableNames: 'board boardExtent size'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!Board2 methodsFor: 'string representation' stamp: 'DV 7/1/2025 19:41:45'!
characterRepresentationOf: anElement
	
	(anElement = #smallPill) ifTrue: [ ^StringPacmanBoard smallPillCharacter ].
	(anElement = #bigPill) ifTrue: [ ^StringPacmanBoard bigPillCharacter ].
	(anElement = #blinky) ifTrue: [ ^StringPacmanBoard blinkyCharacter ].
	(anElement = #clyde) ifTrue: [ ^StringPacmanBoard clydeCharacter ].
	(anElement = #space) ifTrue: [ ^StringPacmanBoard spaceCharacter ].
	(anElement = #wall) ifTrue: [ ^StringPacmanBoard wallCharacter ].
	(anElement = #pacman) ifTrue: [ ^StringPacmanBoard pacmanCharacter ].
	
	self error: 'Unknown pacman element type'! !

!Board2 methodsFor: 'string representation' stamp: 'DV 7/1/2025 19:41:45'!
representationOfRowNumber: y
	
	^String streamContents: [ :rowStream |
		1 to: boardExtent x do: [ :x |
			rowStream nextPut: (self characterRepresentationOf: (board at: x@y))]]! !

!Board2 methodsFor: 'string representation' stamp: 'DV 7/1/2025 19:41:45'!
searchPacmanPosition
	
	^board keysAndValuesDo: [:position :value | ((board at: position) = #pacman) ifTrue: [^position]].
	
	! !

!Board2 methodsFor: 'string representation' stamp: 'DV 7/1/2025 19:41:45'!
stringRepresentationOfBoard
	
	| rows |
	
	rows := OrderedCollection new.

	1 to: boardExtent y do: [ :y | 
		rows add: (self representationOfRowNumber: y) ].
	
	^rows asArray! !


!Board2 methodsFor: 'string board visiting' stamp: 'DV 7/1/2025 19:42:27'!
size
	
	^size! !

!Board2 methodsFor: 'string board visiting' stamp: 'DV 7/1/2025 19:41:45'!
visitBigPillAt: aPosition 
	
	board at: aPosition put: #bigPill! !

!Board2 methodsFor: 'string board visiting' stamp: 'DV 7/1/2025 19:41:45'!
visitBlinkyAt: aPosition 
	
	board at: aPosition put: #blinky! !

!Board2 methodsFor: 'string board visiting' stamp: 'DV 7/1/2025 19:41:45'!
visitClydeAt: aPosition 
	
	board at: aPosition put: #clyde! !

!Board2 methodsFor: 'string board visiting' stamp: 'DV 7/1/2025 19:41:45'!
visitPacmanAt: aPosition 
	
	board at: aPosition put: #pacman! !

!Board2 methodsFor: 'string board visiting' stamp: 'DV 7/1/2025 19:41:45'!
visitSmallPillAt: aPosition 
	
	board at: aPosition put: #smallPill! !

!Board2 methodsFor: 'string board visiting' stamp: 'DV 7/1/2025 19:41:45'!
visitSpaceAt: aPosition

	board at: aPosition put: #space
	
	! !

!Board2 methodsFor: 'string board visiting' stamp: 'DV 7/1/2025 19:41:45'!
visitWallAt: aPosition 
	
	board at: aPosition put: #wall! !


!Board2 methodsFor: 'initialization' stamp: 'DV 7/1/2025 19:41:45'!
initializeOn: aBoard

	board := Dictionary new.
	boardExtent := aBoard extent.
	aBoard visitElementsWith: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Board2 class' category: #'2024-2C-Parcial-2'!
Board2 class
	instanceVariableNames: ''!

!Board2 class methodsFor: 'as yet unclassified' stamp: 'DV 7/1/2025 19:41:45'!
on: aBoard

	^self new initializeOn: aBoard! !


!classDefinition: #BoardTranslatorExample category: #'2024-2C-Parcial-2'!
Object subclass: #BoardTranslatorExample
	instanceVariableNames: 'board boardExtent'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!BoardTranslatorExample methodsFor: 'string representation' stamp: 'HAW 11/22/2024 14:38:51'!
characterRepresentationOf: anElement
	
	(anElement = #smallPill) ifTrue: [ ^StringPacmanBoard smallPillCharacter ].
	(anElement = #bigPill) ifTrue: [ ^StringPacmanBoard bigPillCharacter ].
	(anElement = #blinky) ifTrue: [ ^StringPacmanBoard blinkyCharacter ].
	(anElement = #clyde) ifTrue: [ ^StringPacmanBoard clydeCharacter ].
	(anElement = #space) ifTrue: [ ^StringPacmanBoard spaceCharacter ].
	(anElement = #wall) ifTrue: [ ^StringPacmanBoard wallCharacter ].
	(anElement = #pacman) ifTrue: [ ^StringPacmanBoard pacmanCharacter ].
	
	self error: 'Unknown pacman element type'! !

!BoardTranslatorExample methodsFor: 'string representation' stamp: 'HAW 11/22/2024 14:45:23'!
representationOfRowNumber: y
	
	^String streamContents: [ :rowStream |
		1 to: boardExtent x do: [ :x |
			rowStream nextPut: (self characterRepresentationOf: (board at: x@y))]]! !

!BoardTranslatorExample methodsFor: 'string representation' stamp: 'DV 7/1/2025 18:24:49'!
searchPacmanPosition
	
	^board keysAndValuesDo: [:position :value | ((board at: position) = #pacman) ifTrue: [^position]].
	
	! !

!BoardTranslatorExample methodsFor: 'string representation' stamp: 'LL 11/22/2024 10:44:29'!
stringRepresentationOfBoard
	
	| rows |
	
	rows := OrderedCollection new.

	1 to: boardExtent y do: [ :y | 
		rows add: (self representationOfRowNumber: y) ].
	
	^rows asArray! !


!BoardTranslatorExample methodsFor: 'string board visiting' stamp: 'LL 11/22/2024 11:42:38'!
visitBigPillAt: aPosition 
	
	board at: aPosition put: #bigPill! !

!BoardTranslatorExample methodsFor: 'string board visiting' stamp: 'LL 11/22/2024 11:40:34'!
visitBlinkyAt: aPosition 
	
	board at: aPosition put: #blinky! !

!BoardTranslatorExample methodsFor: 'string board visiting' stamp: 'LL 11/22/2024 11:43:04'!
visitClydeAt: aPosition 
	
	board at: aPosition put: #clyde! !

!BoardTranslatorExample methodsFor: 'string board visiting' stamp: 'DV 7/1/2025 17:29:10'!
visitPacmanAt: aPosition 
	
	board at: aPosition put: #pacman! !

!BoardTranslatorExample methodsFor: 'string board visiting' stamp: 'LL 11/22/2024 11:43:22'!
visitSmallPillAt: aPosition 
	
	board at: aPosition put: #smallPill! !

!BoardTranslatorExample methodsFor: 'string board visiting' stamp: 'LL 11/22/2024 11:43:30'!
visitSpaceAt: aPosition

	board at: aPosition put: #space
	
	! !

!BoardTranslatorExample methodsFor: 'string board visiting' stamp: 'LL 11/22/2024 11:43:35'!
visitWallAt: aPosition 
	
	board at: aPosition put: #wall! !


!BoardTranslatorExample methodsFor: 'initialization' stamp: 'HAW 11/22/2024 14:43:18'!
initializeOn: aBoard

	board := Dictionary new.
	boardExtent := aBoard extent.
	aBoard visitElementsWith: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BoardTranslatorExample class' category: #'2024-2C-Parcial-2'!
BoardTranslatorExample class
	instanceVariableNames: ''!

!BoardTranslatorExample class methodsFor: 'as yet unclassified' stamp: 'LL 11/22/2024 10:37:38'!
on: aBoard

	^self new initializeOn: aBoard! !


!classDefinition: #Game category: #'2024-2C-Parcial-2'!
Object subclass: #Game
	instanceVariableNames: 'board pacman size boardExtent'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!Game methodsFor: 'initialization' stamp: 'DV 7/1/2025 20:08:15'!
initializeIntializeWithBoard: aBoard 
	
	board := Dictionary new.
	boardExtent := aBoard extent.
	aBoard visitElementsWith: self.
	pacman := #Left.! !

!Game methodsFor: 'initialization' stamp: 'DV 7/1/2025 20:08:37'!
representationOfRowNumber: y
	
	^String streamContents: [ :rowStream |
		1 to: boardExtent x do: [ :x |
			rowStream nextPut: (self characterRepresentationOf: (board at: x@y))]]! !


!Game methodsFor: 'actions' stamp: 'DV 7/1/2025 20:09:16'!
characterRepresentationOf: anElement
	
	(anElement = #smallPill) ifTrue: [ ^StringPacmanBoard smallPillCharacter ].
	(anElement = #bigPill) ifTrue: [ ^StringPacmanBoard bigPillCharacter ].
	(anElement = #blinky) ifTrue: [ ^StringPacmanBoard blinkyCharacter ].
	(anElement = #clyde) ifTrue: [ ^StringPacmanBoard clydeCharacter ].
	(anElement = #space) ifTrue: [ ^StringPacmanBoard spaceCharacter ].
	(anElement = #wall) ifTrue: [ ^StringPacmanBoard wallCharacter ].
	(anElement = #pacman) ifTrue: [ ^StringPacmanBoard pacmanCharacter ].
	
	self error: 'Unknown pacman element type'! !

!Game methodsFor: 'actions' stamp: 'DV 7/1/2025 20:24:52'!
movePacmanFrom: pacmanPosition basedOn: offset

	(((board at: pacmanPosition  +offset) !!= #wall)) ifTrue: [self visitPacmanAt: (pacmanPosition + offset).
														self visitSpaceAt: pacmanPosition]! !

!Game methodsFor: 'actions' stamp: 'DV 7/1/2025 18:44:40'!
pacmanMovesDown
	
	pacman := #Down! !

!Game methodsFor: 'actions' stamp: 'DV 7/1/2025 18:04:26'!
pacmanMovesRight
	
	pacman := #Right! !

!Game methodsFor: 'actions' stamp: 'DV 7/1/2025 18:37:19'!
pacmanMovesUp
	
	pacman := #Up! !

!Game methodsFor: 'actions' stamp: 'DV 7/1/2025 20:06:21'!
searchPacmanPosition

	^ board keysAndValuesDo: [:position :value | ((board at: position) = #pacman) ifTrue: [^position]].! !

!Game methodsFor: 'actions' stamp: 'DV 7/1/2025 18:03:19'!
start
	self tick! !

!Game methodsFor: 'actions' stamp: 'DV 7/1/2025 20:07:57'!
stringRepresentationOfBoard
	
	| rows |
	
	rows := OrderedCollection new.

	1 to: boardExtent y do: [ :y | 
		rows add: (self representationOfRowNumber: y) ].
	
	^rows asArray! !

!Game methodsFor: 'actions' stamp: 'DV 7/1/2025 20:23:56'!
tick
	|pacmanPosition |
	pacmanPosition := self searchPacmanPosition.
	pacman = #Left ifTrue:[self movePacmanFrom: pacmanPosition basedOn: ((-1)@0) ].
	pacman = #Right ifTrue: [self movePacmanFrom: pacmanPosition basedOn: (1@0) ].
	pacman = #Up ifTrue: [self movePacmanFrom: pacmanPosition basedOn: (0@(-1)) ].
	pacman = #Down ifTrue: [self movePacmanFrom: pacmanPosition basedOn: (0@1) ].

	
		! !

!Game methodsFor: 'actions' stamp: 'DV 7/1/2025 20:04:32'!
visitBigPillAt: aPosition 
	
	board at: aPosition put: #bigPill! !

!Game methodsFor: 'actions' stamp: 'DV 7/1/2025 20:04:40'!
visitBlinkyAt: aPosition 
	
	board at: aPosition put: #blinky! !

!Game methodsFor: 'actions' stamp: 'DV 7/1/2025 20:04:46'!
visitClydeAt: aPosition 
	
	board at: aPosition put: #clyde! !

!Game methodsFor: 'actions' stamp: 'DV 7/1/2025 20:03:11'!
visitPacmanAt: aPosition 
	
	board at: aPosition put: #pacman
		! !

!Game methodsFor: 'actions' stamp: 'DV 7/1/2025 20:04:54'!
visitSmallPillAt: aPosition 
	
	board at: aPosition put: #smallPill! !

!Game methodsFor: 'actions' stamp: 'DV 7/1/2025 20:03:33'!
visitSpaceAt: aPosition

	board at: aPosition put: #space
	
	! !

!Game methodsFor: 'actions' stamp: 'DV 7/1/2025 20:04:14'!
visitWallAt: aPosition 
	
	board at: aPosition put: #wall! !


!Game methodsFor: 'assertion' stamp: 'DV 7/1/2025 20:07:46'!
boardRepresentation
	
	^self stringRepresentationOfBoard 
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Game class' category: #'2024-2C-Parcial-2'!
Game class
	instanceVariableNames: ''!

!Game class methodsFor: 'instance creation' stamp: 'DV 7/1/2025 17:53:47'!
intializeWithBoard: board 

	^self new initializeIntializeWithBoard: board ! !


!classDefinition: #StringPacmanBoard category: #'2024-2C-Parcial-2'!
Object subclass: #StringPacmanBoard
	instanceVariableNames: 'stringRepresentation'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!StringPacmanBoard methodsFor: 'initialization' stamp: 'HAW 11/18/2024 19:29:26'!
initializeRepresentedAs: aStringRepresentation 
	
	stringRepresentation := aStringRepresentation.! !


!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:23:48'!
bigPillCharacter

	^self class bigPillCharacter! !

!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:24:20'!
blinkyCharacter

	^ self class blinkyCharacter ! !

!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:24:30'!
clydeCharacter

	^ self class clydeCharacter ! !

!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:24:52'!
pacmanCharacter

	^ self class pacmanCharacter ! !

!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:25:15'!
smallPillCharacter

	^self class smallPillCharacter ! !

!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:25:37'!
spaceCharacter

	^self class spaceCharacter ! !

!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:26:00'!
wallCharacter

	^self class wallCharacter! !


!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:20:21'!
isBigPill: anElement

	^ anElement = self bigPillCharacter! !

!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:20:36'!
isBlinky: anElement

	^ anElement = self blinkyCharacter! !

!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:21:09'!
isClyde: anElement

	^ anElement = self clydeCharacter! !

!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:21:17'!
isPacman: anElement

	^ anElement = self pacmanCharacter! !

!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:20:12'!
isSmalltPill: anElement

	^ anElement = self smallPillCharacter! !

!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:21:29'!
isSpace: anElement

	^ anElement = self spaceCharacter! !

!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:20:03'!
isWall: anElement

	^ anElement = self wallCharacter! !


!StringPacmanBoard methodsFor: 'visiting' stamp: 'HAW 11/22/2024 14:38:19'!
visit: anElement at: position with: aPacmanBoardVisitor

	(self isWall: anElement) ifTrue: [ ^aPacmanBoardVisitor visitWallAt: position ].
	(self isSmalltPill: anElement) ifTrue: [ ^aPacmanBoardVisitor visitSmallPillAt: position ].
	(self isBigPill: anElement) ifTrue: [ ^aPacmanBoardVisitor visitBigPillAt: position ].
	(self isBlinky: anElement) ifTrue: [ ^aPacmanBoardVisitor visitBlinkyAt: position ].
	(self isClyde: anElement) ifTrue: [ ^aPacmanBoardVisitor visitClydeAt: position ].
	(self isPacman: anElement) ifTrue: [ ^aPacmanBoardVisitor visitPacmanAt: position ].
	(self isSpace: anElement) ifTrue: [ ^aPacmanBoardVisitor visitSpaceAt: position ].
	
	"No hay necesidad de generar un error porque no se permite crear un board con caracteres distintos a todos estos - Hernan"! !

!StringPacmanBoard methodsFor: 'visiting' stamp: 'HAW 11/20/2024 17:22:41'!
visitElementsWith: aPacmanBoardVisitor

	stringRepresentation withIndexDo: [ :aRow :y |
		aRow withIndexDo: [ :anElement :x | 
			self visit: anElement at: x@y with: aPacmanBoardVisitor.]]! !


!StringPacmanBoard methodsFor: 'extent' stamp: 'HAW 11/22/2024 10:50:10'!
extent
	
	"There is always a row and their size is the same to all - Hernan"
	^stringRepresentation first size @ stringRepresentation size! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StringPacmanBoard class' category: #'2024-2C-Parcial-2'!
StringPacmanBoard class
	instanceVariableNames: ''!

!StringPacmanBoard class methodsFor: 'instance creation' stamp: 'HAW 11/22/2024 10:48:32'!
representedAs: aStringRepresentation 
	
	| elementCharactersCount |
	
	elementCharactersCount := self elementCharacterCountOf: aStringRepresentation.	
	self asserltAllActorsAreIn: elementCharactersCount.
	"If I get here the there is always a row - Hernan"
	self assertAllRowsHaveSameSizeIn: aStringRepresentation.
	
	^self new initializeRepresentedAs: aStringRepresentation 
	! !


!StringPacmanBoard class methodsFor: 'error description' stamp: 'HAW 11/20/2024 16:58:30'!
characterIsMissingErrorDescriptionFor: aCharacterName
	
	^aCharacterName, ' is missing'! !

!StringPacmanBoard class methodsFor: 'error description' stamp: 'HAW 11/20/2024 17:39:12'!
notAllowCharaterErrorDescriptionFor: aCharacter

	^'Character ', aCharacter asString, ' is not allowed'! !

!StringPacmanBoard class methodsFor: 'error description' stamp: 'HAW 11/20/2024 17:07:31'!
rowsMustHaveSameSizeErrorDescription
	
	^'Rows must have same number of columns'! !

!StringPacmanBoard class methodsFor: 'error description' stamp: 'HAW 11/20/2024 16:58:01'!
shouldBeUniqueErrorDescriptionFor: aCharacterName
	
	^'There should be only one ', aCharacterName ! !


!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/21/2024 20:17:42'!
allowedCharacters
	
	^ {
	self pacmanCharacter.
	self blinkyCharacter.
	self clydeCharacter.
	self wallCharacter.
	self bigPillCharacter.
	self smallPillCharacter.
	self spaceCharacter.
	}! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 17:24:06'!
bigPillCharacter
	
	^ $*! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 16:56:25'!
blinkyCharacter
	
	^$B! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 16:56:42'!
clydeCharacter
	
	^$C! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 16:41:25'!
pacmanCharacter
	
	^$p! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 17:25:24'!
smallPillCharacter
	
	^ $-! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 17:25:46'!
spaceCharacter
	
	^ $=! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 17:26:06'!
wallCharacter
	
	^ $#! !


!StringPacmanBoard class methodsFor: 'character names' stamp: 'HAW 11/20/2024 17:02:12'!
blinkyName

	^ #blinky! !

!StringPacmanBoard class methodsFor: 'character names' stamp: 'HAW 11/20/2024 17:02:29'!
clydeName

	^ #clyde! !

!StringPacmanBoard class methodsFor: 'character names' stamp: 'HAW 11/20/2024 17:02:05'!
pacmanName

	^ #pacman! !


!StringPacmanBoard class methodsFor: 'assertions' stamp: 'HAW 11/21/2024 19:59:27'!
asserltAllActorsAreIn: elementCharactersCount

	{ self pacmanName. self blinkyName. self clydeName } do: [ :aCharacterName | 
		self assertActorIsCorrect: aCharacterName in: elementCharactersCount ]! !

!StringPacmanBoard class methodsFor: 'assertions' stamp: 'HAW 11/20/2024 17:49:04'!
assert: anElementCharacter isAllowed: allowedCharacters

	(allowedCharacters includes: anElementCharacter) ifFalse: [ self error: (self notAllowCharaterErrorDescriptionFor: anElementCharacter) ]! !

!StringPacmanBoard class methodsFor: 'assertions' stamp: 'HAW 11/20/2024 17:48:41'!
assertActorIsCorrect: aCharacterName in: elements 
	
	| characterIdentifier |
	
	characterIdentifier := self perform: (aCharacterName, #Character) asSymbol.
	(elements includes: characterIdentifier)
		ifFalse: [ self error: (self characterIsMissingErrorDescriptionFor: aCharacterName) ].
		
	(elements occurrencesOf: characterIdentifier) > 1
		ifTrue: [ self error: (self shouldBeUniqueErrorDescriptionFor: aCharacterName) ].
! !

!StringPacmanBoard class methodsFor: 'assertions' stamp: 'HAW 11/20/2024 17:49:16'!
assertAllRowsHaveSameSizeIn: aStringRepresentation

	(aStringRepresentation allSatisfy: [ :aRow | aRow size = aStringRepresentation first size ]) ifFalse: [ 
		self error: self rowsMustHaveSameSizeErrorDescription ]! !

!StringPacmanBoard class methodsFor: 'assertions' stamp: 'HAW 11/20/2024 17:49:30'!
elementCharacterCountOf: aStringRepresentation

	| elementCharactersCount allowedCharacters |
	
	elementCharactersCount := Bag new.
	allowedCharacters := self allowedCharacters.
	
	aStringRepresentation do: [ :aRow |
		aRow do: [ :anElementCharacter | 
			self assert: anElementCharacter isAllowed: allowedCharacters.
			elementCharactersCount add: anElementCharacter ]].
	
	^elementCharactersCount ! !


!classDefinition: #PacmanGameTest category: #'2024-2C-Parcial-2'!
TestCase subclass: #PacmanGameTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!PacmanGameTest methodsFor: 'as yet unclassified' stamp: 'DV 7/1/2025 18:35:22'!
test01PacmanStartsMovingToTheLeftInTheFirstTick
		|board game|
	
		board := StringPacmanBoard representedAs:#(
		'######'
		'#-BC-#'
		'#-p=-#'
		'######').
		
		game := Game intializeWithBoard: board.
		game start.
		self assert: game boardRepresentation equals: #(
		'######'
		'#-BC-#'
		'#p==-#'
		'######').
		
		
		
			! !

!PacmanGameTest methodsFor: 'as yet unclassified' stamp: 'DV 7/1/2025 18:35:39'!
test02PacmanIsAbleToMoveToTheRightIfSpecified
		|board game|
	
		board := StringPacmanBoard representedAs:#(
		'######'
		'#-BC-#'
		'#-p=-#'
		'######').
		
		game := Game intializeWithBoard: board.
		game start.
		game pacmanMovesRight.
		game tick.
		self assert: game boardRepresentation equals: #(
		'######'
		'#-BC-#'
		'#=p=-#'
		'######').
		
		
		
			! !

!PacmanGameTest methodsFor: 'as yet unclassified' stamp: 'DV 7/1/2025 18:59:10'!
test03PacmanIsAbleToMoveUpAndDownIfSpecified
		|board game|
	
		board := StringPacmanBoard representedAs:#(
		'######'
		'#--BC#'
		'#-p=-#'
		'######').
		
		game := Game intializeWithBoard: board.
		game start.
		game pacmanMovesUp.
		game tick.
		self assert: game boardRepresentation equals: #(
		'######'
		'#p-BC#'
		'#===-#'
		'######').
		game pacmanMovesDown.
		game tick.
		self assert: game boardRepresentation equals: #(
		'######'
		'#=-BC#'
		'#p==-#'
		'######').
		
		
		
			! !

!PacmanGameTest methodsFor: 'as yet unclassified' stamp: 'DV 7/1/2025 19:20:50'!
test04PacmanStaysInLimits
		|board game|
	
		board := StringPacmanBoard representedAs:#(
		'######'
		'#--BC#'
		'#-p=-#'
		'######').
		
		game := Game intializeWithBoard: board.
		
		game start.
		game tick.
		self assert: game boardRepresentation equals: #(
		'######'
		'#--BC#'
		'#p==-#'
		'######').
		game pacmanMovesDown.
		game tick.
		self assert: game boardRepresentation equals: #(
		'######'
		'#--BC#'
		'#p==-#'
		'######').
		
	
		
		
		
			! !

!PacmanGameTest methodsFor: 'as yet unclassified' stamp: 'DV 7/1/2025 20:29:22'!
test05EatingASmallPillSumsOnePointToThePacman
		|board game|
	
		board := StringPacmanBoard representedAs:#(
		'######'
		'#--BC#'
		'#-p=-#'
		'######').
		
		game := Game intializeWithBoard: board.
		
		game start.
		self assert: game pacmanHasPoint: 1.
		
	
		
		
		
			! !


!classDefinition: #StringPacmanBoardTest category: #'2024-2C-Parcial-2'!
TestCase subclass: #StringPacmanBoardTest
	instanceVariableNames: 'visitedElements'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 10:48:10'!
test01CannotCreateABoardWithoutThePacman

	self 
		should: [ StringPacmanBoard representedAs: #('BC') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard characterIsMissingErrorDescriptionFor: StringPacmanBoard pacmanName)
		! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 10:48:10'!
test02CannotCreateABoardWithMoreThanOnePacman

	self 
		should: [ StringPacmanBoard representedAs: #('BCpp') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard shouldBeUniqueErrorDescriptionFor: StringPacmanBoard pacmanName)
		! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 10:48:10'!
test03CannotCreateABoardWithoutBlinky

	self 
		should: [ StringPacmanBoard representedAs: #('pC') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard characterIsMissingErrorDescriptionFor: StringPacmanBoard blinkyName)! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 14:32:55'!
test04CannotCreateABoardWithMoreThanOneBlinky

	self 
		should: [ StringPacmanBoard representedAs: #('pBBC') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard shouldBeUniqueErrorDescriptionFor: StringPacmanBoard blinkyName)! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 10:50:33'!
test05CannotCreateABoardWithoutClyde

	self 
		should: [ StringPacmanBoard representedAs: #('pB') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard characterIsMissingErrorDescriptionFor: StringPacmanBoard clydeName)! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 10:50:40'!
test06CannotCreateABoardWithMoreThanOneClyde

	self 
		should: [ StringPacmanBoard representedAs: #('pBCC') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard shouldBeUniqueErrorDescriptionFor: StringPacmanBoard clydeName)! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 10:50:49'!
test07AllRowsHaveSameSize

	self 
		should: [ StringPacmanBoard representedAs: #('pBC' '') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: StringPacmanBoard rowsMustHaveSameSizeErrorDescription! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 10:51:00'!
test08VisitElementsWithRightPosition

	| board |
	
	visitedElements := Dictionary new.
	
	board := StringPacmanBoard representedAs: #('pBC#-*=').
	board visitElementsWith: self.
	
	self assert: (visitedElements at: #pacman) equals: 1@1.
	self assert: (visitedElements at: #blinky) equals: 2@1.
	self assert: (visitedElements at: #clyde) equals: 3@1.
	self assert: (visitedElements at: #wall) equals: 4@1.
	self assert: (visitedElements at: #smallPill) equals: 5@1.
	self assert: (visitedElements at: #bigPill) equals: 6@1.
	self assert: (visitedElements at: #space) equals: 7@1.
	self assert: visitedElements size equals: 7
	
	
	! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 10:51:11'!
test09InvalidCharactersAreNotAllowed

	self 
		should: [ StringPacmanBoard representedAs: #('pBCx') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard notAllowCharaterErrorDescriptionFor: $x)! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 16:42:59'!
test10BoardTranslationExample
"
	HACER PASAR ESTE TEST ANTES DE COMENZAR: falla porque en la posicion del pacman (p) pone un string en vez de #pacman
"
	| board translator |
	
	board := StringPacmanBoard representedAs:#(
'######'
'#-BC-#'
'#-p=-#'
'######').

	translator := BoardTranslatorExample on: board.
	
	self assert: translator stringRepresentationOfBoard equals: #(
'######'
'#-BC-#'
'#-p=-#'
'######').
! !


!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:16:25'!
visitBigPillAt: position 
	
	visitedElements at: #bigPill put: position ! !

!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:15:27'!
visitBlinkyAt: position 
	
	visitedElements at: #blinky put: position ! !

!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:15:56'!
visitClydeAt: position 
	
	visitedElements at: #clyde put: position ! !

!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:15:10'!
visitPacmanAt: position 
	
	visitedElements at: #pacman put: position ! !

!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:16:14'!
visitSmallPillAt: position 
	
	visitedElements at: #smallPill put: position ! !

!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:17:12'!
visitSpaceAt: position 
	
	visitedElements at: #space put: position ! !

!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:16:05'!
visitWallAt: position 
	
	visitedElements at: #wall put: position ! !
