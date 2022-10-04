//
//  ItemCatcherConfigurator.swift
//  GameEngine
//
//  Created by Matheus P.K on 03/10/22.
//

import Foundation
import UIKit

final class ItemCatcherConfigurator: ModuleFactory {
    
    struct Dependencies {}
    
    static func make(with dependencies: Dependencies) -> UIViewController {
        
        let view = ItemCatcherView()
        let viewController = ItemCatcherViewController(mainView: view)
        
        let system = ItemCatcherSystem()
        let scene = ItemCatcherScene(size: UIScreen.main.bounds.size, system: system)
        
        system.scene = scene
        
        view.presentScene(scene)
        
        return viewController
    }
    
}
