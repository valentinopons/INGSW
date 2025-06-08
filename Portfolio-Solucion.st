!classDefinition: #PortfolioTest category: #'Portfolio-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

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


!classDefinition: #PortfolioTreeTest category: #'Portfolio-Solucion'!
TestCase subclass: #PortfolioTreeTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!PortfolioTreeTest methodsFor: 'as yet unclassified' stamp: 'v 6/7/2025 23:58:01'!
test01AnEmptyPortfolioJustGeneratesATreeWithThePortfolioNameOnTop
	|portfolio report|
	
	portfolio := Portfolio new named: 'Portfolio de la familia'.
	report := PortfolioTree new generate: portfolio.
	self assert: report equals: 'Portfolio de la familia'
	
	
	
	
	! !

!PortfolioTreeTest methodsFor: 'as yet unclassified' stamp: 'v 6/8/2025 01:01:31'!
test02PortfolioWithOneAccountInsideGeneratesCorrectlyTreeReport
	|portfolio account report|
	
	account := ReceptiveAccount new named: 'Mi cuenta'.
	
	portfolio := (Portfolio with: account )named: 'Portfolio de la familia'.
	report := PortfolioTree new generate: portfolio.	
	
	self assert: report equals: 
	
	'Portfolio de la familia
		Mi cuenta'
	
	
	
	
	! !


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


!classDefinition: #ReportsTest category: #'Portfolio-Solucion'!
TestCase subclass: #ReportsTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!ReportsTest methodsFor: 'as yet unclassified' stamp: 'v 6/7/2025 20:41:44'!
test01ReceptiveAccountWithNoMovementsGeneratesEmptyReport
      |account report|
	account := ReceptiveAccount new.
	report := AccountSummary new generate: account.
	self assert: 'Balance = 0 ' equals: report
	! !

!ReportsTest methodsFor: 'as yet unclassified' stamp: 'v 6/7/2025 20:41:44'!
test02ReceptiveAccountWithOneDepositGeneratesReportWithThatDeposit
      |account report|
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	report := AccountSummary new generate: account.
	self assert: 'Deposit = 100 Balance = 100 ' equals: report
	! !

!ReportsTest methodsFor: 'as yet unclassified' stamp: 'v 6/7/2025 20:41:44'!
test03ReceptiveAccountWithMultipleDepositGeneratesReportWithThatDeposit
      |account report|
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Deposit register: 50 on: account.
	Deposit register: 100 on: account.
	
	report := AccountSummary new generate: account.
	self assert: report equals: 'Deposit = 100 Deposit = 50 Deposit = 100 Balance = 250 '
	! !

!ReportsTest methodsFor: 'as yet unclassified' stamp: 'v 6/7/2025 20:41:44'!
test04ReceptiveAccountWithMultiplesWithdrawGeneratesReportWithThatWithdraw
      |account report|
	account := ReceptiveAccount new.
	Withdraw register: 10 on: account.
	Withdraw register: 30 on: account.
	report := AccountSummary new generate: account.
	self assert: report equals: 'Withdraw = 10 Withdraw = 30 Balance = -40 '
	! !

!ReportsTest methodsFor: 'as yet unclassified' stamp: 'v 6/7/2025 20:41:44'!
test05ReceptiveAccountWithMultiplesTransfersWithdraw
      |sender reciver report|
	sender := ReceptiveAccount new.
	reciver  := ReceptiveAccount new.
	Transfer amount: 100 from: sender  to: reciver.
	Transfer amount: 50 from: sender  to: reciver.

	report := AccountSummary new generate: sender.
	self assert: report equals: 'Withdraw from transfer = 100 Withdraw from transfer = 50 Balance = -150 '
	! !

!ReportsTest methodsFor: 'as yet unclassified' stamp: 'v 6/7/2025 20:41:44'!
test06ReceptiveAccountWithMultiplesTransfersDeposits
      |sender receiver report|
	sender := ReceptiveAccount new.
	receiver  := ReceptiveAccount new.
	Transfer amount: 100 from: sender  to: receiver.
	Transfer amount: 50 from: sender  to: receiver.

	report := AccountSummary new generate: receiver .
	self assert: report equals: 'Deposit from transfer = 100 Deposit from transfer = 50 Balance = 150 '
	! !

