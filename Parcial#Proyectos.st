!classDefinition: #Tests category: #'Parcial Proyectos'!
TestCase subclass: #Tests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial Proyectos'!

!Tests methodsFor: 'as yet unclassified' stamp: 'v 7/3/2025 00:48:11'!
crearEquipoAlanYJavier
	| alan equipo javier |
	alan := Desarrollador nombre: 'alan' trabaja: 4*(hour/day) salario: (20*(dollar/hour)).
	javier := Desarrollador nombre:'javier' trabaja:  2*(hour/day) salario: (20*(dollar/hour)).
	equipo := OrderedCollection with: alan with: javier.
	^equipo ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'v 7/3/2025 00:42:39'!
crearEquipoSoloIvan
	| ivan equipo |
	ivan := Desarrollador nombre: 'ivan' trabaja: 4*(hour/day) salario: (20*(dollar/hour)).
	
	equipo := OrderedCollection with: ivan.
	^equipo ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'v 7/2/2025 21:00:59'!
fechaSumandoDiasAPartirDeHoy: cantidadDiasASumar
	|fecha|
	fecha := DateAndTime today.
	fecha := fecha + (Duration days: cantidadDiasASumar/day).
	^fecha
! !


!classDefinition: #TestProyecto category: #'Parcial Proyectos'!
Tests subclass: #TestProyecto
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial Proyectos'!

!TestProyecto methodsFor: 'as yet unclassified' stamp: 'v 7/2/2025 23:07:29'!
test01SinTareasProduceError
	
	
	self should: [Proyecto crearCon: {}.] 
				raise: Error withMessageText: 				'No puede ser creado con tareas vacias'.
	 
! !

!TestProyecto methodsFor: 'as yet unclassified' stamp: 'v 7/2/2025 23:07:41'!
test02ProyectoConUnaTareaTerminaCuandoTerminaEsaTarea
	|tarea proyecto|
	tarea := Tarea llamada: 'web' inicia: DateAndTime today requiere: 8*hour 
					dependienteDe: {} responsablesTrabajan: (self crearEquipoSoloIvan ).
					
	proyecto := Proyecto crearCon: {tarea}.
	
	self assert: (proyecto termina: (self fechaSumandoDiasAPartirDeHoy: tarea numeroDeDiasQueRequiere ))! !

!TestProyecto methodsFor: 'as yet unclassified' stamp: 'v 7/2/2025 23:16:09'!
test03ProyectoConMasDeUnaTareaTerminaCuandoTerminaLaUltimaTarea
	|tarea1 tarea2 proyecto|
	tarea1 := Tarea llamada: 'web' inicia: DateAndTime today requiere: 8*hour 
					dependienteDe: {} responsablesTrabajan: (self crearEquipoSoloIvan ).
					
	tarea2 := Tarea llamada: 'web' inicia: DateAndTime today requiere: 16*hour 
					dependienteDe: {} responsablesTrabajan: (self crearEquipoSoloIvan ).
					
	proyecto := Proyecto crearCon: {tarea1. tarea2}.
	
	self assert: (proyecto termina: (self fechaSumandoDiasAPartirDeHoy: (tarea1 numeroDeDiasQueRequiere ) + (tarea2 numeroDeDiasQueRequiere)) )! !

!TestProyecto methodsFor: 'as yet unclassified' stamp: 'v 7/3/2025 00:06:20'!
test04ProyectoConUnSubproyectoTerminaCuandoTerminaElSubProyecto
	|tarea1 tarea2 proyecto subProyecto|
	tarea1 := Tarea llamada: 'web1' inicia: DateAndTime today requiere: 8*hour 
					dependienteDe: {} responsablesTrabajan: (self crearEquipoSoloIvan ).
					
	tarea2 := Tarea llamada: 'web' inicia: DateAndTime today requiere: 16*hour 
					dependienteDe: {} responsablesTrabajan: (self crearEquipoSoloIvan ).
	
					
	subProyecto := Proyecto crearCon: {tarea1. tarea2}.
	proyecto := Proyecto crearCon: {subProyecto }.

	
	self assert: (proyecto termina: (self fechaSumandoDiasAPartirDeHoy: subProyecto numeroDeDiasQueRequiere))! !

!TestProyecto methodsFor: 'as yet unclassified' stamp: 'v 7/3/2025 00:08:23'!
test05ProyectoConUnaTareaCuestaLoQueCuestaLaTarea
	|tarea1 proyecto |
	tarea1 := Tarea llamada: 'web1' inicia: DateAndTime today requiere: 8*hour 
					dependienteDe: {} responsablesTrabajan: (self crearEquipoSoloIvan ).
							
	proyecto := Proyecto crearCon: {tarea1}.
	
	self assert: proyecto costoTotal equals: tarea1 costoTotal ! !

