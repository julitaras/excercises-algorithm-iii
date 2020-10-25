!classDefinition: #CintaAzulDeCarbon category: 'Factorio'!
DenotativeObject subclass: #CintaAzulDeCarbon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Factorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CintaAzulDeCarbon class' category: 'Factorio'!
CintaAzulDeCarbon class
	instanceVariableNames: 'menasATransportar destino'!

!CintaAzulDeCarbon class methodsFor: 'as yet unclassified' stamp: 'JT 10/25/2020 20:24:22'!
agregar: unaMena
	"Se encarga de agregar un tipo de mena recibida por paremetro a la cinta"
	menasATransportar add: unaMena.! !

!CintaAzulDeCarbon class methodsFor: 'as yet unclassified' stamp: 'JT 10/25/2020 20:23:49'!
cantidadDe: unaMenaDeMuestra
	"Devuelve la cantidad de menas de un tipo especificado por parametros que debe transportar la cinta"
	^menasATransportar count: [:unaMena | unaMena = unaMenaDeMuestra ].! !

!CintaAzulDeCarbon class methodsFor: 'as yet unclassified' stamp: 'JT 10/25/2020 20:23:18'!
cantidadDeMenas
	"Devuelve la cantidad de menas a transportar de la cinta"
	^menasATransportar size.! !

!CintaAzulDeCarbon class methodsFor: 'as yet unclassified' stamp: 'JT 10/25/2020 20:22:51'!
conectarA: unDestino
	"Se encarga de conectar la cinta a un destino que es recibido por parametros"
	destino := unDestino.! !

!CintaAzulDeCarbon class methodsFor: 'as yet unclassified' stamp: 'JT 10/25/2020 20:14:49'!
depositar
	"Se encarga de depositar en un destino las menas que transporta y deja vacia la cinta"
	destino agregar: menasATransportar.
	self vaciar.
! !

!CintaAzulDeCarbon class methodsFor: 'as yet unclassified' stamp: 'JT 10/25/2020 20:36:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	menasATransportar := ((OrderedCollection new)).
	destino := Contenedor.! !

!CintaAzulDeCarbon class methodsFor: 'as yet unclassified' stamp: 'JT 10/25/2020 20:22:16'!
vaciar
	"Se encarga de vaciar la cinta"
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

!Contenedor class methodsFor: 'as yet unclassified' stamp: 'JT 10/25/2020 20:05:03'!
agregar: menasRecibidas
	contenido addAll: menasRecibidas.! !

!Contenedor class methodsFor: 'as yet unclassified' stamp: 'SF 10/23/2020 00:38:00'!
cantidadDe: unaMenaDeMuestra
	^contenido count: [:unaMena | unaMena = unaMenaDeMuestra ].! !

!Contenedor class methodsFor: 'as yet unclassified' stamp: 'SF 10/23/2020 00:38:20'!
cantidadDeMenas
	^contenido size.! !

!Contenedor class methodsFor: 'as yet unclassified' stamp: 'JT 10/25/2020 20:36:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	contenido := ((OrderedCollection new) add: #carbon; yourself).! !

!Contenedor class methodsFor: 'as yet unclassified' stamp: 'SF 10/23/2020 00:35:51'!
vaciar
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

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 10/23/2020 00:33:23'!
conectarA: unDestino
	destino := unDestino.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'JT 10/25/2020 19:51:20'!
extraer
	destino agregar: #carbon.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'JT 10/25/2020 20:36:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	destino := CintaAzulDeCarbon.! !


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

!FactorioTest class methodsFor: 'escenario 1' stamp: 'SF 10/23/2020 01:01:45'!
configurarCircuitoExtractorCaja.

	Contenedor vaciar.
	ExtractorDeCarbon conectarA: Contenedor.	
! !

!FactorioTest class methodsFor: 'escenario 1' stamp: 'SF 10/23/2020 00:55:32'!
hacerAndarCircuitoExtractorCaja

	ExtractorDeCarbon extraer.
	! !