!ReportsTest methodsFor: 'as yet unclassified' stamp: 'v 6/7/2025 20:41:44'!
test07PorfolioWithNoAccountsGeneratesEmptyReport
      |account report|
	account := Portfolio new.
	report := AccountSummary new generate: account.
	self assert: 'Balance = 0' equals: report
	! !

!ReportsTest methodsFor: 'as yet unclassified' stamp: 'v 6/7/2025 20:41:44'!
test08PorfolioWithOneAccountGeneratesTheReportForThatAccount
      |account porfolio report|
	porfolio := Portfolio new.
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	porfolio add: account.
	report := AccountSummary new generate: porfolio.
	self assert: report equals: 'Deposit = 100 Balance = 100 ' 
	! !

!ReportsTest methodsFor: 'as yet unclassified' stamp: 'v 6/7/2025 20:41:44'!
test09PorfolioWithMultipleAccountGeneratesTheReportForThatAccount
      |account account1 porfolio report|
	porfolio := Portfolio new.
	account := ReceptiveAccount new.
	account1 := ReceptiveAccount new.

	Deposit register: 100 on: account.
	Deposit register: 100 on: account1.

	porfolio add: account ; add: account1.
	report := AccountSummary new generate: porfolio.
	self assert: report equals: 'Deposit = 100 Balance = 100 Deposit = 100 Balance = 100 ' 
	! !

!ReportsTest methodsFor: 'as yet unclassified' stamp: 'v 6/7/2025 20:47:57'!
test10ReceptiveAccountWithNoMovementsGeneratesEmptyTransferReport
      |account report|
	account := ReceptiveAccount new.
	report := TransferNet new generate: account.
	self assert: report equals: 'Neto: 0'
	! !

!ReportsTest methodsFor: 'as yet unclassified' stamp: 'v 6/7/2025 22:06:42'!
test11ReceptiveAccountWithOneDepositFromTransferHasTheDepositValueInTransferNet
      |account account1 report|
	account := ReceptiveAccount new.
	account1 := ReceptiveAccount new.
	
	Transfer amount: 50  from: account  to: account1.

	report := TransferNet new generate: account1.
	self assert: report equals: 'Neto: 50'
	! !

!ReportsTest methodsFor: 'as yet unclassified' stamp: 'v 6/7/2025 22:08:22'!
test12ReceptiveAccountWithMoreThanOneDepositFromTransferHasTheDepositValueInTransferNet
      |account account1 report|
	account := ReceptiveAccount new.
	account1 := ReceptiveAccount new.
	
	Transfer amount: 50  from: account  to: account1.
	Transfer amount: 100  from: account  to: account1.
	Transfer amount: 50  from: account  to: account1.

	report := TransferNet new generate: account1.
	self assert: report equals: 'Neto: 200'
	! !

!ReportsTest methodsFor: 'as yet unclassified' stamp: 'v 6/7/2025 22:36:11'!
test13ReceptiveAccountWithMoreThanOneWithdrawFromTransferHasTheWithdrawValueInTransferNet
      |account account1 report|
	account := ReceptiveAccount new.
	account1 := ReceptiveAccount new.
	
	Transfer amount: 50  from: account  to: account1.
	Transfer amount: 50  from: account  to: account1.
	Transfer amount: 50  from: account  to: account1.

	report := TransferNet new generate: account.
	self assert: report equals: 'Neto: -150'
	! !

!ReportsTest methodsFor: 'as yet unclassified' stamp: 'v 6/7/2025 22:39:18'!
test14PortfolioWithNoAccountsHasZeroTransferNet
      |report portfolio|
	portfolio := Portfolio new.
	report := TransferNet new generate: portfolio .
	self assert: report equals: 'Neto: 0'
	! !

