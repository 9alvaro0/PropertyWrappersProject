//
//  Tab.swift
//  PropertyWrappersProject
//
//  Created by Alvaro Guerra Freitas on 6/3/25.
//

import SwiftUI

indirect enum Tab: CaseIterable, Hashable {
    case state
    case binding
    case stateObject([Tab])
    case stateObjectObservableObject
    case stateObservable
    case observedObject([Tab])
    case observedObjectObservableObject
    case varObservable
    case bindableObservable
    
    static var allCases: [Tab] = [
        .state,
        .binding,
        .stateObject(
            [
                .stateObjectObservableObject,
                .stateObservable
            ]
        ),
        .observedObject(
            [
                .observedObjectObservableObject,
                .varObservable,
                .bindableObservable
            ]
        )
    ]
    
    var title: String {
        switch self {
        case .state: return "@State"
        case .binding: return "@Binding"
        case .stateObject: return "@StateObject"
        case .stateObjectObservableObject: return "ObservableObject (< iOS17)"
        case .stateObservable: return "@State + @Observable"
        case .observedObject: return "@ObservedObject"
        case .observedObjectObservableObject: return "ObservableObject tradicional"
        case .varObservable: return "Observable moderno (var)"
        case .bindableObservable: return "Bindable moderno"
        }
    }
    
    var subtitle: String {
        switch self {
        case .state:
            return "Datos simples y **locales** que actualizan la vista automáticamente."
        case .binding:
            return "Referencia **bidireccional** de lectura y escritura entre vistas."
        case .stateObject:
            return "Gestión de objetos observables propios de una vista."
        case .stateObjectObservableObject:
            return "Instancias únicas con `@StateObject`."
        case .stateObservable:
            return "Integración directa de `@State` con `@Observable` (iOS 17+)."
        case .observedObject:
            return "Observa objetos externos desde una vista."
        case .observedObjectObservableObject:
            return "Patrón clásico: `@ObservedObject` y `ObservableObject`."
        case .varObservable:
            return "Eliminando boilerplate con `@Observable`."
        case .bindableObservable:
            return "Enlaces simples y directos con `@Bindable`."
        }
    }
    
    var theme: TabTheme {
        switch self {
        case .state: return TabTheme(.blue, .cyan)
        case .binding: return TabTheme(.green, .yellow)
        case .stateObject: return TabTheme(.purple, .pink)
        case .stateObjectObservableObject: return TabTheme(.indigo, .mint)
        case .stateObservable: return TabTheme(.teal, .orange)
        case .observedObject: return TabTheme(.red, .orange)
        case .observedObjectObservableObject: return TabTheme(.brown, .yellow)
        case .varObservable: return TabTheme(.gray, .blue)
        case .bindableObservable: return TabTheme(.orange, .purple)
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
        case .stateObject: return "📌 @StateObject"
        case .stateObjectObservableObject: return "📌 ObservableObject (< iOS17)"
        case .stateObservable: return "📌 @State + @Observable (iOS17+)"
        case .observedObject: return "📌 @ObservedObject"
        case .observedObjectObservableObject: return "📌 @ObservedObject tradicional"
        case .varObservable: return "📌 var + @Observable"
        case .bindableObservable: return "📌 @Bindable + @Observable"
        }
    }

    var concept: Concept {
        switch self {
        case .state:
            return Concept(
                title: "🚩 ¿Qué es @State?",
                description: """
                `@State` gestiona **estados locales** en una vista. Úsalo para datos simples que actualizan automáticamente la UI al cambiar.
                """,
                explanation: """
                Al usar `@State`, SwiftUI automáticamente:
                • Guarda el valor fuera de la estructura.
                • Mantiene el estado entre redibujados.
                • Actualiza la UI automáticamente.
                • Proporciona `$binding` para usar en subvistas.
                """
            )

        case .binding:
            return Concept(
                title: "🔗 ¿Qué es @Binding?",
                description: """
                `@Binding` permite que vistas hijas modifiquen un estado propiedad de la vista padre, creando una referencia **bidireccional**.
                """,
                explanation: """
                Con `@Binding`:
                • Vistas hijas leen y escriben valores externos.
                • Los cambios se reflejan inmediatamente en la vista padre.
                • Favorece la comunicación directa entre vistas.
                """
            )

        case .stateObject:
            return Concept(
                title: "🔍 @StateObject vs. @State",
                description: """
                Antes de iOS 17, `@StateObject` era clave para gestionar objetos observables propios de la vista. Desde iOS 17, puedes simplificar usando `@State` con objetos `@Observable`.
                """,
                explanation: """
                • `@StateObject` mantiene una instancia única mientras la vista exista.
                • En iOS 17+, `@State` maneja objetos `@Observable` directamente, facilitando la gestión del ciclo de vida.
                """
            )

        case .stateObjectObservableObject:
            return Concept(
                title: "📦 ¿Qué es @StateObject?",
                description: """
                Antes de iOS 17, `@StateObject` era necesario para instanciar objetos observables, asegurando que se creen una sola vez.
                """,
                explanation: """
                Al usar `@StateObject`:
                • La instancia persiste durante toda la vida de la vista.
                • Ideal para datos complejos y lógica de negocio.
                • Previene reinicializaciones indeseadas.
                """
            )

        case .stateObservable:
            return Concept(
                title: "🌟 @State con @Observable (iOS 17+)",
                description: """
                Con iOS 17+, combina `@State` directamente con objetos `@Observable`, simplificando la gestión del estado.
                """,
                explanation: """
                Beneficios:
                • No necesitas usar `@Published`.
                • Actualiza automáticamente la UI con cada cambio.
                • Manejo automático del ciclo de vida del objeto.
                """
            )

        case .observedObject:
            return Concept(
                title: "🔄 @ObservedObject: antes y ahora",
                description: """
                `@ObservedObject` observa objetos externos y actualiza la UI cuando cambian. Era esencial antes de iOS 17; ahora `@Observable` ofrece alternativas más modernas.
                """,
                explanation: """
                Antes de iOS 17:
                • Observa propiedades con `@Published`.
                • No retiene la instancia.

                Desde iOS 17+:
                • Usa `@Observable` sin `@Published`.
                • Más eficiente y sencillo.
                """
            )

        case .observedObjectObservableObject:
            return Concept(
                title: "📚 ¿Qué es @ObservedObject clásico?",
                description: """
                Patrón clásico que usa `@ObservedObject` junto con objetos que implementan `ObservableObject` y propiedades `@Published`.
                """,
                explanation: """
                • Actualiza la UI al detectar cambios.
                • La vista no es dueña del objeto, solo lo observa.
                • Útil para compartir datos entre múltiples vistas.
                """
            )

        case .varObservable:
            return Concept(
                title: "🚀 @Observable moderno",
                description: """
                Desde iOS 17, `@Observable` permite observar automáticamente cambios sin necesidad de usar `ObservableObject` o `@Published`.
                """,
                explanation: """
                Ventajas:
                • Menos código boilerplate.
                • SwiftUI detecta automáticamente cambios.
                • Mejora el rendimiento y la claridad del código.
                """
            )

        case .bindableObservable:
            return Concept(
                title: "🎛️ ¿Qué es @Bindable?",
                description: """
                `@Bindable` permite una vinculación directa entre la UI y el modelo de datos sin necesidad de bindings explícitos.
                """,
                explanation: """
                Características:
                • Modifica directamente propiedades desde controles de UI.
                • Comunicación bidireccional automática.
                • Ideal para formularios e inputs interactivos.
                """
            )
        }
    }
    
    var process: ProcessInfo {
        switch self {
        case .state:
            return ProcessInfo(
                steps: [
                    "SwiftUI almacena el valor de @State fuera de la estructura de la vista",
                    "Cuando el valor cambia, SwiftUI detecta el cambio",
                    "La vista se redibuja automáticamente con el nuevo valor"
                ]
            )
        case .binding:
            return ProcessInfo(
                steps: [
                    "La vista padre pasa el estado con $ (ej: $userName)",
                    "La vista hija recibe una referencia al estado (@Binding)",
                    "Los cambios en la vista hija actualizan el estado en la vista padre"
                ]
            )
        case .stateObject(_):
            return ProcessInfo(
                steps: []
            )
        case .stateObjectObservableObject:
            return ProcessInfo(
                steps: [
                    "La vista crea el ViewModel con @StateObject",
                    "El ViewModel persiste durante la vida de la vista",
                    "@Published notifica cambios y actualiza la UI"
                ]
            )
        case .stateObservable:
            return ProcessInfo(
                steps: [
                    "La vista crea el ViewModel con @State",
                    "@Observable permite a SwiftUI rastrear cambios automáticamente",
                    "Cualquier cambio en el ViewModel actualiza la UI"
                ]
            )
        case .observedObject(_):
            return ProcessInfo(
                steps: []
            )
        case .observedObjectObservableObject:
            return ProcessInfo(
                steps: [
                    "La vista padre crea y posee el ViewModel con @StateObject",
                    "La vista hija recibe y observa el ViewModel con @ObservedObject",
                    "Cambios en @Published notifican a todas las vistas que observan"
                ]
            )
        case .varObservable:
            return ProcessInfo(
                steps: [
                    "La vista recibe el `ViewModel` como `var`, lo que significa que solo puede leer sus valores.",
                    "`@Observable` permite que SwiftUI rastree cambios, pero la vista **no puede modificar el objeto**.",
                    "Ideal para vistas que solo muestran datos sin modificarlos."
                ]
            )
        case .bindableObservable:
            return ProcessInfo(
                steps: [
                    "La vista recibe un objeto observable marcado con @Bindable",
                    "Controles de UI (TextField, Toggle, etc.) pueden modificar directamente las propiedades del objeto sin crear explícitamente un Binding",
                    "Cualquier cambio en estas propiedades actualiza automáticamente la interfaz gracias a @Observable"
                ]
            )

        }
    }
    
    var keyPoints: [String] {
        switch self {
        case .state:
            return [
                "Gestiona **estados locales simples** en vistas.",
                "Se actualiza automáticamente al cambiar el valor.",
                "Ideal para valores primitivos como números o cadenas."
            ]
        case .binding:
            return [
                "Referencia **bidireccional** compartida entre vistas.",
                "Vista hija modifica estado padre directamente.",
                "Fuente de verdad sigue siendo la vista superior."
            ]
        case .stateObjectObservableObject:
            return [
                "Antes de iOS 17 era obligatorio para objetos observables.",
                "Garantiza una sola instancia por vista.",
                "Ciclo de vida ligado a la vista."
            ]
        case .stateObservable:
            return [
                "Nueva forma en iOS 17+ sin necesidad de `@StateObject`.",
                "Simplifica y reduce errores comunes en la gestión del estado.",
                "SwiftUI gestiona automáticamente el ciclo de vida."
            ]
        case .observedObjectObservableObject:
            return [
                "Observa objetos externos que conforman a `ObservableObject`.",
                "Requiere propiedades marcadas con `@Published`.",
                "La instancia es gestionada externamente."
            ]
        case .varObservable:
            return [
                "Alternativa moderna a `ObservableObject`.",
                "SwiftUI observa automáticamente cambios en propiedades.",
                "Reduce la complejidad del código."
            ]
        case .bindableObservable:
            return [
                "Enlaces reactivos y directos con controles de la UI.",
                "Bidireccional, sin necesidad explícita de bindings.",
                "Ideal para interacciones directas en formularios."
            ]
        default: return []
        }
    }
}
