!classDefinition: #TDDBabyStepsRomanNumeralsTest category: #TDDBabyStepsGameRomanNumerals!
TestCase subclass: #TDDBabyStepsRomanNumeralsTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDBabyStepsGameRomanNumerals'!

!TDDBabyStepsRomanNumeralsTest methodsFor: 'tests' stamp: 'valentino 5/15/2025 20:20:31'!
test0001

	self assert: (RomanConverter new toRoman: 1) equals: 'I'
	! !

!TDDBabyStepsRomanNumeralsTest methodsFor: 'tests' stamp: 'valentino 5/15/2025 20:20:31'!
test0002

	self assert: (RomanConverter new toRoman: 2) equals: 'II'
	! !

!TDDBabyStepsRomanNumeralsTest methodsFor: 'tests' stamp: 'valentino 5/15/2025 20:20:31'!
test0003

	self assert: (RomanConverter new toRoman: 3) equals: 'III'
	! !

!TDDBabyStepsRomanNumeralsTest methodsFor: 'tests' stamp: 'valentino 5/15/2025 20:20:31'!
test0004

	self assert: (RomanConverter new toRoman: 4) equals: 'IV'
	! !

!TDDBabyStepsRomanNumeralsTest methodsFor: 'tests' stamp: 'valentino 5/15/2025 20:20:31'!
test0005

	self assert: (RomanConverter new toRoman: 5) equals: 'V'
	! !

!TDDBabyStepsRomanNumeralsTest methodsFor: 'tests' stamp: 'valentino 5/15/2025 20:20:31'!
test0006

	self assert: (RomanConverter new toRoman: 6) equals: 'VI'
	! !

!TDDBabyStepsRomanNumeralsTest methodsFor: 'tests' stamp: 'valentino 5/15/2025 20:20:31'!
test0009

	self assert: (RomanConverter new toRoman: 9) equals: 'IX'
	! !

!TDDBabyStepsRomanNumeralsTest methodsFor: 'tests' stamp: 'valentino 5/15/2025 20:20:31'!
test0010

	self assert: (RomanConverter new toRoman: 10) equals: 'X'
	! !

!TDDBabyStepsRomanNumeralsTest methodsFor: 'tests' stamp: 'valentino 5/15/2025 20:20:31'!
test0011

	self assert: (RomanConverter new toRoman: 11) equals: 'XI'
	! !

!TDDBabyStepsRomanNumeralsTest methodsFor: 'tests' stamp: 'valentino 5/15/2025 20:20:31'!
test0014

	self assert: (RomanConverter new toRoman: 14) equals: 'XIV'
	! !

!TDDBabyStepsRomanNumeralsTest methodsFor: 'tests' stamp: 'valentino 5/15/2025 20:20:31'!
test0015

	self assert: (RomanConverter new toRoman: 15) equals: 'XV'
	! !

!TDDBabyStepsRomanNumeralsTest methodsFor: 'tests' stamp: 'valentino 5/15/2025 20:20:31'!
test0016

	self assert: (RomanConverter new toRoman: 16) equals: 'XVI'
	! !

!TDDBabyStepsRomanNumeralsTest methodsFor: 'tests' stamp: 'valentino 5/15/2025 20:20:31'!
test0019

	self assert: (RomanConverter new toRoman: 19) equals: 'XIX'
	! !

!TDDBabyStepsRomanNumeralsTest methodsFor: 'tests' stamp: 'valentino 5/15/2025 20:20:31'!
test0020To0029

	self assert: (RomanConverter new toRoman: 24) equals: 'XXIV'
	! !

!TDDBabyStepsRomanNumeralsTest methodsFor: 'tests' stamp: 'valentino 5/15/2025 20:20:31'!
test0030To0039

	self assert: (RomanConverter new toRoman: 37) equals: 'XXXVII'
	! !

!TDDBabyStepsRomanNumeralsTest methodsFor: 'tests' stamp: 'valentino 5/15/2025 20:20:31'!
test0040To0049

	self assert: (RomanConverter new toRoman: 44) equals: 'XLIV'
	! !

!TDDBabyStepsRomanNumeralsTest methodsFor: 'tests' stamp: 'valentino 5/15/2025 20:20:31'!
test0050To0059

	self assert: (RomanConverter new toRoman: 55) equals: 'LV'
	! !

