//
//  Coordinator.swift
//  Friendly
//
//  Created by Lior Shor on 25/05/2023.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
    func finish()
}
