//
//  ColliderComponent.swift
//  GameEngine
//
//  Created by Matheus P.K on 03/10/22.
//

import Foundation
import GameplayKit

class ColliderComponent: GKComponent {
    
    let type: ColliderType
    var collidibleTypes: [ColliderType]
    var contactTestTypes: [ColliderType]
    
    init(type: ColliderType, collidibleTypes: [ColliderType], contactTestTypes: [ColliderType]) {
        self.type = type
        self.collidibleTypes = collidibleTypes
        self.contactTestTypes = contactTestTypes
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didAddToEntity() {
        setupBitMask()
    }
    
    private func setupBitMask() {
        guard let spriteComponent = entity?.component(ofType: SpriteComponent.self) else { return }
        let node = spriteComponent.node
        let physicsBody = SKPhysicsBody(rectangleOf: node.size)
        physicsBody.categoryBitMask = type.getBitMask()
        physicsBody.collisionBitMask = getCollisionBitMask()
        physicsBody.contactTestBitMask = getContactTestBitMask()
        node.physicsBody = physicsBody
    }
    
    private func getCollisionBitMask() -> UInt32 {
        var bitmask: UInt32 = 0x0
        for collidibleType in collidibleTypes {
            bitmask |= collidibleType.getBitMask()
        }
        return bitmask
    }
    
    private func getContactTestBitMask() -> UInt32 {
        var bitmask: UInt32 = 0x0
        for contactTestType in contactTestTypes {
            bitmask |= contactTestType.getBitMask()
        }
        return bitmask
    }
    
}

extension ColliderComponent {
    
    enum ColliderType {
        case player
        case item
        case all
        
        func getBitMask() -> UInt32 {
            switch self {
                case .player: return 0x1 << 0
                case .item: return 0x1 << 1
                case .all: return UInt32.max
            }
        }
        
    }
    
}
