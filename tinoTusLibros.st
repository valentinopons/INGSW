!classDefinition: #CartTest category: 'tinoTusLibros'!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'tinoTusLibros'!

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

!CartTest methodsFor: 'support' stamp: 'v 6/23/2025 10:43:25'!
defaultCatalog
	|catalog|
	catalog := Dictionary new.
	catalog at: (self itemSellByTheStore) put: 10*dollar.
	catalog at: 'Martin Fierro' put: 15*dollar.
	^catalog ! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:44'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:43'!
itemSellByTheStore
	
	^ 'validBook'! !


!classDefinition: #CashierTest category: 'tinoTusLibros'!
TestCase subclass: #CashierTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'tinoTusLibros'!

!CashierTest methodsFor: 'nil' stamp: 'v 6/23/2025 14:28:34'!
test01CashierWithEmptyCartReturnsError
	|cart|
	
	cart := Cart acceptingItemsOf: {}.
	self should:[Cashier checksOutCart: cart creditCard: (CreditCard withNumber: '4568778567342345' expireDate: (YearMonth year: 2025 month: 9 ))]  raise: Error withMessageText: 'Error empty cart'.! !


!CashierTest methodsFor: 'as yet unclassified' stamp: 'v 6/22/2025 16:38:04'!
test02CashierTotalEqualsPriceOfBookInsideCart
	|cart priceList cashier|
	priceList := Dictionary new.
	priceList at: 'El Eternauta' put: 10*dollar.
	
	cart := Cart acceptingItemsOf:  priceList.
       cart add: 'El Eternauta'.
	cashier :=Cashier checksOutCart: cart creditCard: (CreditCard withNumber: '4568778567342345' expireDate: (Date year: 2026 month: 4 day: 4) ). . 
	
	self assert: cashier total equals: 10*dollar.  ! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'v 6/23/2025 14:27:43'!
test03CashierTotalEqualsPricesOfAllBooksInsideCart
	|cart priceList cashier|
	priceList := Dictionary new.
	priceList at: 'El Eternauta' put: 10*dollar.
	priceList at: 'Batman' put: 20*dollar.

	
	cart := Cart acceptingItemsOf:  priceList.
       cart add: 'El Eternauta'.
	cart add: 'Batman'.
	cashier :=Cashier checksOutCart: cart creditCard: (CreditCard withNumber: '4568778567342345' expireDate: (YearMonth year: 2025 month: 9) ). 
	
	self assert: cashier total equals: 30*dollar.  ! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'v 6/23/2025 14:26:41'!
test04CashierProduceErrorWhenTryingToCheckACreditCardWithExpiredDate
	|cart priceList|
	priceList := Dictionary new.
	priceList at: 'El Eternauta' put: 10*dollar.
	priceList at: 'Batman' put: 20*dollar.

	
	cart := Cart acceptingItemsOf:  priceList.
       cart add: 'El Eternauta'.
	cart add: 'Batman'.
	self should: [ Cashier checksOutCart: cart creditCard: (CreditCard withNumber: '4568778567342345' expireDate: (YearMonth year: 2024 month: 6) )]
				 raise: Error withMessageText: 'Invalid expiration date'. 
	! !


!classDefinition: #InterfazTest category: 'tinoTusLibros'!
TestCase subclass: #InterfazTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'tinoTusLibros'!

!InterfazTest methodsFor: 'as yet unclassified' stamp: 'v 6/22/2025 18:44:14'!
test01InterfaceUserWithInvalidPasswordCannotCreateACart
	
	self should: [Interface new createCartWithClientId:'eltino' password:'123'] 
				raise: Error withMessageText: '1|Wrong username or password' 
	
	
	
	
	! !

!InterfazTest methodsFor: 'as yet unclassified' stamp: 'v 6/22/2025 19:50:50'!
test02InterfaceUserWithValidUsernameAndPasswordCreatesSuccsefullyACart
	
	self assert: (Interface new createCartWithClientId:'eltino' password:'hola123') equals: '0|1'.
	
	
	
	
	! !

!InterfazTest methodsFor: 'as yet unclassified' stamp: 'v 6/23/2025 10:25:59'!
test03InterfaceUserIsAbleToAddABookToHisCart
	|interface |
	interface := Interface new.
	interface createCartWithClientId: 'eltino' password: 'hola123'.
	
	self deny: (interface cartWithId: 1 Includes: 'validBook').
	
	self assert: (interface addToCartId: 1 bookId: 'validBook' quantity: 1) equals: '0|1'.
	
	self assert: (interface cartWithId: 1 Includes: 'validBook').

	
	
				
	
	
	
	
	! !

