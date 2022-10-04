//
//  SpriteComponent.swift
//  GameEngine
//
//  Created by Matheus P.K on 03/10/22.
//

import Foundation
import GameplayKit
import SpriteKit

class SpriteComponent: GKComponent {
    let node: SKSpriteNode
    
    init(color: UIColor, size: CGSize) {
        node = SKSpriteNode(color: color, size: size)
        super.init()
    }
    
    init(color: UIColor, size: CGSize, position: CGPoint) {
        node = SKSpriteNode(color: color, size: size)
        node.position = position
        super.init()
    }
    
    init(texture: SKTexture, position: CGPoint) {
        node = SKSpriteNode(texture: texture, color: .clear, size: texture.size())
        node.position = position
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
