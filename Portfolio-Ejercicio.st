!classDefinition: #PortfolioTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'v 5/29/2025 15:49:15'!
test01AnEmptyPortfolioHasZeroBalance
	|portfolio|
	portfolio := Portfolio new.
	self assert: portfolio balance equals: 0! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'v 5/30/2025 17:48:01'!
test02PortfolioWithOneReceptiveAccountHasTheBalanceOfThatReceptiveAccount
	|portfolio account|
	portfolio := Portfolio new.
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
	portfolio add: account.
		
	self assert: portfolio balance equals: 100! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'v 5/30/2025 17:47:44'!
test03PortfolioWithTwoReceptiveAccountHasTheBalanceOfTheSumOfReceptiveAccount
	|portfolio account account1|
	portfolio := Portfolio new.
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
	portfolio add: account.
	
	account1 := ReceptiveAccount  new.
	Deposit register: 200 on: account1.
	portfolio add: account1.	
	
	self assert: portfolio balance equals: 300! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'v 5/30/2025 18:21:11'!
test04PortfolioHasAnAccountWithATransactionAndAskIfThatTransactionIsRegistered
	|portfolio account |
	portfolio := Portfolio new.
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
	
	portfolio add: account.
	
	self assert: (portfolio hasRegistered: account transactions first)! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'v 5/30/2025 18:24:28'!
test05PortfolioHasAnAccountWithATransactionAndAskIfAnotherTransactionIsRegistered
	|portfolio account account1 |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount  new.
	account1:= ReceptiveAccount  new.
	
	Deposit register: 100 on: account.
	Deposit register: 200 on: account1.
	
	portfolio add: account.
	
	self deny: (portfolio hasRegistered: account1 transactions first)! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'v 5/30/2025 18:32:09'!
test06PortfolioWithNoAccountsHasNoTransactions
	|portfolio|
	
	portfolio := Portfolio new.
	
	self assert: portfolio transactions isEmpty 
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'v 5/30/2025 19:01:21'!
test07PortfolioWithOneAccountHasTheTransactionsOfThatAccount
	|portfolio account |
	portfolio := Portfolio new.
	account := ReceptiveAccount  new.
	
	Deposit register: 100 on: account.
	
	portfolio add: account.
	
	self assert: portfolio transactions equals: account transactions asSet 
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'v 5/30/2025 19:10:31'!
test08PortfolioWithTwoAccountsHasTheTransactionsOfBothAccounts
	|portfolio account account1 transactions |
	portfolio := Portfolio new.
	account := ReceptiveAccount  new.
	account1 := ReceptiveAccount  new.

	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
	transactions := Set new.
	transactions := transactions union:  ((account1 transactions asSet ) union: (account transactions asSet)) .

	portfolio add: account ; add: account1.
	
	self assert: (portfolio transactions) equals: transactions  
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'fv 6/2/2025 18:32:43'!
test09PortfolioWithOneAccountCantAddThatSameAccount
	|portfolio account  |
	portfolio := Portfolio new.
	account := ReceptiveAccount  new.
	
	Deposit register: 100 on: account.

	portfolio add: account.
	
	self should: [portfolio add: account] raise: Error 
			withMessageText: 'cant add an account that has been already added'.
	
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'fv 6/2/2025 20:54:35'!
test10PortfolioWithOneAccountCantAddAPortfolioWithThatSameAccount
	|portfolio account  portfolio1|
	portfolio := Portfolio new.
	portfolio1 := Portfolio new.
	account := ReceptiveAccount  new.
	
	Deposit register: 100 on: account.
	
	portfolio1 add: account.
	portfolio  add: account.
	
	self should: [portfolio add: portfolio1 ] raise: Error 
			withMessageText: 'cant add an account that has been already added'.
	
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 11:55:40'!
test11PortfolioWithOneAccountCantAddAPortfolioWithAPortfolioWithTheSameAccountAsTheFather
	|portfolio account  portfolio1 portfolio2|
	portfolio := Portfolio new.
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	account := ReceptiveAccount  new.
	
	Deposit register: 100 on: account.
	
	portfolio add: portfolio1.
	portfolio1 add: account.
	portfolio2 add: account.
	
	
	self should: [	portfolio add: portfolio2] raise: Error 
			withMessageText: 'cant add an account that has been already added'.
	
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'fv 6/2/2025 21:35:52'!
test12PortfolioWithOneAccountAndOnePortfolioCantAddThatAccountToThatPortfolio
	|portfolio account  portfolio1 |
	portfolio := Portfolio new.
	portfolio1 := Portfolio new.

	account := ReceptiveAccount  new.
	
	Deposit register: 100 on: account.
	
	portfolio add: account.
	portfolio add: portfolio1.
	
	
	self should: [	portfolio1 add: account] raise: Error 
			withMessageText: 'cant add an account that has been already added'.
	
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 16:23:07'!
test13PortfolioWithOneAccountAndAPortfolioThatPorfolioCantAddAPorfolioWithThatSameAccount
	|portfolio account  portfolio1 portfolio2|
	portfolio := Portfolio new.
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	account := ReceptiveAccount  new.
	
	Deposit register: 100 on: account.
	
	portfolio add: portfolio1.
	portfolio add: account.
	portfolio2 add: account.
	
	self should: [	portfolio1 add: portfolio2] raise: Error 
			withMessageText: 'cant add an account that has been already added'.
	