!TestProyecto methodsFor: 'as yet unclassified' stamp: 'v 7/3/2025 00:19:20'!
test06ProyectoConMuchasTareasYProyectosCuestanLaSumaDeEsasTareasYProyectos
	|tarea1 tarea2 tarea3 proyecto subProyecto|
	
	tarea1 := Tarea llamada: 'web1' inicia: DateAndTime today requiere: 8*hour 
					dependienteDe: {} responsablesTrabajan: (self crearEquipoSoloIvan ).
					
	tarea2 := Tarea llamada: 'web2' inicia: DateAndTime today requiere: 16*hour 
					dependienteDe: {} responsablesTrabajan: (self crearEquipoSoloIvan ).
	tarea3 := Tarea llamada: 'web3' inicia: DateAndTime today requiere: 20*hour 
					dependienteDe: {} responsablesTrabajan: (self crearEquipoAlanYJavier ).
					
	subProyecto := Proyecto crearCon: {tarea1. tarea2}.
	proyecto := Proyecto crearCon: {subProyecto. tarea3 }.

	
	self assert: proyecto costoTotal equals: tarea1 costoTotal + (tarea2 costoTotal) + (tarea3 costoTotal)
	
	
	! !


!classDefinition: #TestTareas category: #'Parcial Proyectos'!
Tests subclass: #TestTareas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial Proyectos'!

!TestTareas methodsFor: 'as yet unclassified' stamp: 'v 7/2/2025 19:45:43'!
test01TareaQueTarda8HorasEnFinalizarseSeTerminaEnElDiaSiElTrabajadorTrabaja8HorasPorDia
	|tarea|
	tarea := Tarea llamada: 'web' inicia: DateAndTime today requiere: 4*hour dependienteDe: {} responsablesTrabajan: self crearEquipoSoloIvan .
	self assert: (tarea termina: DateAndTime today).! !

!TestTareas methodsFor: 'as yet unclassified' stamp: 'v 7/2/2025 19:45:43'!
test02TareaQueTarda8HorasEnFinalizarseSeTerminaEnDosDiasSiElTrabajadorTrabaja4HorasPorDia
	|tarea|
	tarea := Tarea llamada: 'web' inicia: DateAndTime today requiere: 8*hour dependienteDe: {} responsablesTrabajan: self crearEquipoSoloIvan.
	self deny: (tarea termina: DateAndTime today).
	self assert: (tarea termina: DateAndTime tomorrow).! !

!TestTareas methodsFor: 'as yet unclassified' stamp: 'v 7/2/2025 21:02:14'!
test03TareaQueTarda8HorasEnFinalizarseConUnEquipoTardaLoQueTardaElMasLentoDelEquipo
	|tarea equipo |
	equipo := self crearEquipoAlanYJavier .
	tarea := Tarea llamada: 'web' inicia: DateAndTime today requiere: 8*hour dependienteDe: {} responsablesTrabajan: equipo.
	self assert: (tarea termina: (self fechaSumandoDiasAPartirDeHoy: 3*day)).! !

!TestTareas methodsFor: 'as yet unclassified' stamp: 'v 7/2/2025 19:18:56'!
test04TareaCuestaEnTotalLasHorasQueLeLlevanASusDesarrolladores
	|tarea equipo |
	equipo := self crearEquipoAlanYJavier.
	
	tarea := Tarea llamada: 'web' inicia: DateAndTime today requiere: (8*hour) dependienteDe: {} responsablesTrabajan: 	equipo.
	self assert: tarea costoTotal equals: 360*dollar.! !

!TestTareas methodsFor: 'as yet unclassified' stamp: 'v 7/2/2025 19:21:22'!
test05TareaDebeTenerTrabajadoresAsignados
	
	self should:[Tarea llamada: 'web' inicia: DateAndTime today requiere: (8*hour) dependienteDe: {} responsablesTrabajan: 	{}]  raise: Error withMessageText: 'cant create task with no developers'.
	! !

