//
//  PlayerEntity.swift
//  GameEngine
//
//  Created by Matheus P.K on 03/10/22.
//

import Foundation
import GameplayKit

class BaseEntity: GKEntity {
    
    override init() {
        super.init()
        addComponent(SpriteComponent(color: .blue, size: CGSize(width: 50, height: 50)))
        addComponent(ColliderComponent(type: .player, collidibleTypes: [.all], contactTestTypes: [.all]))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
