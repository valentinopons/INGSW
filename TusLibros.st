!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:08'!
test01NewCartsAreCreatedEmpty

	self assert: self createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [ cart add: self itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 0 of: self itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 2 of: self itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test06CartRemembersAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self assert: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := self createCart.
	
	self deny: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: 2 of: self itemSellByTheStore.
	self assert: (cart occurrencesOf: self itemSellByTheStore) = 2! !


!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:48'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:43'!
defaultCatalog
	
	^ Array with: self itemSellByTheStore! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:44'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:43'!
itemSellByTheStore
	
	^ 'validBook'! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'nil' stamp: 'v 6/13/2025 19:28:08'!
test01CashierWithEmptyCartReturnsError
	|cart|
	
	cart := Cart acceptingItemsOf: {}.
	self should:[Cashier checksOutCart: cart creditCard: {}. ]  raise: Error withMessageText: 'Error empty cart'! !


!CashierTest methodsFor: 'as yet unclassified' stamp: 'v 6/13/2025 19:43:43'!
test02CashierTotalEqualsPriceOfBookInsideCart
	|cart priceList cashier|
	priceList := Dictionary new.
	priceList at: 'El Eternauta' put: 10*dollar.
	
	cart := Cart acceptingItemsOf:  priceList.
       cart add: 'El Eternauta'.
	cashier :=Cashier checksOutCart: cart creditCard: {}. 
	
	self assert: cashier total equals: 10*dollar.  ! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'v 6/13/2025 20:05:37'!
test03CashierTotalEqualsPricesOfAllBooksInsideCart
	|cart priceList cashier|
	priceList := Dictionary new.
	priceList at: 'El Eternauta' put: 10*dollar.
	priceList at: 'Batman' put: 20*dollar.

	
	cart := Cart acceptingItemsOf:  priceList.
       cart add: 'El Eternauta'.
	cart add: 'Batman'.
	cashier :=Cashier checksOutCart: cart creditCard: {}. 
	
	self assert: cashier total equals: 30*dollar.  ! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'v 6/13/2025 20:37:11'!
test04CashierProduceErrorWhenTryingToCheckACreditCardWithExpiredDate
	|cart priceList|
	priceList := Dictionary new.
	priceList at: 'El Eternauta' put: 10*dollar.
	priceList at: 'Batman' put: 20*dollar.

	
	cart := Cart acceptingItemsOf:  priceList.
       cart add: 'El Eternauta'.
	cart add: 'Batman'.
	self should: [ Cashier checksOutCart: cart creditCard: (CreditCard withNumber: '4568778567342345' expireDate: 04/2025)]
				 raise: Error withMessageText: 'Invalid expiration date'. 
	! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:45'!
add: aQuantity of: anItem

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ].
	(catalog includes: anItem) ifFalse: [ self error: self invalidItemErrorMessage].
	
	1 to: aQuantity do: [:aNumber | items add: anItem]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'cart creditCard'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'instance creation' stamp: 'v 6/13/2025 19:26:39'!
initializeChecksOutCart: aCart creditCard: aCreditCard 

	cart := aCart .
	creditCard := aCreditCard.! !


!Cashier methodsFor: 'accessing' stamp: 'v 6/13/2025 20:17:30'!
total
	|totalSum|
	totalSum := 0. 
	cart do: [:bookPrice | totalSum := totalSum + bookPrice].
	^totalSum .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'instance creation' stamp: 'v 6/13/2025 19:29:13'!
checksOutCart: cart creditCard: aCreditCard 
	
	cart isEmpty ifTrue: [Error new signal: 'Error empty cart'].
	
	^self new initializeChecksOutCart: cart creditCard: aCreditCard ! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!
