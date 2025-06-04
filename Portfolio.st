!classDefinition: #FinanceAsset category: #'Portfolio-Ejercicio'!
Object subclass: #FinanceAsset
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!FinanceAsset methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 18:24:51'!
checkTheAdditionOfPorfolio: aPortfolio withoutChecking: portfoliosVisited

	self subclassResponsibility! !

!FinanceAsset methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 18:30:22'!
checkTheAdditionOfReceptiveAccount: anAccount withoutChecking: porfoliosVisited

	self subclassResponsibility! !

!FinanceAsset methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 10:06:41'!
isAddedTo: aPortfolio

	self subclassResponsibility! !

!FinanceAsset methodsFor: 'as yet unclassified' stamp: 'fv 6/2/2025 22:01:59'!
isValidToBeAddedTo: aPortfolio

	self subclassResponsibility! !

!FinanceAsset methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 18:10:45'!
isValidToBeAddedTo: aPortfolio withoutChecking: portfoliosVisited

	self subclassResponsibility! !


!classDefinition: #Porfolio category: #'Portfolio-Ejercicio'!
FinanceAsset subclass: #Porfolio
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
!classDefinition: #PortfolioTest category: #'Portfolio-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

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


!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'NR 5/27/2021 17:36:04'!
test02BalanceOfPortfolioWithAccountsIsSumOfAccountsBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:23:25'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:15'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100))! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:11'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:06'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'NR 6/22/2020 07:31:19'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit anotherAccount portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 on: account.
	anotherAccount := ReceptiveAccount new.
	anotherAccountWithdraw := Withdraw register: 100 on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:32'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: #'Portfolio-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:48'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:54'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:02'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance .
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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:54'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:21:24'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1 equals: account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #TransferTest category: #'Portfolio-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 21:44:20'!
test01AccountThatMakesATransactionToOtherAccountSeesTheirBalanceAffected
	|transferer transfered |
	transferer := ReceptiveAccount new.
	transfered := ReceptiveAccount new.
	Deposit register: 100 on: transferer.
	Transfer amount: 50 from: transferer to: transfered.
	self assert: transferer balance equals: 50.
	self assert: transfered balance equals: 50.
	
	
	
	 ! !


!classDefinition: #Account category: #'Portfolio-Solucion'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:24:25'!
isComposedBy: anAccount

	self subclassResponsibility ! !


!Account methodsFor: 'balance' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !


!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !

!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:24:04'!
addedTo: aPortfolio

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: #'Portfolio-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !


!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:19:36'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !


!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !


!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !


!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'Portfolio-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:24:46'!
balance

	^transactions 
		inject: 0
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'balance' stamp: 'v 5/27/2025 22:01:58'!
calculateBalance
	
	transactions isEmpty ifTrue: [^0].
	transactions do: [ :aTransaction | aTransaction changeBalanceForAccount: self ]. ! !

!ReceptiveAccount methodsFor: 'balance' stamp: 'fv 6/3/2025 18:51:26'!
isAddedTo:Argument ! !

!ReceptiveAccount methodsFor: 'balance' stamp: 'v 5/27/2025 21:57:38'!
substractToBalance: aNumber
	
	balance := balance - aNumber ! !

!ReceptiveAccount methodsFor: 'balance' stamp: 'v 5/27/2025 21:57:48'!
sumToBalance: aNumber
	
	balance := balance + aNumber ! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 18:27:09'!
checkTheAdditionOfPorfolio: aPortfolio withoutChecking: portfoliosVisited.
	
	aPortfolio isValidToAddReceptiveAccount: self withoutChecking: portfoliosVisited 
						
		! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 18:35:13'!
checkTheAdditionOfReceptiveAccount: anAccount withoutChecking: porfoliosVisited

			
		(self = anAccount) ifTrue: [Error new signal: 'cant add an account that has been already added']! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'fv 6/3/2025 11:56:48'!
isValidToBeAddedTo: aPortfolio withoutChecking: porfoliosVisited 

	aPortfolio isValidToAddReceptiveAccount: self withoutChecking: porfoliosVisited.
	aPortfolio portfoliosAboveDoNotContain: self withoutChecking: porfoliosVisited. ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !


!classDefinition: #AccountTransaction category: #'Portfolio-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'v 5/27/2025 21:55:51'!
changeBalanceForAccount: anAccount

	self subclassResponsibility! !

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Solucion'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/21/2019 18:54:27'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: #'Portfolio-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

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


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: #'Portfolio-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'v 5/27/2025 21:57:08'!
changeBalanceForAccount: anAccount
	
	anAccount substractToBalance: value.! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transfer category: #'Portfolio-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'value transferer transfered'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Transfer methodsFor: 'initializing' stamp: 'fv 6/3/2025 21:48:44'!
initializeAmount: anAmount from: aTransferer to: aTransfered 
	
	value := anAmount.
	transferer := aTransferer .
	transfered := aTransfered.
	Withdraw register: value  on:transferer  .
	Deposit register: value  on: transfered.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: #'Portfolio-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'fv 6/3/2025 21:45:20'!
amount: aRenameMe1 from: transferer to: transfered 
	
	^self new initializeAmount: aRenameMe1 from: transferer to: transfered ! !