!InterfazTest methodsFor: 'as yet unclassified' stamp: 'v 6/22/2025 20:27:03'!
test04InterfaceUserIsAbleToAddABookToHisCart
	|interface |
	interface := Interface new.
	interface createCartWithClientId: 'eltino' password: 'hola123'.
	
	self deny: (interface cartWithId: 1 Includes: 'validBook').
	
	self assert: (interface addToCartId: 1 bookId: 'validBook' quantity: 1) equals: '0|1'.
	
	self assert: (interface cartWithId: 1 Includes: 'validBook').

	
	
				
	
	
	
	
	! !

!InterfazTest methodsFor: 'as yet unclassified' stamp: 'v 6/23/2025 10:23:48'!
test05InterfaceUserCantAddNegativeQuantity
	|interface |
	interface := Interface new.
	interface createCartWithClientId: 'eltino' password: 'hola123'.
		
	self assert: (interface addToCartId: 1 bookId: 'validBook' quantity: -1) equals: '1|Invalid number of items'.
	

	
	
				
	
	
	
	
	! !

!InterfazTest methodsFor: 'as yet unclassified' stamp: 'v 6/23/2025 10:34:53'!
test06InterfaceUserCantAddABookThatIsNotInTheCatalog
	|interface |
	interface := Interface new.
	interface createCartWithClientId: 'eltino' password: 'hola123'.
		
	self assert: (interface addToCartId: 1 bookId: 'El Eternauta' quantity: 1) equals: '1|Item is not in catalog'.
	

	
	
				
	
	
	
	
	! !

!InterfazTest methodsFor: 'as yet unclassified' stamp: 'v 6/23/2025 10:36:18'!
test07InterfaceUserListEmptyCart
	|interface |
	interface := Interface new.
	interface createCartWithClientId: 'eltino' password: 'hola123'.
		
	self assert: (interface listCart: 1) equals: '0|'.
	

	
	
				
	
	
	
	
	! !

!InterfazTest methodsFor: 'as yet unclassified' stamp: 'v 6/23/2025 10:39:01'!
test08InterfaceUserListCartWithOneBook
	|interface |
	interface := Interface new.
	interface createCartWithClientId: 'eltino' password: 'hola123'.
	
	interface addToCartId: 1 bookId: 'validBook' quantity: 1.
		
	self assert: (interface listCart: 1) equals: '0|validBook|1'.
	

	
	
				
	
	
	
	
	! !

!InterfazTest methodsFor: 'as yet unclassified' stamp: 'v 6/23/2025 10:50:03'!
test09InterfaceUserListCartWithMoreThanOneBook
	|interface |
	interface := Interface new.
	interface createCartWithClientId: 'eltino' password: 'hola123'.
	
	interface addToCartId: 1 bookId: 'validBook' quantity: 1.
	interface addToCartId: 1 bookId: 'Martin Fierro' quantity: 2.
	
	self assert: (interface listCart: 1) equals: '0|validBook|1|Martin Fierro|2'.
	

	
	
				
	
	
	
	
	! !

!InterfazTest methodsFor: 'as yet unclassified' stamp: 'v 6/23/2025 14:31:22'!
test10InterfaceUserChecksOutCart
	|interface creditCard |
	interface := Interface new.
	creditCard := CreditCard withNumber: 4646328236432 expireDate: (YearMonth year: 2025 month: 9) .
	interface createCartWithClientId: 'eltino' password: 'hola123'.
	
	interface addToCartId: 1 bookId: 'validBook' quantity: 1.
	
	self assert: (interface checkOutCart: 1 withCreditCard: creditCard) equals: '0|1'.
	
	

	
	
				
	
	
	
	
	! !

!InterfazTest methodsFor: 'as yet unclassified' stamp: 'v 6/23/2025 14:34:57'!
test11InterfaceUserWithInvalidCreditCardChecksOutCart
	|interface creditCard |
	interface := Interface new.
	creditCard := CreditCard withNumber: 4646328236432 expireDate: (YearMonth year: 2024 month: 9) .
	interface createCartWithClientId: 'eltino' password: 'hola123'.
	
	interface addToCartId: 1 bookId: 'validBook' quantity: 1.
	
	self assert: (interface checkOutCart: 1 withCreditCard: creditCard) equals: '1|Invalid expiration date'.
	
	

	
	
				
	
	
	
	
	! !

!InterfazTest methodsFor: 'as yet unclassified' stamp: 'v 6/23/2025 18:30:04'!
test12InterfaceUserWithInvalidUserOrPasswordListCreatesError
	|interface creditCard |
	interface := Interface new.
	creditCard := CreditCard withNumber: 4646328236432 expireDate: (YearMonth year: 2025 month: 9) .
	interface createCartWithClientId: 'eltino' password: 'hola123'.
	
	interface addToCartId: 1 bookId: 'validBook' quantity: 1.
	interface checkOutCart: 1 withCreditCard: creditCard.
	self should: [(interface listPurchasesFrom: 'eltino' password: 'chau123')]  raise: Error  withMessageText:  '1|Wrong username or password'
	
	
	

	
	
				
	
	
	
	
	! !

