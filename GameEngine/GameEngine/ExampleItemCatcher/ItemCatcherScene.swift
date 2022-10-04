//
//  ItemCatcherScene.swift
//  GameEngine
//
//  Created by Matheus P.K on 03/10/22.
//

import Foundation
import SpriteKit

class ItemCatcherScene: GameScene {
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
    
    override func update(_ currentTime: TimeInterval) {
        for entity in system.entites {
            entity.update(deltaTime: currentTime)
        }
    }
    
    override func didBegin(_ contact: SKPhysicsContact) {
    
    }
}
