!classDefinition: #Desarrollador category: #'Parcial Proyectos'!
Object subclass: #Desarrollador
	instanceVariableNames: 'nombre horario salario'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial Proyectos'!

!Desarrollador methodsFor: 'initialization' stamp: 'v 6/30/2025 23:41:44'!
initializeLlamado: unNombre horario: unHorario salario: unSalario 
	
	nombre := unNombre.
	horario := unHorario.
	salario := unSalario.! !

!Desarrollador methodsFor: 'initialization' stamp: 'v 7/1/2025 00:05:36'!
salario

	^salario.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Desarrollador class' category: #'Parcial Proyectos'!
Desarrollador class
	instanceVariableNames: ''!

!Desarrollador class methodsFor: 'instance creation' stamp: 'v 6/30/2025 23:41:28'!
llamado: unNombre horario: unHorario salario: unSalario 
	
	^self new initializeLlamado: unNombre horario: unHorario salario: unSalario ! !


!classDefinition: #Tarea category: #'Parcial Proyectos'!
Object subclass: #Tarea
	instanceVariableNames: 'fechaInicio horasRequeridas horariosTrabajadores nombre'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial Proyectos'!

!Tarea methodsFor: 'inicio' stamp: 'v 6/30/2025 21:36:39'!
llamada: unNombre inicia: unaFecha requiere: horasDeTrabajo dependienteDe: tareasDeLasQueDepende responsableTrabaja: horasDeTrabajoDelResponsable 
	
	horasRequeridas := horasDeTrabajo.
	horariosTrabajadores := horasDeTrabajoDelResponsable .
	fechaInicio := unaFecha.
	nombre := unNombre .
	
	! !


!Tarea methodsFor: 'acertar' stamp: 'v 7/1/2025 00:04:41'!
numeroDeDiasQueRequiero
	
	| diasQueRequiere trabajadorMasVago |
	
	trabajadorMasVago := horariosTrabajadores  min: [:desarrollador | desarrollador salario].
	
	diasQueRequiere := ((horasRequeridas // trabajadorMasVago )) -1.
	diasQueRequiere < 0 ifTrue: [diasQueRequiere := 0].
	^diasQueRequiere ! !

!Tarea methodsFor: 'acertar' stamp: 'v 7/1/2025 00:01:11'!
termina: unaPosibleFechaDeFinalizacion
      |diasQueRequiere fechaFinal |
		
	diasQueRequiere := self numeroDeDiasQueRequiero.
	
	fechaFinal := (fechaInicio + (Duration days: diasQueRequiere)).
	
	^fechaFinal = unaPosibleFechaDeFinalizacion.
	! !


!Tarea methodsFor: 'actions' stamp: 'v 6/30/2025 23:44:07'!
costoTotal
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Tarea class' category: #'Parcial Proyectos'!
Tarea class
	instanceVariableNames: ''!

!Tarea class methodsFor: 'instance creation' stamp: 'v 6/30/2025 21:36:02'!
llamada: unNombre inicia: unaFecha requiere: horasDeTrabajo dependienteDe: tareasDeLasQueDepende responsablesTrabajan: horasDeTrabajoDelResponsable 

	^self new llamada: unNombre inicia: unaFecha requiere:  horasDeTrabajo dependienteDe: tareasDeLasQueDepende responsableTrabaja: horasDeTrabajoDelResponsable ! !


!classDefinition: #TestTareas category: #'Parcial Proyectos'!
TestCase subclass: #TestTareas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial Proyectos'!

!TestTareas methodsFor: 'as yet unclassified' stamp: 'v 6/30/2025 21:38:52'!
test01TareaQueTarda8HorasEnFinalizarseSeTerminaEnElDiaSiElTrabajadorTrabaja8HorasPorDia
	|tarea|
	tarea := Tarea llamada: 'web' inicia: DateAndTime today requiere: 8 dependienteDe: {} responsablesTrabajan: #(8).
	self assert: (tarea termina: DateAndTime today).! !

!TestTareas methodsFor: 'as yet unclassified' stamp: 'v 6/30/2025 21:38:41'!
test02TareaQueTarda8HorasEnFinalizarseSeTerminaEnDosDiasSiElTrabajadorTrabaja4HorasPorDia
	|tarea|
	tarea := Tarea llamada: 'web' inicia: DateAndTime today requiere: 8 dependienteDe: {} responsablesTrabajan: #(4).
	self deny: (tarea termina: DateAndTime today).
	self assert: (tarea termina: DateAndTime tomorrow).! !

!TestTareas methodsFor: 'as yet unclassified' stamp: 'v 6/30/2025 21:40:55'!
test03TareaQueTarda8HorasEnFinalizarseConUnEquipoTardaLoQueTardaElMasLentoDelEquipo
	|tarea|
	tarea := Tarea llamada: 'web' inicia: DateAndTime today requiere: 8 dependienteDe: {} responsablesTrabajan: #(4  2).
	self assert: (tarea termina: DateAndTime today + (Duration days: 3)).! !

!TestTareas methodsFor: 'as yet unclassified' stamp: 'v 6/30/2025 23:43:32'!
test04TareaCuestaEnTotalLasHorasQueLeLlevanASusDesarrolladores
	|tarea alan|
	alan := Desarrollador llamado: 'alan' horario: 6*hour/day salario: 30*dollar.
	tarea := Tarea llamada: 'web' inicia: DateAndTime today requiere: 8 dependienteDe: {} responsablesTrabajan: {alan}.
	self assert: tarea costoTotal equals: 60*dollar.! !