!ReportsTest methodsFor: 'as yet unclassified' stamp: 'v 6/7/2025 22:53:27'!
test16PortfolioWithMultipleAccountSeesTheTransferNetOfThoseAccounts
      |account account1 report portfolio|
	account := ReceptiveAccount new.
	account1 := ReceptiveAccount new.
	portfolio := Portfolio new.
	
	Transfer amount: 50  from: account  to: account1.
	Transfer amount: 50  from: account  to: account1.
	Transfer amount: 50  from: account  to: account1.
	
	portfolio add: account1 ; add: account .

	report := TransferNet new generate: portfolio.
	self assert: report equals: 'Neto: 0'
	! !


!classDefinition: #TransferTest category: #'Portfolio-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'fv 6/4/2025 11:24:17'!
test01AccountThatMakesATransactionToOtherAccountSeesTheirBalanceAffected
	|transferer transfered |
	transferer := ReceptiveAccount new.
	transfered := ReceptiveAccount new.
	Deposit register: 110 on: transferer.
	Transfer amount: 50 from: transferer to: transfered.
	self assert: transferer balance equals: 60.
	self assert: transfered balance equals: 50.
	
	
	
	 ! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'fv 6/4/2025 17:52:13'!
test02ItIsPossibleToGoFromDepositToWithdrawAndViceversa
	|transferer transfered transfer deposit withdraw |
	transferer := ReceptiveAccount new.
	transfered := ReceptiveAccount new.
	
	transfer := Transfer amount: 50 from: transferer to: transfered.
	deposit := transfer deposit.
	withdraw := transfer withdraw.
	self assert: deposit associatedWithdraw equals: withdraw.
	self assert: withdraw associatedDeposit equals:  deposit.
	
	
	
	 ! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'fv 6/4/2025 18:21:33'!
test03AccountsDetectRegisteredTransactionsCorrectly
	|transferer transfered transfer deposit withdraw |
	transferer := ReceptiveAccount new.
	transfered := ReceptiveAccount new.
	
	transfer := Transfer amount: 50 from: transferer to: transfered.
	deposit := transfer deposit.
	withdraw := transfer withdraw.
	self assert: (transferer hasRegistered: withdraw).
	self assert: (transfered hasRegistered: deposit).
	
	
	
	 ! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'fv 6/4/2025 18:56:49'!
test04TransferWithNegativeValueShouldThrowError
	|transferer transfered |
	transferer := ReceptiveAccount new.
	transfered := ReceptiveAccount new.
	
	self should: [Transfer amount: -1 from: transferer to: transfered]
			raise: Error  
			withMessageText: 'Negative values are not correct'
	
	
	
	
	 ! !


!classDefinition: #Account category: #'Portfolio-Solucion'!
Object subclass: #Account
	instanceVariableNames: 'name'
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

!Account methodsFor: 'transactions' stamp: 'v 6/7/2025 22:27:09'!
getTotalValueFromTransfer

	self subclassResponsibility! !

!Account methodsFor: 'transactions' stamp: 'v 6/7/2025 23:53:29'!
named: aName
	
	name := aName.! !

!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:24:04'!
addedTo: aPortfolio

	self subclassResponsibility ! !


!Account methodsFor: 'accounts management' stamp: 'v 6/7/2025 22:12:48'!
getTextReport

	self subclassResponsibility! !


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

!Portfolio methodsFor: 'accounts management' stamp: 'fv 6/4/2025 20:55:58'!
getTextReport
	|text|
	text :=''.
	accounts ifEmpty: [^'Balance = 0'].
	accounts do:[:financialAsset | text:= text, financialAsset getTextReport].
	^text
	! !

!Portfolio methodsFor: 'accounts management' stamp: 'v 6/7/2025 23:51:23'!
initialize
	
	name := 'Unamed Portfolio'. ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !



!Portfolio methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:19:36'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !


!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !

!Portfolio methodsFor: 'transactions' stamp: 'v 6/7/2025 22:44:42'!
getTotalValueFromTransfer
	
	^accounts sum: [:account | account getTotalValueFromTransfer]! !

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


