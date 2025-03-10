//
//  Tab.swift
//  PropertyWrappersProject
//
//  Created by Alvaro Guerra Freitas on 6/3/25.
//

import SwiftUI

indirect enum Tab: CaseIterable, Hashable {
    static var allCases: [Tab] = [
        .state,
        .binding,
        .stateObject([.stateObjectObservableObject,.stateObservable]),
        .observedObject([.observedObjectObservableObject, .varObservable, .bindableObservable])
    ]
    
    case state
    case binding
    case stateObject([Tab])
    case stateObjectObservableObject
    case stateObservable
    case observedObject([Tab])
    case observedObjectObservableObject
    case varObservable
    case bindableObservable
    
    var title: String {
        switch self {
        case .state: return "@State"
        case .binding: return "@Binding"
        case .stateObject: return "@StateObject"
        case .stateObjectObservableObject: return "< iOS17"
        case .stateObservable: return "iOS17 +"
        case .observedObject: return "@ObservedObject"
        case .observedObjectObservableObject: return "ObservedObject + ObservableObject"
        case .varObservable: return "var + Observable"
        case .bindableObservable: return "Bindable + Observable"
        }
    }
    
    var subtitle: String {
        switch self {
        case .state: return "Gestiona el **estado local** de una vista"
        case .binding: return "Crea una **referencia bidireccional** a un estado"
        case .stateObject: return "Compara el manejo de **objetos observables**"
        case .stateObjectObservableObject: return "Comparación entre **@State y ObservableObject**"
        case .stateObservable: return "Cómo combinar **@State** con objetos observables"
        case .observedObject: return "Observa cambios en **objetos externos**"
        case .observedObjectObservableObject: return "**@ObservedObject** con **ObservableObject**"
        case .varObservable: return "Uso de **var** con **Observable**"
        case .bindableObservable: return "**Bindable** combinado con **Observable**"
        }
    }
    
    var theme: TabTheme {
        switch self {
        case .state:
            return TabTheme(
                primaryColor: .blue,
                secondaryColor: .cyan,
                backgroundColor: Color(.systemBackground),
                cardBackground: Color(.systemGray6)
            )
        case .binding:
            return TabTheme(
                primaryColor: .green,
                secondaryColor: .yellow,
                backgroundColor: Color(.systemBackground),
                cardBackground: Color(.systemGray6)
            )
        case .stateObject:
            return TabTheme(
                primaryColor: .purple,
                secondaryColor: .pink,
                backgroundColor: Color(.systemBackground),
                cardBackground: Color(.systemGray6)
            )
        case .stateObjectObservableObject:
            return TabTheme(
                primaryColor: .indigo,
                secondaryColor: .mint,
                backgroundColor: Color(.systemBackground),
                cardBackground: Color(.systemGray6)
            )
        case .stateObservable:
            return TabTheme(
                primaryColor: .teal,
                secondaryColor: .orange,
                backgroundColor: Color(.systemBackground),
                cardBackground: Color(.systemGray6)
            )
        case .observedObject:
            return TabTheme(
                primaryColor: .red,
                secondaryColor: .orange,
                backgroundColor: Color(.systemBackground),
                cardBackground: Color(.systemGray6)
            )
        case .observedObjectObservableObject:
            return TabTheme(
                primaryColor: .brown,
                secondaryColor: .yellow,
                backgroundColor: Color(.systemBackground),
                cardBackground: Color(.systemGray6)
            )
        case .varObservable:
            return TabTheme(
                primaryColor: .gray,
                secondaryColor: .blue,
                backgroundColor: Color(.systemBackground),
                cardBackground: Color(.systemGray6)
            )
        case .bindableObservable:
            return TabTheme(
                primaryColor: .orange,
                secondaryColor: .purple,
                backgroundColor: Color(.systemBackground),
                cardBackground: Color(.systemGray6)
            )
        }
    }
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .state:
            StateView(tab: self)
                .tabItem { Label("@State", systemImage: "1.circle.fill") }
                .tag(self)
        case .binding:
            BindingView(tab: self)
                .tabItem { Label("@Binding", systemImage: "2.circle.fill") }
                .tag(self)
        case .stateObject(let subTabs):
            StateObjectVsStateView(tab: self, tabs: subTabs)
                .tabItem { Label("@StateObject", systemImage: "3.circle.fill") }
                .tag(self)
        case .stateObjectObservableObject:
            ObservableObjectView(tab: self)
                .tabItem { Label("< iOS17", systemImage: "5.circle.fill") }
                .tag(self)
        case .stateObservable:
            ObservableView(tab: self)
                .tabItem { Label("iOS17 +", systemImage: "6.circle.fill") }
                .tag(self)
        case .observedObject(let subTabs):
            ObservedObjectVsObservableVsBindableView(tab: self, tabs: subTabs)
                .tabItem { Label("@ObservedObject", systemImage: "4.circle.fill") }
                .tag(self)
        case .observedObjectObservableObject:
            ObservedObjectObservableObjectView(tab: self)
                .tabItem { Label("ObservedObject + ObservableObject", systemImage: "7.circle.fill") }
                .tag(self)
        case .varObservable:
            VarObservableView(tab: self)
                .tabItem { Label("var + Observable", systemImage: "8.circle.fill") }
                .tag(self)
        case .bindableObservable:
            BindableObservableView(tab: self)
                .tabItem { Label("Bindable + Observable", systemImage: "9.circle.fill") }
                .tag(self)
        }
    }
    
    var headerTitle: String {
        switch self {
        case .state: return "📌 @State"
        case .binding: return "📌 @Binding"
        case .stateObject: return "📌 @StateObject vs @State"
        case .stateObjectObservableObject: return "📌 @StateObject + ObservableObject"
        case .stateObservable: return "📌 @State + Observable"
        case .observedObject: return "📌 @ObservedObject"
        case .observedObjectObservableObject: return "📌 @ObservedObject + ObservableObject"
        case .varObservable: return "📌 var + @Observable"
        case .bindableObservable: return "📌 @Bindable + @Observable"
        }
    }
    
    var concept: Concept {
        switch self {
        case .state:
            return Concept(
                title: "¿Qué es @State?",
                description: """
                `@State` es el property wrapper principal para gestionar estado local en una vista.
                
                Se usa cuando un dato pertenece solo a esta vista y debe actualizar la UI al cambiar.
                """,
                explanation: """
                Cuando marcas una propiedad con `@State`, SwiftUI se encarga de:
                
                • Almacenar el valor fuera de la estructura de la vista
                • Mantener el valor cuando la vista se redibuja
                • Actualizar automáticamente la UI cuando el valor cambia
                • Proporcionar un binding ($) para pasar a subvistas
                """
            )
        case .binding:
            return Concept(
                title: "¿Qué es @Binding?",
                description: """
                `@Binding` permite que una vista hija modifique un estado que pertenece a la vista padre.
                Es una referencia de lectura y escritura a un valor externo (fuente de verdad).
                """,
                explanation: """
                Cuando usas `@Binding`:
                
                • La vista hija puede leer y escribir el valor
                • Los cambios se reflejan en la vista padre
                • No se crea una copia del valor, sino una referencia
                • Permite la comunicación bidireccional entre vistas
                """
            )
        case .stateObject:
            return Concept(
                title: "¿Qué es @StateObject vs. @State?",
                description: """
                A partir de iOS 17, `@Observable` permite gestionar objetos observables sin necesidad de `@StateObject`. 
                Antes, `@StateObject` era clave para manejar instancias de `ObservableObject` en SwiftUI. 
                
                Ahora, `@State` puede almacenar tipos `@Observable`, simplificando la gestión del estado.
                """,
                explanation: ""
            )
            
        case .stateObjectObservableObject:
            return Concept(
                title: "Que es @StateObject",
                description: """
                Antes de iOS 17, `@StateObject` era necesario para instanciar objetos observables.
                `@StateObject` garantiza que el objeto solo se cree una vez y viva mientras la vista esté activa.
                """,
                explanation: """
                Cuando usas `@StateObject`:
                
                • El objeto se crea una sola vez y persiste durante la vida de la vista
                • Es ideal para objetos que manejan lógica de negocio o datos complejos
                • Combina bien con `ObservableObject` y `@Published` para notificar cambios
                • Evita reinicializaciones no deseadas durante actualizaciones de la vista
                """
            )
        case .stateObservable:
            return Concept(
                title: "¿Qué es @State con @Observable?",
                description: """
                Ahora `@State` puede usarse con `@Observable`, eliminando la necesidad de `@StateObject`.
                SwiftUI gestiona la instancia correctamente sin que se reinicie.
                """,
                explanation: """
                Cuando usas `@State` con `@Observable`:
                
                • SwiftUI maneja automáticamente el ciclo de vida del objeto
                • No es necesario usar `@Published` para las propiedades
                • Los cambios en cualquier propiedad del objeto provocan una actualización de la UI
                • Es más simple y menos propenso a errores que el enfoque anterior
                """
            )
        case .observedObject:
            return Concept(
                title: "¿Qué es @ObservedObject vs. opciones modernas?",
                description: """
                `@ObservedObject` se usa para observar objetos externos en SwiftUI y actualizar la UI cuando cambian. 
                Antes de iOS 17, era la principal forma de manejar datos compartidos entre vistas.
                
                Con la introducción de `@Observable` y `@Bindable`, hay alternativas más eficientes y directas.
                """,
                explanation: """
                **Antes de iOS 17:**
                - `@ObservedObject` observa objetos que conforman `ObservableObject`.
                - La vista se actualiza cuando cambia una propiedad `@Published`.
                - No retiene la instancia del objeto, otro componente debe manejar su ciclo de vida.
                - Ideal para compartir datos entre múltiples vistas.
                
                **Desde iOS 17+:**
                - `@Observable` evita la necesidad de `@Published`, observando cambios de forma más eficiente.
                - `@Bindable` permite la vinculación directa a la UI, eliminando la necesidad de `Binding` manual.
                """
            )
            
        case .observedObjectObservableObject:
            return Concept(
                title: "¿Qué es @ObservedObject con ObservableObject?",
                description: """
                `@ObservedObject` permite que una vista observe cambios en un objeto que conforma `ObservableObject`. 
                La UI se actualiza cuando sus propiedades `@Published` cambian.
                """,
                explanation: """
                **Características clave:**
                - Se usa con clases conformes a `ObservableObject`.
                - Requiere `@Published` en cada propiedad para detectar cambios.
                - No retiene la instancia, por lo que otro componente debe manejar su ciclo de vida.
                - Se usa cuando un objeto es creado fuera de la vista actual.
                
                **Limitaciones:**
                - Necesita `@Published`, lo que puede generar sobrecarga innecesaria.
                - No es tan eficiente como `@Observable` en iOS 17+.
                - Puede causar reinicializaciones no deseadas si no se maneja correctamente.
                """
            )
            
        case .varObservable:
            return Concept(
                title: "¿Qué es @Observable?",
                description: """
                `@Observable` es una nueva forma de hacer que las clases sean observables sin necesidad de `ObservableObject` ni `@Published`.
                """,
                explanation: """
                **Diferencias con `@ObservedObject`:**
                - No necesita `@Published`, SwiftUI observa automáticamente las propiedades.
                - Es más eficiente y optimiza el rendimiento al reducir la sobrecarga de notificaciones de cambios.
                - Permite la reactividad sin necesidad de conformar explícitamente a `ObservableObject`.
                
                **Lectura vs Escritura:**
                - Se puede leer directamente desde una vista usando `@State`.
                - No requiere `Binding` para actualizar valores, ya que SwiftUI rastrea automáticamente los cambios.
                - No necesita `@ObservedObject` ni `@StateObject` para ser reactivo.
                
                **Requiere iOS 17+**
                """
            )
            
        case .bindableObservable:
            return Concept(
                title: "¿Qué es @Bindable?",
                description: """
                `@Bindable` permite crear modelos de datos que pueden vincularse directamente a la UI sin necesidad de `Binding` manual.
                """,
                explanation: """
                **Diferencias con `@ObservedObject` y `@Observable`:**
                - `@Bindable` permite la sincronización bidireccional entre el modelo de datos y la UI.
                - Es útil cuando se necesita modificar datos directamente desde controles de la UI como `TextField`, `Toggle`, etc.
                - No requiere `Binding`, ya que proporciona un acceso seguro y reactivo a los valores.
                
                **Lectura vs Escritura:**
                - Permite modificar los valores sin necesidad de pasar `$` bindings manualmente.
                - Es ideal para vistas donde el usuario edita datos en formularios u otros inputs interactivos.
                """
            )
            
        }
    }
    
    var keyPoints: [String] {
        switch self {
        case .state:
            return [
                "`@State` se usa para datos simples y locales de una vista.",
                "SwiftUI gestiona el almacenamiento y ciclo de vida de `@State`.",
                "Al cambiar su valor, la vista se redibuja automáticamente.",
                "Es ideal para valores como `Bool`, `String` o índices en Pickers.",
                "En versiones modernas de SwiftUI, `@State` puede contener modelos observables (`@Observable`)."
            ]
        case .binding:
            return [
                "`@Binding` permite compartir un estado entre una vista padre e hija.",
                "La vista padre posee la fuente de verdad (`@State`).",
                "La vista hija recibe el estado como `@Binding`, sin poseerlo.",
                "Los cambios en la vista hija actualizan el estado en la vista padre.",
                "Controles de SwiftUI como `Toggle`, `Slider`, `TextField` usan bindings."
            ]
        case .stateObject:
            return []
        case .stateObjectObservableObject:
            return [
                "`@StateObject` se usa cuando una vista debe **crear y poseer** un objeto observable.",
                "`@StateObject` asegura que el objeto **no se reinicializa** cuando la vista se redibuja.",
                "`@Published` en el `ObservableObject` notifica cambios y actualiza la UI automáticamente.",
                "Este era el método recomendado antes de iOS 17."
            ]
        case .stateObservable:
            return [
                "`@State` ahora puede almacenar `@Observable` sin `@StateObject`.",
                "`@Observable` elimina la necesidad de `@Published`, ya que SwiftUI rastrea automáticamente los cambios.",
                "Es más simple y menos propenso a errores que `@StateObject`.",
                "Requiere iOS 17+."
            ]
        case .observedObject:
            return []
        case .observedObjectObservableObject:
            return [
                "`@ObservedObject` se utiliza para observar objetos que implementan `ObservableObject`.",
                "Las propiedades del objeto marcadas con `@Published` desencadenan actualizaciones de la vista al cambiar.",
                "La vista no es propietaria del objeto observado; este es gestionado externamente.",
                "Es útil para compartir un objeto observable entre múltiples vistas."
            ]
            
        case .varObservable:
            return [
                "`@Observable` es un macro que simplifica la creación de objetos observables.",
                "Las propiedades de una clase marcada con `@Observable` son automáticamente observables.",
                "Elimina la necesidad de usar `@Published` en cada propiedad.",
                "Mejora la claridad y reduce el código boilerplate en la gestión del estado."
            ]
            
        case .bindableObservable:
            return [
                "`@Bindable` permite crear enlaces directos a las propiedades de objetos observables.",
                "Facilita la interacción directa de la UI con el modelo de datos.",
                "Requiere que la clase del modelo conforme al protocolo `Observable`.",
                "Simplifica la gestión de enlaces en vistas complejas."
            ]
        }
    }
}
