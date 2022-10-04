//
//  MovementAnimationState.swift
//  GameEngine
//
//  Created by Matheus P.K on 04/10/22.
//

import Foundation
import GameplayKit

class MovementAnimationState: GKState {
    
    let entity: GKEntity
    let texture: SKTexture
    
    init(entity: GKEntity, texture: SKTexture) {
        self.entity = entity
        self.texture = texture
        super.init()
    }
}

class UpAnimationState: MovementAnimationState {
    override func didEnter(from previousState: GKState?) {
        guard let spriteComponent = entity.component(ofType: SpriteComponent.self) else { return }
        spriteComponent.node.texture = texture
    }
}

class DownAnimationState: MovementAnimationState {
    override func didEnter(from previousState: GKState?) {
        guard let spriteComponent = entity.component(ofType: SpriteComponent.self) else { return }
        spriteComponent.node.texture = texture
    }
}

class LeftAnimationState: MovementAnimationState {
    override func didEnter(from previousState: GKState?) {
        guard let spriteComponent = entity.component(ofType: SpriteComponent.self) else { return }
        spriteComponent.node.texture = texture
    }
}

class RightAnimationState: MovementAnimationState {
    override func didEnter(from previousState: GKState?) {
        guard let spriteComponent = entity.component(ofType: SpriteComponent.self) else { return }
        spriteComponent.node.texture = texture
    }
}
