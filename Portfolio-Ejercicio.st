!classDefinition: #PortfolioTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 17:48:17'!
test01AnEmptyPortfolioHasZeroBalance
	|portfolio|
	portfolio := Porfolio new.
	self assert: portfolio balance equals: 0! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 17:48:17'!
test02PortfolioWithOneReceptiveAccountHasTheBalanceOfThatReceptiveAccount
	|portfolio account|
	portfolio := Porfolio new.
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
	portfolio add: account.
		
	self assert: portfolio balance equals: 100! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 17:48:17'!
test03PortfolioWithTwoReceptiveAccountHasTheBalanceOfTheSumOfReceptiveAccount
	|portfolio account account1|
	portfolio := Porfolio new.
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
	portfolio add: account.
	
	account1 := ReceptiveAccount  new.
	Deposit register: 200 on: account1.
	portfolio add: account1.	
	
	self assert: portfolio balance equals: 300! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 17:48:17'!
test04PortfolioHasAnAccountWithATransactionAndAskIfThatTransactionIsRegistered
	|portfolio account |
	portfolio := Porfolio new.
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
	
	portfolio add: account.
	
	self assert: (portfolio hasRegistered: account transactions first)! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 17:48:17'!
test05PortfolioHasAnAccountWithATransactionAndAskIfAnotherTransactionIsRegistered
	|portfolio account account1 |
	
	portfolio := Porfolio new.
	account := ReceptiveAccount  new.
	account1:= ReceptiveAccount  new.
	
	Deposit register: 100 on: account.
	Deposit register: 200 on: account1.
	
	portfolio add: account.
	
	self deny: (portfolio hasRegistered: account1 transactions first)! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 17:48:17'!
test06PortfolioWithNoAccountsHasNoTransactions
	|portfolio|
	
	portfolio := Porfolio new.
	
	self assert: portfolio transactions isEmpty 
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 17:48:17'!
test07PortfolioWithOneAccountHasTheTransactionsOfThatAccount
	|portfolio account |
	portfolio := Porfolio new.
	account := ReceptiveAccount  new.
	
	Deposit register: 100 on: account.
	
	portfolio add: account.
	
	self assert: portfolio transactions equals: account transactions asSet 
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 17:48:17'!
test08PortfolioWithTwoAccountsHasTheTransactionsOfBothAccounts
	|portfolio account account1 transactions |
	portfolio := Porfolio new.
	account := ReceptiveAccount  new.
	account1 := ReceptiveAccount  new.

	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
	transactions := Set new.
	transactions := transactions union:  ((account1 transactions asSet ) union: (account transactions asSet)) .

	portfolio add: account ; add: account1.
	
	self assert: (portfolio transactions) equals: transactions  
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 17:48:17'!
test09PortfolioWithOneAccountCantAddThatSameAccount
	|portfolio account  |
	portfolio := Porfolio new.
	account := ReceptiveAccount  new.
	
	Deposit register: 100 on: account.

	portfolio add: account.
	
	self should: [portfolio add: account] raise: Error 
			withMessageText: 'cant add an account that has been already added'.
	
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 17:48:17'!
test10PortfolioWithOneAccountCantAddAPortfolioWithThatSameAccount
	|portfolio account  portfolio1|
	portfolio := Porfolio new.
	portfolio1 := Porfolio new.
	account := ReceptiveAccount  new.
	
	Deposit register: 100 on: account.
	
	portfolio1 add: account.
	portfolio  add: account.
	
	self should: [portfolio add: portfolio1 ] raise: Error 
			withMessageText: 'cant add an account that has been already added'.
	
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 17:48:17'!
test11PortfolioWithOneAccountCantAddAPortfolioWithAPortfolioWithTheSameAccountAsTheFather
	|portfolio account  portfolio1 portfolio2|
	portfolio := Porfolio new.
	portfolio1 := Porfolio new.
	portfolio2 := Porfolio new.
	account := ReceptiveAccount  new.
	
	Deposit register: 100 on: account.
	
	portfolio add: portfolio1.
	portfolio1 add: account.
	portfolio2 add: account.
	
	
	self should: [	portfolio add: portfolio2] raise: Error 
			withMessageText: 'cant add an account that has been already added'.
	
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 17:48:17'!
test12PortfolioWithOneAccountAndOnePortfolioCantAddThatAccountToThatPortfolio
	|portfolio account  portfolio1 |
	portfolio := Porfolio new.
	portfolio1 := Porfolio new.

	account := ReceptiveAccount  new.
	
	Deposit register: 100 on: account.
	
	portfolio add: account.
	portfolio add: portfolio1.
	
	
	self should: [	portfolio1 add: account] raise: Error 
			withMessageText: 'cant add an account that has been already added'.
	
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 17:48:17'!
test13PortfolioWithOneAccountAndAPortfolioThatPorfolioCantAddAPorfolioWithThatSameAccount
	|portfolio account  portfolio1 portfolio2|
	portfolio := Porfolio new.
	portfolio1 := Porfolio new.
	portfolio2 := Porfolio new.
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

!BankingStructure methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 18:24:51'!
checkTheAdditionOfPorfolio: aPortfolio withoutChecking: portfoliosVisited

	self subclassResponsibility! !

!BankingStructure methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 18:30:22'!
checkTheAdditionOfReceptiveAccount: anAccount withoutChecking: porfoliosVisited

	self subclassResponsibility! !

!BankingStructure methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 10:06:41'!
isAddedTo: aPortfolio

	self subclassResponsibility! !

!BankingStructure methodsFor: 'as yet unclassified' stamp: 'fv 6/2/2025 22:01:59'!
isValidToBeAddedTo: aPortfolio

	self subclassResponsibility! !

