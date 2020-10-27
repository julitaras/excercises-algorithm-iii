!classDefinition: #CintaAzul category: 'Factorio'!
DenotativeObject subclass: #CintaAzul
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Factorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CintaAzul class' category: 'Factorio'!
CintaAzul class
	instanceVariableNames: 'menasATransportar destino'!

!CintaAzul class methodsFor: 'as yet unclassified' stamp: 'CZ 10/27/2020 01:19:54'!
agregar: menasExtraidas
	"Se encarga de agregar a la cinta un conjunto de menas recibido por paremetros."
	menasATransportar addAll: menasExtraidas.! !

!CintaAzul class methodsFor: 'as yet unclassified' stamp: 'CZ 10/27/2020 01:20:01'!
cantidadDe: unaMenaDeMuestra
	"Devuelve la cantidad de menas, de un tipo especificado por parametros, que debe transportar la cinta."
	^menasATransportar count: [:unaMena | unaMena = unaMenaDeMuestra ].! !

!CintaAzul class methodsFor: 'as yet unclassified' stamp: 'CZ 10/27/2020 01:20:12'!
cantidadDeMenas
	"Devuelve la cantidad de menas a transportar por la cinta."
	^menasATransportar size.! !

!CintaAzul class methodsFor: 'as yet unclassified' stamp: 'CZ 10/27/2020 01:20:18'!
conectarA: unDestino
	"Se encarga de conectar la cinta a un destino que es recibido por parametros."
	destino := unDestino.! !

!CintaAzul class methodsFor: 'as yet unclassified' stamp: 'CZ 10/27/2020 01:25:40'!
depositar
	"Se encarga de depositar las menas que transporta en un destino preestablecido y deja vacia la cinta."
	destino agregar: menasATransportar.
	self vaciar.
! !

!CintaAzul class methodsFor: 'as yet unclassified' stamp: 'CZ 10/27/2020 01:29:50'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	menasATransportar := ((OrderedCollection new)).
	destino := Contenedor.! !

!CintaAzul class methodsFor: 'as yet unclassified' stamp: 'CZ 10/27/2020 01:20:37'!
vaciar
	"Se encarga de vaciar la cinta."
	menasATransportar := OrderedCollection new.! !


!classDefinition: #CintaRoja category: 'Factorio'!
DenotativeObject subclass: #CintaRoja
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Factorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CintaRoja class' category: 'Factorio'!
CintaRoja class
	instanceVariableNames: 'menasATransportar destino'!

!CintaRoja class methodsFor: 'as yet unclassified' stamp: 'CZ 10/27/2020 01:20:50'!
agregar: menasExtraidas
	"Se encarga de agregar a la cinta un conjunto de menas recibido por paremetros."
	menasATransportar addAll: menasExtraidas.! !

!CintaRoja class methodsFor: 'as yet unclassified' stamp: 'CZ 10/27/2020 01:20:56'!
cantidadDe: unaMenaDeMuestra
	"Devuelve la cantidad de menas, de un tipo especificado por parametros, que debe transportar la cinta."
	^menasATransportar count: [:unaMena | unaMena = unaMenaDeMuestra ].! !

!CintaRoja class methodsFor: 'as yet unclassified' stamp: 'CZ 10/27/2020 01:21:03'!
cantidadDeMenas
	"Devuelve la cantidad de menas a transportar por la cinta."
	^menasATransportar size.! !

!CintaRoja class methodsFor: 'as yet unclassified' stamp: 'CZ 10/27/2020 01:21:10'!
conectarA: unDestino
	"Se encarga de conectar la cinta a un destino que es recibido por parametros."
	destino := unDestino.! !

!CintaRoja class methodsFor: 'as yet unclassified' stamp: 'CZ 10/27/2020 01:26:44'!
depositar
	"Se encarga de depositar las menas que transporta en un destino preestablecido y deja vacia la cinta."
	destino agregar: menasATransportar.
	self vaciar.
! !

!CintaRoja class methodsFor: 'as yet unclassified' stamp: 'CZ 10/27/2020 01:29:50'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	menasATransportar := ((OrderedCollection new)).
	destino := CintaAzul.! !

!CintaRoja class methodsFor: 'as yet unclassified' stamp: 'CZ 10/27/2020 01:21:20'!
vaciar
	"Se encarga de vaciar la cinta."
	menasATransportar := OrderedCollection new.! !


!classDefinition: #Contenedor category: 'Factorio'!
DenotativeObject subclass: #Contenedor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Factorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Contenedor class' category: 'Factorio'!
Contenedor class
	instanceVariableNames: 'contenido'!