! !


!classDefinition: #ReceptiveAccountTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:07:53'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:07:57'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:08:01'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:08:26'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw account |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:08:12'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #AccountTransaction category: #'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'v 5/27/2025 21:55:51'!
changeBalanceForAccount: anAccount

	self subclassResponsibility! !

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
register: aValue on: account

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !


!classDefinition: #Deposit category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'v 5/27/2025 21:56:45'!
changeBalanceForAccount: anAccount
	
	anAccount sumToBalance: value.
	! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'v 5/27/2025 21:57:08'!
changeBalanceForAccount: anAccount
	
	anAccount substractToBalance: value.! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #BankingStructure category: #'Portfolio-Ejercicio'!
Object subclass: #BankingStructure
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!BankingStructure methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 10:06:41'!
isAddedTo: aPortfolio

	self subclassResponsibility! !

!BankingStructure methodsFor: 'as yet unclassified' stamp: 'fv 6/2/2025 22:01:59'!
isValidToBeAddedTo: aPortfolio

	self subclassResponsibility! !


!classDefinition: #Portfolio category: #'Portfolio-Ejercicio'!
BankingStructure subclass: #Portfolio
	instanceVariableNames: 'accounts porfoliosAbove'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'accessing' stamp: 'fv 6/3/2025 11:33:23'!
add: aBankingStructure 
	self isValidToAdd: aBankingStructure.
	aBankingStructure isAddedTo:self.
	accounts add: aBankingStructure ! !

!Portfolio methodsFor: 'accessing' stamp: 'v 5/30/2025 18:45:51'!
balance

	^accounts sum: [:account | account balance]  ifEmpty: [^0] .! !

!Portfolio methodsFor: 'accessing' stamp: 'v 5/30/2025 18:18:56'!
hasRegistered: transaction
	
	^accounts anySatisfy: [:account| (account hasRegistered: transaction)].
! !

!Portfolio methodsFor: 'accessing' stamp: 'fv 6/3/2025 11:54:46'!
portfoliosAboveDoNotContain: anAccount withoutChecking: porfoliosVisited
	
	porfoliosAbove do: [:portfolio | anAccount isValidToBeAddedTo: portfolio withoutChecking: porfoliosVisited ].! !

!Portfolio methodsFor: 'accessing' stamp: 'v 5/30/2025 18:59:23'!
transactions
	|transactions|
	transactions := Set new.
	accounts do:[:account | transactions := transactions union: account transactions].
	^transactions ! !


!Portfolio methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 11:21:41'!
initialize
	
	accounts := Set new.
	porfoliosAbove := OrderedCollection new.
! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 10:08:31'!
isAddedTo: aPortfolio

	porfoliosAbove add: aPortfolio.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 16:10:26'!
isValidForPorfoliosAboveToAdd: aPorfolio WithoutChecking: portfoliosVisited

	porfoliosAbove do:[:porfolio | aPorfolio isValidToBeAddedTo: porfolio withoutChecking: portfoliosVisited ].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 16:08:22'!