!TestTareas methodsFor: 'as yet unclassified' stamp: 'v 7/2/2025 21:01:56'!
test06TareaNoPuedeTerminarSiDependeDeOtraTareaQueNoAFinalizado
	|tarea1 tarea2 equipo1 equipo2 |
	equipo1 := self crearEquipoAlanYJavier.
	equipo2 := self crearEquipoSoloIvan.
	
	tarea2  := Tarea llamada: 'backend' inicia: DateAndTime today requiere: (16*hour) dependienteDe: {} responsablesTrabajan: equipo2 .

	tarea1 := Tarea llamada: 'frontend' inicia: DateAndTime today requiere: (8*hour) dependienteDe: {tarea2} responsablesTrabajan: 	equipo1.
	
	self assert: (tarea2 termina: (self fechaSumandoDiasAPartirDeHoy: 3*day)).
	self assert: (tarea1 termina: (self fechaSumandoDiasAPartirDeHoy: 6*day)). 
! !


!classDefinition: #Desarrollador category: #'Parcial Proyectos'!
Object subclass: #Desarrollador
	instanceVariableNames: 'nombre jornada salario'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial Proyectos'!

!Desarrollador methodsFor: 'initialization' stamp: 'v 7/3/2025 00:46:16'!
jornada

	^jornada.! !

!Desarrollador methodsFor: 'initialization' stamp: 'v 7/3/2025 00:40:32'!
nombre: unNombre trabaja: cantidadHorasAlDia salario: unSalarioPorHora 
	
	nombre := unNombre.
	jornada := cantidadHorasAlDia.
	salario := unSalarioPorHora.! !

!Desarrollador methodsFor: 'initialization' stamp: 'v 7/1/2025 00:05:36'!
salario

	^salario.! !


!Desarrollador methodsFor: 'actions' stamp: 'v 7/3/2025 00:50:46'!
dolaresQueCobraTrabajando: dias 
	
	^salario * jornada * dias! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Desarrollador class' category: #'Parcial Proyectos'!
Desarrollador class
	instanceVariableNames: ''!

!Desarrollador class methodsFor: 'instance creation' stamp: 'v 7/3/2025 00:39:58'!
nombre: unNombre trabaja: cantidadHorasAlDia salario: unSalarioPorHora 
	
	^self new nombre: unNombre trabaja: cantidadHorasAlDia salario: unSalarioPorHora ! !


!classDefinition: #Evento category: #'Parcial Proyectos'!
Object subclass: #Evento
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial Proyectos'!

!Evento methodsFor: 'acertar' stamp: 'v 7/3/2025 00:03:48'!
numeroDeDiasQueRequiere

	self subclassResponsibility! !

!Evento methodsFor: 'acertar' stamp: 'v 7/3/2025 00:03:39'!
termina: unaPosibleFechaDeFinalizacion

	self subclassResponsibility! !


!Evento methodsFor: 'accion' stamp: 'v 7/3/2025 00:19:34'!
costoTotal

	self subclassResponsibility! !


!classDefinition: #Proyecto category: #'Parcial Proyectos'!
Evento subclass: #Proyecto
	instanceVariableNames: 'listaDeEventos'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial Proyectos'!

!Proyecto methodsFor: 'inicio' stamp: 'v 7/2/2025 23:59:44'!
crearCon: unaListaDeEventos 
	
	unaListaDeEventos ifEmpty: [self errorNoPuedeSerCreadoSinEventos].
	listaDeEventos := unaListaDeEventos
	! !

!Proyecto methodsFor: 'inicio' stamp: 'v 7/2/2025 23:59:44'!
errorNoPuedeSerCreadoSinEventos

	^ Error new signal:				'No puede ser creado con tareas vacias'! !


!Proyecto methodsFor: 'acertar' stamp: 'v 7/3/2025 00:01:57'!
calcularDiasQueTerminanSubEventos

	^ Duration days: (listaDeEventos sum:[:evento | evento numeroDeDiasQueRequiere/day] ifEmpty: [0])! !

!Proyecto methodsFor: 'acertar' stamp: 'v 7/3/2025 00:01:57'!
termina: unaPosibleFechaDeTerminacion
	|fechaDeTerminacion|
	fechaDeTerminacion := DateAndTime today.
	
	fechaDeTerminacion :=  fechaDeTerminacion + (self calcularDiasQueTerminanSubEventos).
	
	
	^fechaDeTerminacion = unaPosibleFechaDeTerminacion.
	
	
	
	 
	
	! !


!Proyecto methodsFor: 'accion' stamp: 'v 7/3/2025 00:18:47'!
costoTotal
	
	^listaDeEventos sum: [:evento | evento costoTotal] ifEmpty: [0*dollar]! !

!Proyecto methodsFor: 'accion' stamp: 'v 7/3/2025 00:04:53'!
numeroDeDiasQueRequiere
	
	
	^listaDeEventos sum: [:evento | evento numeroDeDiasQueRequiere] ifEmpty: [0*day].
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Proyecto class' category: #'Parcial Proyectos'!
Proyecto class
	instanceVariableNames: ''!

