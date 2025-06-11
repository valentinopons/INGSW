!classDefinition: #Test category: #'TusLibros.com'!
TestCase subclass: #Test
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!Test methodsFor: 'as yet unclassified' stamp: 'v 6/10/2025 22:02:51'!
test01CarritoRecienCreadoEsVacio
	|cart|
	
	cart := Cart newWith: {}.
	self assert: cart isEmpty.
	! !

!Test methodsFor: 'as yet unclassified' stamp: 'v 6/10/2025 22:09:09'!
test02CarritoAlAgregarUnLibroYaNoEsVacio
	|cart|
	
	cart := Cart newWith:#('Martin Fierro').
	cart addBook: 'Martin Fierro'.
	self deny: cart isEmpty.
	! !

!Test methodsFor: 'as yet unclassified' stamp: 'v 6/10/2025 22:09:14'!
test03CarritoNoPuedeAgregarLibroQueNoEsDelCatalogo
	|cart|
	
	cart := Cart newWith: #('El Eternauta').
	self should: [cart addBook: 'Martin Fierro'] raise: Error withMessageText: 'Book is not available'.
	! !


!classDefinition: #Cart category: #'TusLibros.com'!
Object subclass: #Cart
	instanceVariableNames: 'containers catallog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!Cart methodsFor: 'as yet unclassified' stamp: 'v 6/10/2025 22:09:00'!
checkBookAvailability: aBookToBeChecked
	
	(catallog includes: aBookToBeChecked) ifFalse: [Error new signal: 'Book is not available'].
	
	! !

!Cart methodsFor: 'as yet unclassified' stamp: 'v 6/10/2025 21:47:13'!
initialize
	
	containers := Set new.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'v 6/10/2025 21:46:48'!
isEmpty
	
	^containers isEmpty ! !


!Cart methodsFor: 'actions' stamp: 'v 6/10/2025 22:07:06'!
addBook: aBook
	
	self checkBookAvailability: aBook.
	containers add: aBook! !


!Cart methodsFor: 'intance creation' stamp: 'v 6/10/2025 22:04:25'!
initializeNewWith: aCatallog 
	
	catallog := aCatallog.
	containers := Set new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #'TusLibros.com'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'v 6/10/2025 22:03:56'!
newWith: aCatallog 
	
	^self new initializeNewWith: aCatallog ! !