!Portfolio methodsFor: 'as yet unclassified' stamp: 'v 6/8/2025 00:58:00'!
getChildName
	
	^accounts first name! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'v 6/8/2025 00:55:09'!
name
	
	^name! !

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

!ReceptiveAccount methodsFor: 'transactions' stamp: 'fv 6/4/2025 20:51:39'!
getTextReport
	|text|
	text:= ''.
	transactions do:[ :transaction | text := text, transaction getTextReport].
	text := text, 'Balance = ', self balance asString, ' '.
	^text! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'v 6/7/2025 22:28:48'!
getTotalValueFromTransfer
	|totalValue|
	transactions ifEmpty: [^0].
	totalValue := transactions sum: [:transaction| transaction getValueForTransferNetReport].
	^totalValue.! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'v 6/7/2025 23:52:53'!
initilaize
	
	name := 'Unamed Account'
! !

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

!AccountTransaction methodsFor: 'value' stamp: 'v 6/7/2025 22:22:36'!
getValueForTransferNetReport

	self subclassResponsibility! !

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'fv 6/4/2025 20:26:35'!
getTextReport

	self subclassResponsibility! !

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

!Deposit methodsFor: 'value' stamp: 'v 6/7/2025 22:23:52'!
getValueForTransferNetReport
	^0! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'accessing' stamp: 'fv 6/4/2025 19:54:42'!
getTextReport
	
	^'Deposit = ', self value asString, ' '.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferDeposit category: #'Portfolio-Solucion'!
AccountTransaction subclass: #TransferDeposit
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferDeposit methodsFor: 'initilaize' stamp: 'fv 6/4/2025 18:04:26'!
initializeWithTransfer: aTransfer associatedTo: transfered 
	
	transfer := aTransfer.
	transfered register:  self. 
! !

!TransferDeposit methodsFor: 'initilaize' stamp: 'fv 6/4/2025 20:22:43'!
value
	
	^transfer value! !


!TransferDeposit methodsFor: 'accessing' stamp: 'fv 6/4/2025 17:42:32'!
associatedWithdraw
	
	^transfer withdraw ! !

!TransferDeposit methodsFor: 'accessing' stamp: 'fv 6/4/2025 20:25:32'!
getTextReport

	^'Deposit from transfer = ', self value asString, ' '.! !


!TransferDeposit methodsFor: 'action' stamp: 'fv 6/4/2025 18:12:33'!
affectBalance: aBalance
	
	^aBalance + (transfer value)
	
	! !


!TransferDeposit methodsFor: 'value' stamp: 'v 6/7/2025 22:24:10'!
getValueForTransferNetReport
	
	^self value ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferDeposit class' category: #'Portfolio-Solucion'!
TransferDeposit class
	instanceVariableNames: ''!

!TransferDeposit class methodsFor: 'instance creation' stamp: 'fv 6/4/2025 15:39:41'!
withTransfer: aValue associatedTo: transfered
 
	^self new initializeWithTransfer: aValue associatedTo: transfered ! !


!classDefinition: #TransferWithdraw category: #'Portfolio-Solucion'!
AccountTransaction subclass: #TransferWithdraw
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'fv 6/4/2025 18:10:48'!
initializeWithTransfer: aTransfer associatedTo: transferer

	transfer := aTransfer .
	transferer register:  self. ! !

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'fv 6/4/2025 20:22:15'!
value
	^transfer value.! !


!TransferWithdraw methodsFor: 'accessing' stamp: 'fv 6/4/2025 18:13:10'!
affectBalance: aBalance
	
	^aBalance - (transfer value)
	! !

!TransferWithdraw methodsFor: 'accessing' stamp: 'fv 6/4/2025 17:43:12'!
associatedDeposit
	
	^transfer deposit! !

!TransferWithdraw methodsFor: 'accessing' stamp: 'fv 6/4/2025 20:23:10'!
getTextReport
	
	^'Withdraw from transfer = ', self value asString, ' '.! !