!TDDBabyStepsRomanNumeralsTest methodsFor: 'tests' stamp: 'valentino 5/15/2025 20:20:31'!
test0060To0089

	self assert: (RomanConverter new toRoman: 69) equals: 'LXIX'
	! !

!TDDBabyStepsRomanNumeralsTest methodsFor: 'tests' stamp: 'valentino 5/15/2025 20:20:31'!
test0090To0099

	self assert: (RomanConverter new toRoman: 99) equals: 'XCIX'
	! !

!TDDBabyStepsRomanNumeralsTest methodsFor: 'tests' stamp: 'valentino 5/15/2025 20:20:31'!
test0100To0999

	self assert: (RomanConverter new toRoman: 494) equals: 'CDXCIV'
	! !

!TDDBabyStepsRomanNumeralsTest methodsFor: 'tests' stamp: 'valentino 5/15/2025 20:20:31'!
test1000To3999

	self assert: (RomanConverter new toRoman: 3499) equals: 'MMMCDXCIX'
	! !

!TDDBabyStepsRomanNumeralsTest methodsFor: 'tests' stamp: 'valentino 5/15/2025 20:20:31'!
testExtraToCheckGeneralizationOnKata

	self assert: (RomanConverter new toRoman: 7) equals: 'VII'.
	self assert: (RomanConverter new toRoman: 8) equals: 'VIII'.
	self assert: (RomanConverter new toRoman: 17) equals: 'XVII'.
	self assert: (RomanConverter new toRoman: 18) equals: 'XVIII'.
	self assert: (RomanConverter new toRoman: 20) equals: 'XX'.
	self assert: (RomanConverter new toRoman: 21) equals: 'XXI'.
	self assert: (RomanConverter new toRoman: 22) equals: 'XXII'.
	self assert: (RomanConverter new toRoman: 23) equals: 'XXIII'.
	self assert: (RomanConverter new toRoman: 25) equals: 'XXV'.
	self assert: (RomanConverter new toRoman: 26) equals: 'XXVI'.
	self assert: (RomanConverter new toRoman: 27) equals: 'XXVII'.
	self assert: (RomanConverter new toRoman: 28) equals: 'XXVIII'.
	self assert: (RomanConverter new toRoman: 29) equals: 'XXIX'.
	self assert: (RomanConverter new toRoman: 30) equals: 'XXX'.
	self assert: (RomanConverter new toRoman: 31) equals: 'XXXI'.
	self assert: (RomanConverter new toRoman: 32) equals: 'XXXII'.
	self assert: (RomanConverter new toRoman: 33) equals: 'XXXIII'.
	self assert: (RomanConverter new toRoman: 34) equals: 'XXXIV'.
	self assert: (RomanConverter new toRoman: 35) equals: 'XXXV'.
	self assert: (RomanConverter new toRoman: 36) equals: 'XXXVI'.
	self assert: (RomanConverter new toRoman: 38) equals: 'XXXVIII'.
	self assert: (RomanConverter new toRoman: 39) equals: 'XXXIX'.
	self assert: (RomanConverter new toRoman: 40) equals: 'XL'.
	self assert: (RomanConverter new toRoman: 41) equals: 'XLI'.
	self assert: (RomanConverter new toRoman: 42) equals: 'XLII'.
	self assert: (RomanConverter new toRoman: 43) equals: 'XLIII'.
	self assert: (RomanConverter new toRoman: 45) equals: 'XLV'.
	self assert: (RomanConverter new toRoman: 46) equals: 'XLVI'.
	self assert: (RomanConverter new toRoman: 47) equals: 'XLVII'.
	self assert: (RomanConverter new toRoman: 48) equals: 'XLVIII'.
	self assert: (RomanConverter new toRoman: 49) equals: 'XLIX'.
	self assert: (RomanConverter new toRoman: 50) equals: 'L'.
	self assert: (RomanConverter new toRoman: 51) equals: 'LI'.
	self assert: (RomanConverter new toRoman: 52) equals: 'LII'.
	self assert: (RomanConverter new toRoman: 53) equals: 'LIII'.
	self assert: (RomanConverter new toRoman: 54) equals: 'LIV'.
	self assert: (RomanConverter new toRoman: 56) equals: 'LVI'.
	self assert: (RomanConverter new toRoman: 57) equals: 'LVII'.
	self assert: (RomanConverter new toRoman: 58) equals: 'LVIII'.
	self assert: (RomanConverter new toRoman: 59) equals: 'LIX'.
	self assert: (RomanConverter new toRoman: 60) equals: 'LX'.
	self assert: (RomanConverter new toRoman: 64) equals: 'LXIV'.
	self assert: (RomanConverter new toRoman: 67) equals: 'LXVII'.
	self assert: (RomanConverter new toRoman: 72) equals: 'LXXII'.
	self assert: (RomanConverter new toRoman: 75) equals: 'LXXV'.
	self assert: (RomanConverter new toRoman: 78) equals: 'LXXVIII'.
	self assert: (RomanConverter new toRoman: 81) equals: 'LXXXI'.
	self assert: (RomanConverter new toRoman: 83) equals: 'LXXXIII'.
	self assert: (RomanConverter new toRoman: 86) equals: 'LXXXVI'.
	self assert: (RomanConverter new toRoman: 89) equals: 'LXXXIX'.
	self assert: (RomanConverter new toRoman: 90) equals: 'XC'.
	self assert: (RomanConverter new toRoman: 91) equals: 'XCI'.
	self assert: (RomanConverter new toRoman: 92) equals: 'XCII'.
	self assert: (RomanConverter new toRoman: 93) equals: 'XCIII'.
	self assert: (RomanConverter new toRoman: 94) equals: 'XCIV'.
	self assert: (RomanConverter new toRoman: 95) equals: 'XCV'.
	self assert: (RomanConverter new toRoman: 96) equals: 'XCVI'.
	self assert: (RomanConverter new toRoman: 97) equals: 'XCVII'.
	self assert: (RomanConverter new toRoman: 98) equals: 'XCVIII'.
	self assert: (RomanConverter new toRoman: 100) equals: 'C'.
	self assert: (RomanConverter new toRoman: 111) equals: 'CXI'.
	self assert: (RomanConverter new toRoman: 200) equals: 'CC'.
	self assert: (RomanConverter new toRoman: 222) equals: 'CCXXII'.
	self assert: (RomanConverter new toRoman: 300) equals: 'CCC'.
	self assert: (RomanConverter new toRoman: 333) equals: 'CCCXXXIII'.
	self assert: (RomanConverter new toRoman: 400) equals: 'CD'.
	self assert: (RomanConverter new toRoman: 444) equals: 'CDXLIV'.
	self assert: (RomanConverter new toRoman: 500) equals: 'D'.
	self assert: (RomanConverter new toRoman: 555) equals: 'DLV'.
	self assert: (RomanConverter new toRoman: 600) equals: 'DC'.
	self assert: (RomanConverter new toRoman: 666) equals: 'DCLXVI'.
	self assert: (RomanConverter new toRoman: 700) equals: 'DCC'.
	self assert: (RomanConverter new toRoman: 777) equals: 'DCCLXXVII'.
	self assert: (RomanConverter new toRoman: 800) equals: 'DCCC'.
	self assert: (RomanConverter new toRoman: 888) equals: 'DCCCLXXXVIII'.
	self assert: (RomanConverter new toRoman: 900) equals: 'CM'.
	self assert: (RomanConverter new toRoman: 999) equals: 'CMXCIX'.
	self assert: (RomanConverter new toRoman: 1000) equals: 'M'.
	self assert: (RomanConverter new toRoman: 1313) equals: 'MCCCXIII'.
	self assert: (RomanConverter new toRoman: 1624) equals: 'MDCXXIV'.
	self assert: (RomanConverter new toRoman: 1735) equals: 'MDCCXXXV'.
	self assert: (RomanConverter new toRoman: 2000) equals: 'MM'.
	self assert: (RomanConverter new toRoman: 2146) equals: 'MMCXLVI'.
	self assert: (RomanConverter new toRoman: 2557) equals: 'MMDLVII'.
	self assert: (RomanConverter new toRoman: 2968) equals: 'MMCMLXVIII'.
	self assert: (RomanConverter new toRoman: 3000) equals: 'MMM'.
	self assert: (RomanConverter new toRoman: 3279) equals: 'MMMCCLXXIX'.
	self assert: (RomanConverter new toRoman: 3749) equals: 'MMMDCCXLIX'.
	self assert: (RomanConverter new toRoman: 3999) equals: 'MMMCMXCIX'
	! !

