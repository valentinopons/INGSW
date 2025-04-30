!classDefinition: #TestMyA category: #'2024-2C-Parcial-1'!
TestCase subclass: #TestMyA
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 03:49:05'!
test01UnMonstruoAtacaAUnAventureroUsandoSusPVs

	| guerrero |
	
	guerrero := self crearGuerrero.
	
	self crearGoblin atacarA: guerrero.
	
	self assert: (guerrero tienePuntosDeVida: 10 * pv - (5 * pv))! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:09:06'!
test02UnAventureroPuedeUsarItemsDeDefensaParaProtegerse

	| guerrero |
	
	guerrero := self crearGuerrero.
	guerrero equiparItemDeDefensa: self crearEscudoMagico.
	guerrero equiparItemDeDefensa: self crearArmadura.
	
	self crearOgro atacarA: guerrero.
	
	self assert: (guerrero tienePuntosDeVida: 10 * pv - (15 * pv - (5 * pv) - (3 * pv)))! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:08:35'!
test03LosItemsDeDefensaNoPuedenAumentarLosPuntosDeVidaDelAventurero

	| guerrero |
	
	guerrero := self crearGuerrero.
	guerrero equiparItemDeDefensa: self crearArmadura.
	guerrero equiparItemDeDefensa: self crearArmadura.
	
	self crearGoblin atacarA: guerrero.
	
	self assert: (guerrero tienePuntosDeVida: 10 * pv)! !

!TestMyA methodsFor: 'tests' stamp: 'HAW 9/27/2024 09:04:39'!
test04UnAventureroNoPuedeAtacarSinItemsEquipados

	| guerrero ogro espada |
	
	guerrero := self crearGuerrero.
	ogro := self crearOgro.
	espada := self crearEspadaPara: ogro.
	
	self should: [ guerrero atacarA: ogro con: (espada) ] 
		raise: Error-MessageNotUnderstood 
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: guerrero itemNoDisponibleMensajeDeError.
			self assert: (ogro tienePuntosDeVida: 15 * pv)
	]
	! !

!TestMyA methodsFor: 'tests' stamp: 'LL 9/27/2024 10:48:15'!
test05UnGuerreroConEspadaProvocaDañoSegunSuFuerza

	| guerrero ogro itemDeAtaque otroItemDeAtaque otroOgro |
	
	guerrero := self crearGuerrero.
	ogro := self crearOgro.
	itemDeAtaque := self crearEspadaPara: ogro.
	guerrero equiparItemDeAtaque: itemDeAtaque.
	otroOgro := self crearOgro.
	otroItemDeAtaque := self crearEspadaPara: otroOgro.
	guerrero equiparItemDeAtaque: otroItemDeAtaque.
	
	guerrero atacarA: ogro con: itemDeAtaque.
	guerrero atacarA: otroOgro con: otroItemDeAtaque.
	
	self assert: (ogro tienePuntosDeVida: 15 * pv - (4 * pv)).
	self assert: (otroOgro tienePuntosDeVida: 15 * pv - (4 * pv)).
	self assert: (guerrero tienePuntosDeVida: 10 * pv)! !

!TestMyA methodsFor: 'tests' stamp: 'HAW 9/27/2024 09:46:06'!
test06UnGuerreroConEspadaNoProvocaDañoAOtroMonstruoQueNoSeaElDeLaEspada

	| guerrero ogroNoObjetivoDeAtaque itemDeAtaque ogroObjetivoDeAtaque |
	
	guerrero := self crearGuerrero.
	ogroObjetivoDeAtaque := self crearOgro.
	itemDeAtaque := self crearEspadaPara: ogroObjetivoDeAtaque.
	guerrero equiparItemDeAtaque: itemDeAtaque.
	ogroNoObjetivoDeAtaque := self crearOgro.
	
	guerrero atacarA: ogroNoObjetivoDeAtaque con: itemDeAtaque.
	
	self assert: (ogroNoObjetivoDeAtaque tienePuntosDeVida: 15 * pv)! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:08:52'!
test07UnAventureroNoGuerreroPierdeTodosSusPuntosDeVidaSiUsaLaEspada

	| ogro mago itemDeAtaque |
	
	mago := self crearMago.
	ogro := self crearOgro.
	itemDeAtaque := self crearEspadaPara: ogro.
	mago equiparItemDeAtaque: itemDeAtaque.
	
	mago atacarA: ogro con: itemDeAtaque.
	
	self assert: (ogro tienePuntosDeVida: 15 * pv).
	self assert: (mago tienePuntosDeVida: 0)! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:08:49'!
test08ElMagoUsandoElBaculoMataAlGoblin

	| mago goblin itemDeAtaque |
	
	mago := self crearMago.
	itemDeAtaque := self crearBaculo.
	mago equiparItemDeAtaque: itemDeAtaque.
	goblin :=  self crearGoblin.
	
	mago atacarA: goblin con: itemDeAtaque.
	
	self assert: (goblin tienePuntosDeVida: 0)! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:42:13'!