isValidToBeAddedTo: aPortfolio withoutChecking: portfoliosVisited
	
	aPortfolio isValidToAddPortfolio: self withoutChecking: portfoliosVisited .
	
	aPortfolio isValidForPorfoliosAboveToAdd: self WithoutChecking: portfoliosVisited ! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 15:23:36'!
porfoliosAboveDoNoHaveAnyOfMyAccountsWithoutChecking: portfoliosVisited

	^ porfoliosAbove do:[:porfolio | 
	accounts do: [:bankingStructure | bankingStructure isValidToBeAddedTo: porfolio withoutChecking: portfoliosVisited ]]! !


!Portfolio methodsFor: 'error handling' stamp: 'fv 6/3/2025 11:39:00'!
isValidToAdd: bankingStructure 
	|porfoliosVisited|
	porfoliosVisited := OrderedCollection new.
	bankingStructure isValidToBeAddedTo: self withoutChecking: porfoliosVisited .
	
	
	! !

!Portfolio methodsFor: 'error handling' stamp: 'fv 6/3/2025 16:22:43'!
isValidToAddPortfolio: aPortfolio withoutChecking: portfoliosVisited.

	 accounts do: [:member | ((member isKindOf: ReceptiveAccount)) ifTrue:[aPortfolio isValidToAddReceptiveAccount: member withoutChecking: portfoliosVisited ].
							((member isKindOf: Portfolio) and:((portfoliosVisited includes: member)not) ) ifTrue: [member markMeAsVisitedIn: portfoliosVisited .
								member isValidToAddPortfolio: aPortfolio withoutChecking: portfoliosVisited ]]! !

!Portfolio methodsFor: 'error handling' stamp: 'fv 6/3/2025 11:45:35'!
isValidToAddReceptiveAccount: anAccount withoutChecking: porfoliosVisited.

	accounts do: [:member | ((member isKindOf: Portfolio) and: ((porfoliosVisited includes: member)not)) ifTrue: [.porfoliosVisited add: member. member isValidToAddReceptiveAccount: anAccount withoutChecking:porfoliosVisited . ].
								(member isKindOf: ReceptiveAccount ) ifTrue: [
									(member = anAccount) ifTrue: [Error new signal: 'cant add an account that has been already added']]]! !

!Portfolio methodsFor: 'error handling' stamp: 'fv 6/3/2025 16:22:25'!
markMeAsVisitedIn: portfoliosVisited

	^ portfoliosVisited add: self! !

!Portfolio methodsFor: 'error handling' stamp: 'fv 6/3/2025 16:20:19'!
markPorfolioAsVisited: aPorfolio in: portfoliosVisited

	^ portfoliosVisited add: aPorfolio! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Ejercicio'!
BankingStructure subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions balance'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'v 5/27/2025 21:58:41'!
initialize

	super initialize.
	balance := 0.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'v 5/27/2025 21:59:58'!
balance
	
	self calculateBalance. 
	^balance! !

!ReceptiveAccount methodsFor: 'balance' stamp: 'v 5/27/2025 22:01:58'!
calculateBalance
	
	transactions isEmpty ifTrue: [^0].
	transactions do: [ :aTransaction | aTransaction changeBalanceForAccount: self ]. ! !

!ReceptiveAccount methodsFor: 'balance' stamp: 'v 5/27/2025 21:57:38'!
substractToBalance: aNumber
	
	balance := balance - aNumber ! !

!ReceptiveAccount methodsFor: 'balance' stamp: 'v 5/27/2025 21:57:48'!
sumToBalance: aNumber
	
	balance := balance + aNumber ! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'v 5/30/2025 18:11:21'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 10:22:31'!
isAddedTo: aPortfolio

! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 11:56:48'!
isValidToBeAddedTo: aPortfolio withoutChecking: porfoliosVisited 

	aPortfolio isValidToAddReceptiveAccount: self withoutChecking: porfoliosVisited.
	aPortfolio portfoliosAboveDoNotContain: self withoutChecking: porfoliosVisited. ! !
