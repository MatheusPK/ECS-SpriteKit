//
//  PlayerEntity.swift
//  GameEngine
//
//  Created by Matheus P.K on 03/10/22.
//

import Foundation
import GameplayKit

class PlayerEntity: GKEntity {
    
    override init() {
        super.init()
        addComponent(SpriteComponent(color: .blue, size: CGSize(width: 50, height: 50)))
        addComponent(ColliderComponent(type: .player, collidibleTypes: [.all], contactTestTypes: [.all]))
        addComponent(MovementComponent(velocity: 7, animationDuration: 0.05))
        addComponent(TouchMovementComponent())
        addComponent(FaceTrackingMovementComponent())
        addComponent(AnimatorComponent(type: .skull))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