!InterfazTest methodsFor: 'as yet unclassified' stamp: 'v 6/23/2025 19:37:17'!
test13InterfaceUserListPurchasesOfCartWithOneBook
	|interface creditCard |
	interface := Interface new.
	creditCard := CreditCard withNumber: 4646328236432 expireDate: (YearMonth year: 2025 month: 9) .
	interface createCartWithClientId: 'eltino' password: 'hola123'.
	
	interface addToCartId: 1 bookId: 'validBook' quantity: 1.
	interface checkOutCart: 1 withCreditCard: creditCard .
	self assert: (interface listPurchasesFrom: 'eltino' password: 'hola123') equals: '0|validBook|1|10 * dollars'.
	
	
	

	
	
				
	
	
	
	
	! !

!InterfazTest methodsFor: 'as yet unclassified' stamp: 'v 6/23/2025 19:39:38'!
test14InterfaceUserListPurchasesOfCartWithMoreThanOneBook
	|interface creditCard |
	interface := Interface new.
	creditCard := CreditCard withNumber: 4646328236432 expireDate: (YearMonth year: 2025 month: 9) .
	interface createCartWithClientId: 'eltino' password: 'hola123'.
	
	interface addToCartId: 1 bookId: 'validBook' quantity: 1.
	interface addToCartId: 1 bookId: 'Martin Fierro' quantity: 2.

	interface checkOutCart: 1 withCreditCard: creditCard .
	self assert: (interface listPurchasesFrom: 'eltino' password: 'hola123') equals: '0|validBook|1|Martin Fierro|2|40 * dollars'.
	
	
	

	
	
				
	
	
	
	
	! !


!classDefinition: #YearMonth category: 'tinoTusLibros'!
TestCase subclass: #YearMonth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'tinoTusLibros'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'YearMonth class' category: 'tinoTusLibros'!
YearMonth class
	instanceVariableNames: ''!

!YearMonth class methodsFor: 'as yet unclassified' stamp: 'v 6/23/2025 14:26:03'!
year: aYear month: aMonth
	
	^Date year: aYear month: aMonth  day: (Date daysInMonth: aMonth forYear: aYear). ! !


!classDefinition: #Cart category: 'tinoTusLibros'!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'tinoTusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'initialization' stamp: 'v 6/23/2025 10:53:27'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := Dictionary new.! !


!Cart methodsFor: 'queries' stamp: 'v 6/23/2025 11:34:28'!
do: aBlock
	
	items keysAndValuesDo: aBlock ! !

!Cart methodsFor: 'queries' stamp: 'v 6/23/2025 10:59:23'!
occurrencesOf: anItem

	[^items at: anItem] on: Error do: [^0].! !


!Cart methodsFor: 'testing' stamp: 'v 6/23/2025 10:59:36'!
includes: anItem

	^items includesKey: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'v 6/23/2025 11:00:57'!
add: aQuantity of: anItem

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ].
	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage].
	
	(items includesKey: anItem) ifTrue: [ items at: anItem put: ((items at: anItem)  + aQuantity)]
							    ifFalse:[items at: anItem put: (aQuantity)].
	 ! !


!Cart methodsFor: 'accessing' stamp: 'v 6/22/2025 15:34:06'!
catalog
	
	^catalog! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: 'tinoTusLibros'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: 'tinoTusLibros'!
Object subclass: #Cashier
	instanceVariableNames: 'cart creditCard'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'tinoTusLibros'!

!Cashier methodsFor: 'instance creation' stamp: 'v 6/13/2025 19:26:39'!
initializeChecksOutCart: aCart creditCard: aCreditCard 

	cart := aCart .
	creditCard := aCreditCard.! !


!Cashier methodsFor: 'accessing' stamp: 'v 6/23/2025 11:32:40'!
total
	|totalSum|
	totalSum := 0. 
	cart do: [:book :quantity | totalSum := totalSum + (quantity *(cart catalog at: book)) ].
	^totalSum .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: 'tinoTusLibros'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'instance creation' stamp: 'v 6/22/2025 15:45:37'!
checksOutCart: cart creditCard: aCreditCard 
	
	cart isEmpty ifTrue: [Error new signal: 'Error empty cart'].
	aCreditCard isExpired ifTrue: [Error new signal: 'Invalid expiration date'].
	^self new initializeChecksOutCart: cart creditCard: aCreditCard ! !


!classDefinition: #CreditCard category: 'tinoTusLibros'!
Object subclass: #CreditCard
	instanceVariableNames: 'expirationDate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'tinoTusLibros'!

!CreditCard methodsFor: 'as yet unclassified' stamp: 'v 6/23/2025 14:27:05'!
isExpired
	
	^expirationDate  < (Date today )! !

