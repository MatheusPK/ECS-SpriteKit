//
//  System.swift
//  GameEngine
//
//  Created by Matheus P.K on 02/10/22.
//

import Foundation
import GameplayKit

class System {
    
    weak var scene: GameScene? {
        didSet {
            setupEntities()
        }
    }
    
    var entites = Set<GKEntity>()
    
    func setupEntities() {}
    
    func add(_ entity: GKEntity) {
        entites.insert(entity)
        
        if let spriteComponent = entity.component(ofType: SpriteComponent.self) {
            scene?.addChild(spriteComponent.node)
        }
    }
    
    func remove(_ entity: GKEntity) {
        entites.remove(entity)
    }
    
}