!Contenedor class methodsFor: 'as yet unclassified' stamp: 'CZ 10/27/2020 01:21:28'!
agregar: menasRecibidas
	"Se encarga de agregar a la cinta un conjunto de menas recibido por paremetros."
	contenido addAll: menasRecibidas.! !

!Contenedor class methodsFor: 'as yet unclassified' stamp: 'CZ 10/27/2020 01:21:34'!
cantidadDe: unaMenaDeMuestra
	"Devuelve la cantidad de menas, de un tipo especificado por parametros, que posee el contenedor."
	^contenido count: [:unaMena | unaMena = unaMenaDeMuestra ].! !

!Contenedor class methodsFor: 'as yet unclassified' stamp: 'CZ 10/27/2020 01:21:38'!
cantidadDeMenas
	"Devuelve la cantidad de menas que posee el contenedor."
	^contenido size.! !

!Contenedor class methodsFor: 'as yet unclassified' stamp: 'CZ 10/27/2020 01:29:50'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	contenido := ((OrderedCollection new) add: #carbon; add: #hierro; yourself).! !

!Contenedor class methodsFor: 'as yet unclassified' stamp: 'CZ 10/27/2020 01:21:43'!
vaciar
	"Se encarga de vaciar el contenedor."
	contenido := OrderedCollection new.! !


!classDefinition: #ExtractorDeCarbon category: 'Factorio'!
DenotativeObject subclass: #ExtractorDeCarbon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Factorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ExtractorDeCarbon class' category: 'Factorio'!
ExtractorDeCarbon class
	instanceVariableNames: 'destino'!

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'CZ 10/27/2020 01:28:23'!
conectarA: unDestino
	"Conecta al extractor con un destino recibido por parametros."
	destino := unDestino.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'CZ 10/27/2020 01:29:00'!
extraer
	"Extrae una mena de carbon y la guarda en la coleccion menaDeCarbonExtraida para luego agregarla a un destino preestablecido."
	|menaDeCarbonExtraida|
	menaDeCarbonExtraida := OrderedCollection new.
	menaDeCarbonExtraida add: #carbon.
	destino agregar: menaDeCarbonExtraida.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'CZ 10/27/2020 01:29:51'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	destino := CintaAzul.! !


!classDefinition: #ExtractorDeHierro category: 'Factorio'!
DenotativeObject subclass: #ExtractorDeHierro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Factorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ExtractorDeHierro class' category: 'Factorio'!
ExtractorDeHierro class
	instanceVariableNames: 'destino'!

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'CZ 10/27/2020 01:27:57'!
conectarA: unDestino
	"Conecta al extractor con un destino recibido por parametros."
	destino := unDestino.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'CZ 10/27/2020 01:23:10'!
extraer
	"Extrae una mena de hierro y la guarda en la coleccion menaDeHierroExtraida para luego agregarla a un destino preestablecido."
	|menaDeHierroExtraida|
	menaDeHierroExtraida := OrderedCollection new.
	menaDeHierroExtraida add: #hierro.
	destino agregar: menaDeHierroExtraida.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'CZ 10/27/2020 01:29:51'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	destino := CintaRoja.! !


!classDefinition: #FactorioTest category: 'Factorio'!
DenotativeObject subclass: #FactorioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Factorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FactorioTest class' category: 'Factorio'!
FactorioTest class
	instanceVariableNames: ''!

!FactorioTest class methodsFor: 'escenario 1' stamp: 'CZ 10/27/2020 01:17:45'!
configurarCircuitoExtractorCaja.
	"Vaciamos el Contenedor y luego conectamos el ExtractorDeCarbon al Contenedor."
	Contenedor vaciar.
	ExtractorDeCarbon conectarA: Contenedor.	
! !

!FactorioTest class methodsFor: 'escenario 1' stamp: 'CZ 10/27/2020 01:11:26'!
hacerAndarCircuitoExtractorCaja
	"Hacemos andar el ExtractorDeCarbon, asi deja un carbon en la CintaAzul."
	ExtractorDeCarbon extraer.
	! !

!FactorioTest class methodsFor: 'escenario 1' stamp: 'CZ 10/27/2020 01:17:59'!
test01ExtractorCaja
	self configurarCircuitoExtractorCaja.	
	self hacerAndarCircuitoExtractorCaja.
	
	"Chequeamos que luego de hacer andar el circuito, el Contenedor posea la cantidad de menas esperadas (de carbon, y en total)."
	Assert that: (Contenedor cantidadDe: #carbon) isEqualTo: 1.
	Assert that: Contenedor cantidadDeMenas isEqualTo: 1.! !


!FactorioTest class methodsFor: 'escenario 2' stamp: 'CZ 10/27/2020 01:13:22'!
configurarCircuitoExtractorCintaCaja
	"Vaciamos el Contenedor y la CintaAzul."
	Contenedor vaciar.
	CintaAzul vaciar.
	
	"Conectamos el ExtractorDeCarbon a la CintaAzul, y luego conectamos la CintaAzul al Contenedor."
	ExtractorDeCarbon conectarA: CintaAzul.
	CintaAzul conectarA: Contenedor.
! !

!FactorioTest class methodsFor: 'escenario 2' stamp: 'CZ 10/27/2020 01:14:11'!
hacerAndarCircuitoExtractorCintaCaja
	"Hacemos andar el ExtractorDeCarbon, asi deja un carbon en la CintaAzul.
	Luego hacemos andar la CintaAzul y deberia dejar el carbon en el Contenedor.	"
	ExtractorDeCarbon extraer.
	CintaAzul depositar. ! !

!FactorioTest class methodsFor: 'escenario 2' stamp: 'CZ 10/27/2020 01:14:46'!
test02ExtractorCintaCaja
	self configurarCircuitoExtractorCintaCaja.
	self hacerAndarCircuitoExtractorCintaCaja.
	
	"Chequeamos que la CintaAzul haya transportado 1 mena de carbon del ExtractorDeCarbon al Contenedor."
	Assert that: (Contenedor cantidadDe: #carbon) isEqualTo: 1.
	Assert that: Contenedor cantidadDeMenas isEqualTo: 1.
	
	"Tambien tenemos que chequear que en la CintaAzul no haya nada. Cero carbon."
	Assert that: (CintaAzul cantidadDe: #carbon) isEqualTo: 0.
	Assert that: CintaAzul cantidadDeMenas isEqualTo: 0.! !


!FactorioTest class methodsFor: 'escenario 3' stamp: 'CZ 10/27/2020 01:18:49'!
configurarCircuitoExtractorExtractorCintaCintaCaja
	Contenedor vaciar.
	
	"Además de vaciar el Contenedor (arriba), también vaciamos las dos cintas."
	CintaAzul vaciar.
	CintaRoja vaciar.
	
	"Conectamos el ExtractorDeCarbon a una de las cintas."
	ExtractorDeCarbon conectarA: CintaAzul.
	
	"Conectamos el ExtractorDeHierro a la otra cinta."
	ExtractorDeHierro conectarA: CintaRoja.
	
	"Ahora conectamos la primer cinta al Contenedor."
	CintaAzul conectarA: Contenedor.
	
	"Y conectamos la segunda cinta a la primer cinta."
	CintaRoja conectarA: CintaAzul.
	
! !

!FactorioTest class methodsFor: 'escenario 3' stamp: 'CZ 10/27/2020 01:16:37'!
hacerAndarCircuitoExtractorExtractorCintaCintaCaja
	
	"Hacemos andar el extractor, asi deja un carbon en la CintaAzul."
	ExtractorDeCarbon extraer.
	
	"Lo mismo (que arriba) pero con el otro extractor, asi deja una mena de hierro en la CintaRoja."
	ExtractorDeHierro extraer.
	
	"Hacemos andar la cinta con la mena de hierro, asi la deposita en la cinta que tiene el carbon."
	CintaRoja depositar.
	
	"Ahora podemos hacer andar la ultima cinta, la que recibió primero el carbon y que ahora tambien tiene el hierro, y que deje todo en el Contenedor."
	CintaAzul depositar.
! !

!FactorioTest class methodsFor: 'escenario 3' stamp: 'CZ 10/27/2020 01:16:50'!
test03ExtractorExtractorCintaCintaCaja
	self configurarCircuitoExtractorExtractorCintaCintaCaja.
	self hacerAndarCircuitoExtractorExtractorCintaCintaCaja.
	
	"Chequeamos que luego de hacer andar el circuito, el Contenedor posea la cantidad de menas esperadas (de carbon, de hierro, y en total)."
	Assert that: (Contenedor cantidadDe: #carbon) isEqualTo: 1.
	Assert that: (Contenedor cantidadDe: #hierro) isEqualTo: 1.
	Assert that: Contenedor cantidadDeMenas isEqualTo: 2.
	
	"Tambien tenemos que chequear que no haya nada en las cintas."
	Assert that: CintaAzul cantidadDeMenas isEqualTo: 0.
	Assert that: CintaRoja cantidadDeMenas isEqualTo: 0.! !

CintaAzul initializeAfterFileIn!
CintaRoja initializeAfterFileIn!
Contenedor initializeAfterFileIn!
ExtractorDeCarbon initializeAfterFileIn!
ExtractorDeHierro initializeAfterFileIn!