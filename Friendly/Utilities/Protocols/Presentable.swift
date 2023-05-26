//
//  Presentable.swift
//  Friendly
//
//  Created by Lior Shor on 26/05/2023.
//

public protocol Presentable {
    
    /// Actionable associatedtype
    associatedtype Actionable
    
    /// Paramaterable associatedtype
    associatedtype Parameterable
    
    /// Viewable associatedtype
    associatedtype Viewable
    
    /// Actionable property
    var actions: Actionable { get set }
    
    /// Parameterable property
    var parameters: Parameterable { get set }
    
    /// Viewable property
    var view: Viewable? { get set }
    
    /**
     Presentable required initialisers
     
     - Parameters:
        - actions: Actionable type
        - parameters: Parameterable type
        - view: Viewable type
     */
    init(actions: Actionable, parameters: Parameterable, view: Viewable)
}

extension Presentable {
    
    /// Creates a value having the same type of the current value.
    ///
    /// - Parameters:
    ///   - actions: the actions value required by the Presentable protocol
    ///   - parameters: the parameters value required by the Presentable protocol
    ///   - view: the view object required by the Presentable protocol
    /// - Returns: A value having the same type of the current value

    static func make(actions: Actionable,
                     parameters: Parameterable,
                     view: Viewable) -> Self {
        let presenter = self.init(actions: actions, parameters: parameters, view: view)
        return presenter
    }
}
