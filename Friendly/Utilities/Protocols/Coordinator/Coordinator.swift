//
//  Coordinator.swift
//  Friendly
//
//  Created by Lior Shor on 25/05/2023.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var actions: Actions { get set }
    var parameters: Parameters { get set }
    var navigationController: UINavigationController { get set }

    func start()
    func finish()
    func dismiss(animated: Bool)
    
    init(parameters: Parameters, actions: Actions, navigationController: UINavigationController)
}

extension Coordinator {
    /**
     De-allocates a child coordinator from its parent.
     
     - parameters:
        - child: the instance of the child coordinator (usually using `self`) to de-allocate.
     */
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    
    func dismiss(animated: Bool = true) {
        navigationController.dismiss(animated: animated)
    }
}