!TDDBabyStepsRomanNumeralsTest methodsFor: 'tests' stamp: 'valentino 5/15/2025 20:20:31'!
testIsNumeric

	self should: [ RomanConverter new toRoman: 'treinta y tres' ] raise: Error withExceptionDo: [:error | self assert: error messageText equals: 'Arabig number must be numeric' ]
	! !

!TDDBabyStepsRomanNumeralsTest methodsFor: 'tests' stamp: 'valentino 5/15/2025 20:20:31'!
testLessThanOne
	
	self should: [ RomanConverter new toRoman: 0 ] raise: Error withExceptionDo: [:error | self assert: error messageText equals: 'Less than 1 numbers cannot be converted to romans' ] 
	! !

!TDDBabyStepsRomanNumeralsTest methodsFor: 'tests' stamp: 'valentino 5/15/2025 20:20:31'!
testMoreThan3999

	self should: [ RomanConverter new toRoman: 4000 ] raise: Error withExceptionDo: [:error | self assert: error messageText equals: 'Greater than 3999 numbers cannot be converted to romans' ]  
	! !


!classDefinition: #RomanConverter category: #TDDBabyStepsGameRomanNumerals!
Object subclass: #RomanConverter
	instanceVariableNames: 'number stream'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDBabyStepsGameRomanNumerals'!

