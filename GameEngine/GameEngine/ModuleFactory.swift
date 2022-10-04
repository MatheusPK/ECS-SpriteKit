//
//  ModuleFactory.swift
//  GameEngine
//
//  Created by Matheus P.K on 03/10/22.
//

import Foundation
import UIKit

protocol ModuleFactory {
    associatedtype Dependencies
    static func make(with dependencies: Dependencies) -> UIViewController
}