!FactorioTest class methodsFor: 'escenario 1' stamp: 'SF 10/23/2020 00:53:55'!
test01ExtractorCaja
	self configurarCircuitoExtractorCaja.
	
	self hacerAndarCircuitoExtractorCaja.
	
	Assert that: (Contenedor cantidadDe: #carbon) isEqualTo: 1.
	Assert that: Contenedor cantidadDeMenas isEqualTo: 1.! !


!FactorioTest class methodsFor: 'escenario 2' stamp: 'JT 10/25/2020 20:15:49'!
configurarCircuitoExtractorCintaCaja

	Contenedor vaciar.
	CintaAzulDeCarbon vaciar.
	"No se olviden de vaciar la cinta tambien!!"
	"Conectamos el extractor a la cinta, luego conectamos la cinta a la caja"
	ExtractorDeCarbon conectarA: CintaAzulDeCarbon.
	CintaAzulDeCarbon conectarA: Contenedor.
! !

!FactorioTest class methodsFor: 'escenario 2' stamp: 'JT 10/25/2020 20:16:12'!
hacerAndarCircuitoExtractorCintaCaja

	"Hacemos andar el extractor, asi deja un carbon en la cinta.
	Luego hacemos andar la cinta (con algun mensaje) y deberia dejar el carbon en la caja.	"
	ExtractorDeCarbon extraer.
	CintaAzulDeCarbon depositar.! !

!FactorioTest class methodsFor: 'escenario 2' stamp: 'JT 10/25/2020 20:20:16'!
test02ExtractorCintaCaja
	self configurarCircuitoExtractorCintaCaja.
	
	self hacerAndarCircuitoExtractorCintaCaja.
	
	Assert that: (Contenedor cantidadDe: #carbon) isEqualTo: 1.
	Assert that: Contenedor cantidadDeMenas isEqualTo: 1.
	
	"Tambien tenemos que chequear que en la cinta no haya nada. Cero carbon."
	Assert that: CintaAzulDeCarbon cantidadDeMenas isEqualTo: 0.
	Assert that: (CintaAzulDeCarbon cantidadDe: #carbon) isEqualTo: 0.! !


!FactorioTest class methodsFor: 'escenario 3' stamp: 'SF 10/23/2020 01:01:20'!
configurarCircuitoExtractorExtractorCintaCintaCaja

	Contenedor vaciar.
	"Además de vaciar el Contenedor (arriba) también vaciamos las dos cintas"
	"Conectamos el extractor de carbon a una de las cintas"
	"Conectamos el extractor de hierro a la otra cinta"
	"Ahora conectamos la primer cinta al Contenedor"
	"Y conectamos la segunda cinta a la primer cinta"
	
! !

!FactorioTest class methodsFor: 'escenario 3' stamp: 'SF 10/23/2020 01:02:57'!
hacerAndarCircuitoExtractorExtractorCintaCintaCaja
	
	"Hacemos andar el extractor, asi deja un carbon en la cinta.
	Lo mismo con el otro extractor, asi deja una mena de hierro en la otra cinta.
	Hacemos andar la cinta con la mena de hierro, asi la deposita en la cinta que tiene el carbon.
	Ahora podemos hacer andar la ultima cinta, la que recibió primero el carbon 
	y ahora tambien tiene el hierro y que deje todo en el Contenedor."! !

!FactorioTest class methodsFor: 'escenario 3' stamp: 'SF 10/23/2020 01:03:37'!
test03ExtractorExtractorCintaCintaCaja
	self configurarCircuitoExtractorExtractorCintaCintaCaja.
	
	self hacerAndarCircuitoExtractorExtractorCintaCintaCaja.
	
	Assert that: (Contenedor cantidadDe: #carbon) isEqualTo: 1.
	Assert that: (Contenedor cantidadDe: #hierro) isEqualTo: 1.
	Assert that: Contenedor cantidadDeMenas isEqualTo: 2.
	"Tambien tenemos que chequear que no haya nada en las cintas"! !

CintaAzulDeCarbon initializeAfterFileIn!
Contenedor initializeAfterFileIn!
ExtractorDeCarbon initializeAfterFileIn!