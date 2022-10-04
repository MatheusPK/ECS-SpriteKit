//
//  GameScene.swift
//  GameEngine
//
//  Created by Matheus P.K on 01/10/22.
//

import Foundation
import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let system: System
    
    init(size: CGSize, system: System) {
        self.system = system
        super.init(size: size)
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        print(zPosition)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {}
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for entity in system.entites {
            if let touchComponent = entity.component(ofType: TouchComponent.self) {
                touchComponent.touchesBegan(touches, with: event)
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        for entity in system.entites {
            entity.update(deltaTime: currentTime)
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
    }
    
}