test09ElMagoUsandoElBaculoDañaAOtrosMonstruosSegunSuFuerza

	| mago ogro itemDeAtaque |
	
	mago := self crearMago.
	itemDeAtaque := self crearBaculo.
	mago equiparItemDeAtaque: itemDeAtaque.
	ogro := self crearOgro.
	
	mago atacarA: ogro con: itemDeAtaque.
	
	self assert: (ogro tienePuntosDeVida: 15 * pv - (2 * pv))! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:08:45'!
test10UnAventureroNoMagoEsPenalizadoAlUsarElBaculoDuplicandoPVDeGoblins

	| guerrero goblin itemDeAtaque |
	
	guerrero := self crearGuerrero.
	itemDeAtaque := self crearBaculo.
	guerrero equiparItemDeAtaque: itemDeAtaque.
	goblin := self crearGoblin.
	
	guerrero atacarA: goblin con: itemDeAtaque.
	
	self assert: (goblin tienePuntosDeVida: 5 * pv * 2)! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:08:38'!
test11UnAventureroNoMagoUsandoElBaculoDañaSegunSuFuerzaAOtrosMonstruos

	| guerrero ogro itemDeAtaque |
	
	guerrero := self crearGuerrero.
	itemDeAtaque := self crearBaculo.
	guerrero equiparItemDeAtaque: itemDeAtaque.
	ogro := self crearOgro.
	
	guerrero atacarA: ogro con: itemDeAtaque.
	
	self assert: (ogro tienePuntosDeVida: 15 * pv - (4 * pv))! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:29:01'!
test12UnaEspadaNuncaPuedeSerUsadaEnMonstruosDeMenosDeUnMetro

	| goblin |
	
	goblin := self crearGoblin.
	
	self should: [ self crearEspadaPara: goblin ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException |
		self assert: anException messageText equals: Espada noSePuedeAtacarAMonstruoMenorAUnMetroDeAlturaMensajeDeError
	]
	! !


!TestMyA methodsFor: 'crear items' stamp: 'w 4/29/2025 20:57:36'!
crearArmadura

	^ItemDefensa inicializarArmadura ! !

!TestMyA methodsFor: 'crear items' stamp: 'NR 9/27/2024 05:35:28'!
crearBaculo
	
	self shouldBeImplemented ! !

!TestMyA methodsFor: 'crear items' stamp: 'w 4/29/2025 20:46:15'!
crearEscudoMagico

	^ItemDefensa inicializarEscudoMagico
! !

!TestMyA methodsFor: 'crear items' stamp: 'w 4/29/2025 21:03:21'!
crearEspadaPara: monstruo

	^ItemAtaque crearEspadaPara: monstruo
! !


!TestMyA methodsFor: 'crear combatientes' stamp: 'w 4/29/2025 20:27:44'!
crearGoblin

	^Monstruo inicializarGoblin 
! !

!TestMyA methodsFor: 'crear combatientes' stamp: 'w 4/29/2025 20:03:19'!
crearGuerrero
	
	^Aventurero  inicializarComoGuerrero! !

!TestMyA methodsFor: 'crear combatientes' stamp: 'NR 9/27/2024 05:35:52'!
crearMago

	self shouldBeImplemented 
! !

!TestMyA methodsFor: 'crear combatientes' stamp: 'w 4/29/2025 20:58:15'!
crearOgro

	^Monstruo inicializarOgro ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TestMyA class' category: #'2024-2C-Parcial-1'!
TestMyA class
	instanceVariableNames: ''!

!TestMyA class methodsFor: 'initialization' stamp: 'LL 9/26/2024 20:21:50'!
initialize

	Smalltalk at: #pv put: (BaseUnit named: 'pv' sign: 'pv')! !


!classDefinition: #Aventurero category: #'2024-2C-Parcial-1'!
Object subclass: #Aventurero
	instanceVariableNames: 'tipo vida fuerza inventario'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Aventurero methodsFor: 'as yet unclassified' stamp: 'w 4/29/2025 21:01:10'!
defensa
	^inventario sum: [:item | item defensa].! !

!Aventurero methodsFor: 'as yet unclassified' stamp: 'w 4/29/2025 20:54:11'!
inicializarComoGuerrero
	tipo := #Guerrero.
	fuerza := 4.
	vida := 10*pv.
	inventario := OrderedCollection new! !

!Aventurero methodsFor: 'as yet unclassified' stamp: 'w 4/29/2025 20:58:59'!
inicializarComoMago
	tipo := #Mago.
	fuerza := 2.
	vida := 15 * pv.
	inventario := OrderedCollection new.! !

!Aventurero methodsFor: 'as yet unclassified' stamp: 'w 4/29/2025 21:22:15'!
itemNoDisponibleMensajeDeError
	^'error no esta en el inventario'! !


!Aventurero methodsFor: 'defensa' stamp: 'w 4/29/2025 20:53:50'!
equiparItemDeDefensa: itemAAgregar
	
	inventario add: itemAAgregar ! !

!Aventurero methodsFor: 'defensa' stamp: 'w 4/29/2025 20:56:20'!
esAtacadoPorMonstruoConDaño: daño
	
	vida := vida - (0 * pv max: (daño) - self defensa).! !


