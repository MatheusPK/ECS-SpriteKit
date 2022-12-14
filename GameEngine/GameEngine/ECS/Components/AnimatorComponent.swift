//
//  AnimatorComponent.swift
//  GameEngine
//
//  Created by Matheus P.K on 03/10/22.
//

import Foundation
import GameplayKit

class AnimatorComponent: GKComponent {
    
    
    let type: AnimationType
    let sprites: SKTextureAtlas
    var stateMachine: GKStateMachine?
    
    init(type: AnimationType) {
        self.type = type
        self.sprites = type.getTextureSet()
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didAddToEntity() {
        stateMachine = GKStateMachine(states: [
            UpAnimationState(entity: entity!, texture: sprites.textureNamed("\(type.rawValue)Up")),
            DownAnimationState(entity: entity!, texture: sprites.textureNamed("\(type.rawValue)Down")),
            LeftAnimationState(entity: entity!, texture: sprites.textureNamed("\(type.rawValue)Left")),
            RightAnimationState(entity: entity!, texture: sprites.textureNamed("\(type.rawValue)Right")),
            IdleAnimationState(entity: entity!, texture: sprites.textureNamed("\(type.rawValue)"))
        ])
        stateMachine?.enter(IdleAnimationState.self)
    }
    
    func enterState(for direction: MovementComponent.Direction) {
        switch direction {
            case .left: stateMachine?.enter(LeftAnimationState.self)
            case .right: stateMachine?.enter(RightAnimationState.self)
            case .up: stateMachine?.enter(UpAnimationState.self)
            case .down: stateMachine?.enter(DownAnimationState.self)
            case .idle: stateMachine?.enter(IdleAnimationState.self)
        }
    }
    
}

extension AnimatorComponent {
    enum AnimationType: String {
        case skull = "skull"
        case pumpkin = "pumpkin"
        
        func getTextureSet() -> SKTextureAtlas {
            switch self {
                case .skull: return SKTextureAtlas(named: "skull.atlas")
                case .pumpkin: return SKTextureAtlas(named: "pumpkin.atlas")
            }
        }
    }
}