!BankingStructure methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 18:10:45'!
isValidToBeAddedTo: aPortfolio withoutChecking: portfoliosVisited

	self subclassResponsibility! !


!classDefinition: #Porfolio category: #'Portfolio-Ejercicio'!
BankingStructure subclass: #Porfolio
	instanceVariableNames: 'financialAssets porfoliosAbove'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Porfolio methodsFor: 'accessing' stamp: 'fv 6/3/2025 18:36:50'!
add: fiancialAsset 
	self isValidToAdd: fiancialAsset.
	fiancialAsset isAddedTo:self.
	financialAssets add: fiancialAsset ! !

!Porfolio methodsFor: 'accessing' stamp: 'fv 6/3/2025 18:36:24'!
balance

	^financialAssets sum: [:asset | asset balance]  ifEmpty: [^0] .! !

!Porfolio methodsFor: 'accessing' stamp: 'fv 6/3/2025 18:36:14'!
hasRegistered: transaction
	
	^financialAssets anySatisfy: [:account| (account hasRegistered: transaction)].
! !

!Porfolio methodsFor: 'accessing' stamp: 'fv 6/3/2025 11:54:46'!
portfoliosAboveDoNotContain: anAccount withoutChecking: porfoliosVisited
	
	porfoliosAbove do: [:portfolio | anAccount isValidToBeAddedTo: portfolio withoutChecking: porfoliosVisited ].! !

!Porfolio methodsFor: 'accessing' stamp: 'fv 6/3/2025 18:36:14'!
transactions
	|transactions|
	transactions := Set new.
	financialAssets do:[:account | transactions := transactions union: account transactions].
	^transactions ! !


!Porfolio methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 18:26:34'!
checkTheAdditionOfPorfolio: aPortfolio withoutChecking: portfoliosVisited.

		((portfoliosVisited includes: self)not) ifTrue: [
			self markMeAsVisitedIn: portfoliosVisited .
			self isValidToAddPortfolio: aPortfolio withoutChecking: portfoliosVisited ]! !

!Porfolio methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 18:38:16'!
checkTheAdditionOfReceptiveAccount: anAccount withoutChecking: porfoliosVisited
	
		 ((porfoliosVisited includes: self)not) ifTrue: [
			porfoliosVisited add: self. 
			self isValidToAddReceptiveAccount: anAccount withoutChecking:porfoliosVisited . ].
					
	! !

!Porfolio methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 18:36:14'!
initialize
	
	financialAssets := Set new.
	porfoliosAbove := OrderedCollection new.
! !

!Porfolio methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 10:08:31'!
isAddedTo: aPortfolio

	porfoliosAbove add: aPortfolio.! !

!Porfolio methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 16:10:26'!
isValidForPorfoliosAboveToAdd: aPorfolio WithoutChecking: portfoliosVisited

	porfoliosAbove do:[:porfolio | aPorfolio isValidToBeAddedTo: porfolio withoutChecking: portfoliosVisited ].! !

!Porfolio methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 16:08:22'!
isValidToBeAddedTo: aPortfolio withoutChecking: portfoliosVisited
	
	aPortfolio isValidToAddPortfolio: self withoutChecking: portfoliosVisited .
	
	aPortfolio isValidForPorfoliosAboveToAdd: self WithoutChecking: portfoliosVisited ! !

!Porfolio methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 18:39:28'!
porfoliosAboveDoNoHaveAnyOfMyAccountsWithoutChecking: portfoliosVisited

	porfoliosAbove do:[:porfolio | 
		financialAssets do: [:bankingStructure | bankingStructure isValidToBeAddedTo: porfolio withoutChecking: portfoliosVisited ]]! !


!Porfolio methodsFor: 'error handling' stamp: 'fv 6/3/2025 11:39:00'!
isValidToAdd: bankingStructure 
	|porfoliosVisited|
	porfoliosVisited := OrderedCollection new.
	bankingStructure isValidToBeAddedTo: self withoutChecking: porfoliosVisited .
	
	
	! !

!Porfolio methodsFor: 'error handling' stamp: 'fv 6/3/2025 18:36:14'!
isValidToAddPortfolio: aPortfolio withoutChecking: portfoliosVisited.
	
	
	 financialAssets do: [:member | member checkTheAdditionOfPorfolio: aPortfolio withoutChecking: portfoliosVisited.]! !

!Porfolio methodsFor: 'error handling' stamp: 'fv 6/3/2025 18:36:14'!
isValidToAddReceptiveAccount: anAccount withoutChecking: porfoliosVisited.

	financialAssets do: [:member | member checkTheAdditionOfReceptiveAccount: anAccount withoutChecking: porfoliosVisited.]! !

!Porfolio methodsFor: 'error handling' stamp: 'fv 6/3/2025 16:22:25'!
markMeAsVisitedIn: portfoliosVisited

	^ portfoliosVisited add: self! !

!Porfolio methodsFor: 'error handling' stamp: 'fv 6/3/2025 16:20:19'!
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


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 18:27:09'!
checkTheAdditionOfPorfolio: aPortfolio withoutChecking: portfoliosVisited.
	
	aPortfolio isValidToAddReceptiveAccount: self withoutChecking: portfoliosVisited 
						
		! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 18:35:13'!
checkTheAdditionOfReceptiveAccount: anAccount withoutChecking: porfoliosVisited

			
		(self = anAccount) ifTrue: [Error new signal: 'cant add an account that has been already added']! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 10:22:31'!
isAddedTo: aPortfolio

! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 11:56:48'!
isValidToBeAddedTo: aPortfolio withoutChecking: porfoliosVisited 

	aPortfolio isValidToAddReceptiveAccount: self withoutChecking: porfoliosVisited.
	aPortfolio portfoliosAboveDoNotContain: self withoutChecking: porfoliosVisited. ! !