!Aventurero methodsFor: 'accessing' stamp: 'w 4/29/2025 20:36:58'!
tienePuntosDeVida: posiblesPuntosDeVida
	
	^(vida) = posiblesPuntosDeVida ! !


!Aventurero methodsFor: 'accion' stamp: 'w 4/29/2025 21:21:45'!
atacarA: unMonstruo con: unItemDeAtaque
	
	(inventario detect: [:item | unItemDeAtaque = item]) ifFalse: [ Error new signal: self class    itemNoDisponibleMensajeDeError].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Aventurero class' category: #'2024-2C-Parcial-1'!
Aventurero class
	instanceVariableNames: ''!

!Aventurero class methodsFor: 'as yet unclassified' stamp: 'w 4/29/2025 20:04:01'!
inicializarComoGuerrero

	^Aventurero new inicializarComoGuerrero ! !

!Aventurero class methodsFor: 'as yet unclassified' stamp: 'w 4/29/2025 20:05:39'!
inicializarComoMago

	^Aventurero new inicializarComoMago ! !


!classDefinition: #ItemAtaque category: #'2024-2C-Parcial-1'!
Object subclass: #ItemAtaque
	instanceVariableNames: 'tipo objetivo'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!ItemAtaque methodsFor: 'as yet unclassified' stamp: 'w 4/29/2025 21:13:28'!
crearBaculo
	tipo := #Baculo.
! !

!ItemAtaque methodsFor: 'as yet unclassified' stamp: 'w 4/29/2025 21:09:16'!
crearEspadaPara: monstruo
	tipo := #Espada.
	objetivo := monstruo.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ItemAtaque class' category: #'2024-2C-Parcial-1'!
ItemAtaque class
	instanceVariableNames: ''!

!ItemAtaque class methodsFor: 'as yet unclassified' stamp: 'w 4/29/2025 21:13:45'!
crearBaculo
	
	^ItemAtaque new crearBaculo ! !

!ItemAtaque class methodsFor: 'as yet unclassified' stamp: 'w 4/29/2025 21:09:16'!
crearEspadaPara: monstruo
	
	^ItemAtaque new crearEspadaPara: monstruo! !


!classDefinition: #ItemDefensa category: #'2024-2C-Parcial-1'!
Object subclass: #ItemDefensa
	instanceVariableNames: 'tipo puntosDeDefensa'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!ItemDefensa methodsFor: 'as yet unclassified' stamp: 'w 4/29/2025 21:01:24'!
defensa
	^puntosDeDefensa ! !

!ItemDefensa methodsFor: 'as yet unclassified' stamp: 'w 4/29/2025 20:52:18'!
inicializarArmadura
	
	tipo := #Armadura.
	puntosDeDefensa := 5 * pv! !

!ItemDefensa methodsFor: 'as yet unclassified' stamp: 'w 4/29/2025 20:51:44'!
inicializarEscudoMagico
	
	tipo := #EscudoMagico.
	puntosDeDefensa := 3 * pv! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ItemDefensa class' category: #'2024-2C-Parcial-1'!
ItemDefensa class
	instanceVariableNames: ''!

!ItemDefensa class methodsFor: 'as yet unclassified' stamp: 'w 4/29/2025 20:52:34'!
inicializarArmadura
	^ItemDefensa new inicializarArmadura! !

!ItemDefensa class methodsFor: 'as yet unclassified' stamp: 'w 4/29/2025 20:46:39'!
inicializarEscudoMagico
	^ItemDefensa new inicializarEscudoMagico! !


!classDefinition: #Monstruo category: #'2024-2C-Parcial-1'!
Object subclass: #Monstruo
	instanceVariableNames: 'altura PV tipo'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Monstruo methodsFor: 'as yet unclassified' stamp: 'w 4/29/2025 20:58:47'!
inicializarGoblin
	tipo:= #Goblin.
	PV:= 5*pv.
	altura := 90 * centimeter ! !

!Monstruo methodsFor: 'as yet unclassified' stamp: 'w 4/29/2025 20:58:33'!
inicializarOgro
	tipo:= #Ogro.
	PV:= 15 * pv.
	altura :=  220 * centimeter! !


!Monstruo methodsFor: 'atacking' stamp: 'w 4/29/2025 20:16:25'!
atacarA: guerrero 
	
	guerrero esAtacadoPorMonstruoConDaño: self pv.! !


!Monstruo methodsFor: 'accessing' stamp: 'w 4/29/2025 20:16:42'!
pv
	^PV! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Monstruo class' category: #'2024-2C-Parcial-1'!
Monstruo class
	instanceVariableNames: ''!

!Monstruo class methodsFor: 'as yet unclassified' stamp: 'w 4/29/2025 20:07:39'!
inicializarGoblin

	^ Monstruo new inicializarGoblin! !

!Monstruo class methodsFor: 'as yet unclassified' stamp: 'w 4/29/2025 20:11:28'!
inicializarOgro

	^ Monstruo new inicializarOgro! !

TestMyA initialize!