!CreditCard methodsFor: 'as yet unclassified' stamp: 'v 6/22/2025 16:04:22'!
withNumber: aCreditCardNumber expireDate: aExpirationDate
	
	expirationDate := aExpirationDate 
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: 'tinoTusLibros'!
CreditCard class
	instanceVariableNames: 'expireDate'!

!CreditCard class methodsFor: 'as yet unclassified' stamp: 'v 6/22/2025 16:27:47'!
withNumber: aCreditCardNumber expireDate: aExpirationDate
	
	^self new withNumber: aCreditCardNumber expireDate: aExpirationDate

	
	
	
	! !


!classDefinition: #Interface category: 'tinoTusLibros'!
Object subclass: #Interface
	instanceVariableNames: 'dataBase cartList purchaseList'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'tinoTusLibros'!

!Interface methodsFor: 'as yet unclassified' stamp: 'v 6/22/2025 20:17:20'!
cartWithId: cartId Includes: bookId
	
	^(cartList at: cartId) includes: bookId .! !

!Interface methodsFor: 'as yet unclassified' stamp: 'v 6/23/2025 18:47:05'!
createCartWithClientId: anUsername password: aPassword
	
	self validatePassword: aPassword andUsername: anUsername.
	cartList add:  CartTest new createCart.
	^self finishSuccesfully

! !

!Interface methodsFor: 'as yet unclassified' stamp: 'v 6/23/2025 19:32:46'!
initialize
	dataBase := Dictionary new.
	dataBase at:'eltino' put: 'hola123'.
	cartList := OrderedCollection new.
	purchaseList := Dictionary new.
	
	! !

!Interface methodsFor: 'as yet unclassified' stamp: 'v 6/22/2025 19:00:28'!
invalidCredentials

	^ Error new signal: '1|Wrong username or password'! !

!Interface methodsFor: 'as yet unclassified' stamp: 'v 6/23/2025 11:35:30'!
listCart: cartId
	|cart bookList|
	cart := cartList at: cartId.
	bookList := '0|'.
	
	cart isEmpty ifTrue:[^'0|'].
	
	cart do: [:name :quantity | bookList := bookList, name,'|', quantity asString,'|'].
	
	^bookList allButLast.
	
	! !

!Interface methodsFor: 'as yet unclassified' stamp: 'v 6/22/2025 20:32:16'!
validatePassword: aPassword andUsername: anUsername

	[(dataBase at: anUsername) = aPassword ifFalse:[^self invalidCredentials] ] on: Error do: [^self invalidCredentials]! !


!Interface methodsFor: 'cartActions' stamp: 'v 6/23/2025 10:23:17'!
addToCartId: cartId bookId: id quantity: quantity
	
	[(cartList at: cartId) add: quantity of: id] on: Error do: [:error | ^('1|', (error messageText))].
	^'0|',cartId asString 
	! !

!Interface methodsFor: 'cartActions' stamp: 'v 6/23/2025 18:50:25'!
checkOutCart: cartId withCreditCard: creditCard 
	|cart|
	cart := cartList at: cartId.
	
	[Cashier checksOutCart: cart creditCard: creditCard] 
			  on: Error do: [:error| ^'1|', error messageText].
			
	self loadPurchaseList: cart.
	
	^self finishSuccesfully.
	
	! !

!Interface methodsFor: 'cartActions' stamp: 'v 6/23/2025 18:47:05'!
finishSuccesfully

	^ '0|1'! !

!Interface methodsFor: 'cartActions' stamp: 'v 6/23/2025 19:31:06'!
listPurchasesFrom: userId password: password
	
	self validatePassword: password andUsername: userId.
	^self reportPurchaseList 
	
	! !

!Interface methodsFor: 'cartActions' stamp: 'v 6/23/2025 19:32:36'!
loadPurchaseList: cart

	^ cart do: [:name :quantity | purchaseList at: name put: quantity]! !

!Interface methodsFor: 'cartActions' stamp: 'v 6/23/2025 19:40:56'!
reportPurchaseList
	|list total|
	list := '0'.
	total := 0.
	
	purchaseList keysAndValuesDo: [:name :quantity| list := list,'|',name,'|',quantity asString  . 
									total := total +(self totalBookValue: name forQuantity: quantity) ].
	^list,'|', total asString! !

!Interface methodsFor: 'cartActions' stamp: 'v 6/23/2025 19:14:39'!
totalBookValue: name forQuantity: quantity

	^ quantity* (cartList at: 1) catalog at: name! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Interface class' category: 'tinoTusLibros'!
Interface class
	instanceVariableNames: ''!

!Interface class methodsFor: 'instance creation' stamp: 'v 6/22/2025 19:00:37'!
createCartWithClientId: anUsername password: aPassword 
	
	^self new createCartWithClientId: anUsername password: aPassword ! !

