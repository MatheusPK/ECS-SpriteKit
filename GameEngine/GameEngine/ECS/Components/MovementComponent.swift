//
//  MovementComponent.swift
//  GameEngine
//
//  Created by Matheus P.K on 03/10/22.
//

import Foundation
import GameplayKit

class MovementComponent: GKComponent {
    
    let velocity: CGFloat
    let animationDuration: CGFloat
    
    init(velocity: CGFloat, animationDuration: CGFloat) {
        self.velocity = velocity
        self.animationDuration = animationDuration
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func move(to direction: Direction) {
        if let spriteComponent = entity?.component(ofType: SpriteComponent.self) {
            let moveAction = getMoveAction(for: direction)
            if let animationComponent = entity?.component(ofType: AnimatorComponent.self) {
                animationComponent.enterState(for: direction)
            }
            spriteComponent.node.run(moveAction)
        }
    }
    
    private func getMoveAction(for direction: Direction) -> SKAction {
            var moveVector = CGVector()
        
            switch direction {
                case .left: moveVector = CGVector(dx: -velocity, dy: 0)
                case .right: moveVector = CGVector(dx: velocity, dy: 0)
                case .up: moveVector = CGVector(dx: 0, dy: velocity)
                case .down: moveVector = CGVector(dx: 0, dy: -velocity)
                case .idle: moveVector = CGVector(dx: 0, dy: 0)
            }
            
            return SKAction.move(by: moveVector, duration: animationDuration)
    }
    
}

extension MovementComponent {
    enum Direction {
        case left
        case right
        case up
        case down
        case idle
    }
}