!TransferWithdraw methodsFor: 'value' stamp: 'v 6/7/2025 22:32:32'!
getValueForTransferNetReport
	
	^self value negated! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferWithdraw class' category: #'Portfolio-Solucion'!
TransferWithdraw class
	instanceVariableNames: ''!

!TransferWithdraw class methodsFor: 'as yet unclassified' stamp: 'fv 6/4/2025 15:54:52'!
withTransfer: aTransfer associatedTo: transfered
 
	^self new initializeWithTransfer: aTransfer associatedTo: transfered ! !


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

!Withdraw methodsFor: 'value' stamp: 'v 6/7/2025 22:24:21'!
getValueForTransferNetReport
	
	^0! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 'fv 6/4/2025 20:07:42'!
getTextReport
	
	^'Withdraw = ', self value asString, ' '.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Reports category: #'Portfolio-Solucion'!
Object subclass: #Reports
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Reports methodsFor: 'printing' stamp: 'v 6/7/2025 23:10:19'!
generate: aFinancialAsset

	self subclassResponsibility! !


!classDefinition: #AccountSummary category: #'Portfolio-Solucion'!
Reports subclass: #AccountSummary
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountSummary methodsFor: 'printing' stamp: 'fv 6/4/2025 19:38:09'!
generate: aFinancialAsset 
	
	^aFinancialAsset getTextReport.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummary class' category: #'Portfolio-Solucion'!
AccountSummary class
	instanceVariableNames: ''!

!AccountSummary class methodsFor: 'instance creation' stamp: 'fv 6/4/2025 19:13:54'!
generate: account 
	"DO NOT FORGET TO RENAME COLLABORATORS AND REMOVE THIS COMMENT!!!!"
	self shouldBeImplemented.
	^self new initializeGenerate: account ! !


!classDefinition: #PortfolioTree category: #'Portfolio-Solucion'!
Reports subclass: #PortfolioTree
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!PortfolioTree methodsFor: 'as yet unclassified' stamp: 'v 6/8/2025 00:57:27'!
generate: aPortfolio
	
	^'Portfolio de la familia
		', aPortfolio getChildName
	
	! !


!classDefinition: #TransferNet category: #'Portfolio-Solucion'!
Reports subclass: #TransferNet
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferNet methodsFor: 'actions' stamp: 'v 6/7/2025 22:27:54'!
generate: aFinancialAsset 
	^ 'Neto: ', (aFinancialAsset getTotalValueFromTransfer asString)
	
! !


!classDefinition: #Transfer category: #'Portfolio-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'value transferer transfered deposit withdraw'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Transfer methodsFor: 'initializing' stamp: 'fv 6/4/2025 18:31:17'!
initializeAmount: anAmount from: aTransferer to: aTransfered 
	
	value := anAmount.
	transferer := aTransferer .
	transfered := aTransfered.
	deposit := TransferDeposit withTransfer: self associatedTo: transfered.
	withdraw := TransferWithdraw withTransfer: self associatedTo: transferer.
	! !


!Transfer methodsFor: 'accessing' stamp: 'fv 6/4/2025 17:41:14'!
associatedWithdraw
	self shouldBeImplemented.! !

!Transfer methodsFor: 'accessing' stamp: 'fv 6/4/2025 15:22:03'!
deposit
	^deposit! !

!Transfer methodsFor: 'accessing' stamp: 'fv 6/4/2025 18:13:47'!
value
	
	^value! !

!Transfer methodsFor: 'accessing' stamp: 'fv 6/4/2025 17:40:45'!
withdraw
	
	^withdraw! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: #'Portfolio-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'fv 6/4/2025 18:55:31'!
amount: anAmount from: transferer to: transfered 
	
	self checkValidAmount: anAmount.
	^self new initializeAmount: anAmount from: transferer to: transfered ! !


!Transfer class methodsFor: 'error' stamp: 'fv 6/4/2025 18:55:25'!
checkValidAmount: anAmount 
	
	anAmount negative ifTrue: [Error new signal: 'Negative values are not correct'].! !