!Proyecto class methodsFor: 'instance creation' stamp: 'v 7/2/2025 20:44:31'!
crearCon: unaTarea 

	^self new crearCon: unaTarea ! !

!Proyecto class methodsFor: 'instance creation' stamp: 'v 7/2/2025 23:33:42'!
crearConTareas: unaListaDeTareas subProyectos: listaDeSubproyectos 

	^self new crearConTareas: unaListaDeTareas subProyectos: listaDeSubproyectos ! !


!Proyecto class methodsFor: 'as yet unclassified' stamp: 'v 7/2/2025 20:45:36'!
termina: aRenameMe1 
	self shouldBeImplemented.! !


!classDefinition: #Tarea category: #'Parcial Proyectos'!
Evento subclass: #Tarea
	instanceVariableNames: 'fechaInicio horasRequeridas equipo tareasDependientes'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial Proyectos'!

!Tarea methodsFor: 'inicio' stamp: 'v 7/2/2025 19:57:33'!
llamada: unNombre inicia: unaFecha requiere: horasDeTrabajo dependienteDe: tareasDeLasQueDepende responsableTrabaja: horasDeTrabajoDelResponsable 
	
	horasRequeridas := horasDeTrabajo.
	tareasDependientes := tareasDeLasQueDepende .
	equipo := horasDeTrabajoDelResponsable .
	fechaInicio := unaFecha.
	nombre := unNombre .
	
	! !


!Tarea methodsFor: 'acertar' stamp: 'v 7/3/2025 00:45:35'!
desarrolladorQueMenosTrabaja

	^ equipo  min: [:desarrollador | desarrollador jornada]! !

!Tarea methodsFor: 'acertar' stamp: 'v 7/2/2025 20:15:27'!
numeroDeDiasQueRequiere
	
	| diasQueRequiereTotales   |
	
	diasQueRequiereTotales := self numeroDeDiasQueRequiereSinDependencias.
	diasQueRequiereTotales  := diasQueRequiereTotales + (self numeroDeDiasQueRequierenDependencias).
	diasQueRequiereTotales < 0 ifTrue: [diasQueRequiereTotales := 0].
	^diasQueRequiereTotales ! !

!Tarea methodsFor: 'acertar' stamp: 'v 7/2/2025 20:07:57'!
numeroDeDiasQueRequiereSinDependencias
	
	^((horasRequeridas // (self desarrolladorQueMenosTrabaja) )) -(1*day).! !

!Tarea methodsFor: 'acertar' stamp: 'v 7/2/2025 20:14:11'!
numeroDeDiasQueRequierenDependencias
	|dias|
	dias := 0*day.
	tareasDependientes do: [:tarea | dias := (dias + (tarea numeroDeDiasQueRequiere))].
	^dias! !

!Tarea methodsFor: 'acertar' stamp: 'v 7/2/2025 19:31:03'!
termina: unaPosibleFechaDeFinalizacion
      |diasQueRequiere fechaFinal |
		
	diasQueRequiere := self numeroDeDiasQueRequiere.
	
	fechaFinal := (fechaInicio + (Duration days: diasQueRequiere/day)).
	
	^fechaFinal = unaPosibleFechaDeFinalizacion.
	! !


!Tarea methodsFor: 'actions' stamp: 'v 7/3/2025 00:50:08'!
costoTotal
	|costo dias  |
	costo := 0*dollar.
	dias :=  (self 		numeroDeDiasQueRequiere).
	
	equipo do: [:desarrollador |costo := costo + (desarrollador  dolaresQueCobraTrabajando: dias)].
	^costo! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Tarea class' category: #'Parcial Proyectos'!
Tarea class
	instanceVariableNames: ''!

!Tarea class methodsFor: 'instance creation' stamp: 'v 7/2/2025 19:24:42'!
errorEquipoVacio

	^ Error new signal: 'cant create task with no developers'! !

!Tarea class methodsFor: 'instance creation' stamp: 'v 7/2/2025 19:24:42'!
llamada: unNombre inicia: unaFecha requiere: horasDeTrabajo dependienteDe: tareasDeLasQueDepende responsablesTrabajan: unEquipoDeTrabajo 

	unEquipoDeTrabajo ifEmpty: [^self errorEquipoVacio].
	
	^self new llamada: unNombre inicia: unaFecha requiere:  horasDeTrabajo dependienteDe: tareasDeLasQueDepende responsableTrabaja: unEquipoDeTrabajo ! !