!RomanConverter methodsFor: 'convertion' stamp: 'valentino 5/15/2025 19:40:44'!
addRoman: romanToBeAdded representsNumber: decimalNumber 
	
	 romanToBeAdded do: [:roman |  stream nextPut: roman].
	number := number - decimalNumber
	! !

!RomanConverter methodsFor: 'convertion' stamp: 'valentino 5/15/2025 20:20:16'!
checkNumberIsCorrect: aDecimalNumber
	
	self isInteger: aDecimalNumber.
	self isPositive: aDecimalNumber.
	self isLessThan3599: aDecimalNumber.! !

!RomanConverter methodsFor: 'convertion' stamp: 'valentino 5/15/2025 20:35:38'!
convertToRoman
	
	(number >= 1000) ifTrue: [self addRoman: 'M' representsNumber: 1000. self convertToRoman  ].
	(number >= 900) ifTrue: [self addRoman: 'CM' representsNumber: 900.self convertToRoman  ].
	(number >= 500) ifTrue: [self addRoman: 'D' representsNumber: 500.self convertToRoman  ].
	(number >= 400) ifTrue: [self addRoman: 'CD' representsNumber: 400.self convertToRoman ].
	(number >= 100) ifTrue: [self addRoman: 'C' representsNumber: 100. self convertToRoman ].
	(number >= 90) ifTrue: [self addRoman: 'XC' representsNumber: 90. self convertToRoman ].
	(number >= 50) ifTrue: [self addRoman: 'L' representsNumber: 50 .self convertToRoman].
	(number >= 40) ifTrue: [self addRoman: 'XL' representsNumber: 40.self convertToRoman ].
	(number  >= 10) ifTrue: [self addRoman: 'X' representsNumber: 10. self convertToRoman].
	(number = 9) ifTrue: [self addRoman: 'IX' representsNumber: 9 ].
	(number >= 5) ifTrue: [self addRoman: 'V' representsNumber: 5 ].
	(number = 4) ifTrue: [self addRoman: 'IV' representsNumber: 4 ].
	
	number timesRepeat: [self addRoman: 'I'  representsNumber: 1 ].
	
	
	

	
	
	^stream contents! !

!RomanConverter methodsFor: 'convertion' stamp: 'valentino 5/15/2025 20:18:30'!
isInteger: aDecimalNumber

	^ aDecimalNumber isInteger  ifFalse: [Error new signal: 'Arabig number must be numeric']! !

!RomanConverter methodsFor: 'convertion' stamp: 'valentino 5/15/2025 20:36:42'!
isLessThan3599: aDecimalNumber

	^ aDecimalNumber <= 3999 ifFalse: [Error new signal: 'Greater than 3999 numbers cannot be converted to romans']! !

!RomanConverter methodsFor: 'convertion' stamp: 'valentino 5/15/2025 20:18:59'!
isPositive: aDecimalNumber

	^ aDecimalNumber > 0  ifFalse: [Error new signal: 'Less than 1 numbers cannot be converted to romans']! !

!RomanConverter methodsFor: 'convertion' stamp: 'valentino 5/15/2025 20:20:16'!
toRoman: aDecimalNumber
	
	self checkNumberIsCorrect: aDecimalNumber.
	
	stream := String new writeStream.
	number := aDecimalNumber.
	
	^self convertToRoman 
! !
