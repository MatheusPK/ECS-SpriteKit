//
//  TouchMovementComponent.swift
//  GameEngine
//
//  Created by Matheus P.K on 03/10/22.
//

import Foundation
import UIKit
import GameplayKit

class TouchMovementComponent: GKComponent {
    
    func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        guard let view = touch.view else { return }
        guard let movementComponent = entity?.component(ofType: MovementComponent.self) else { return }
        let touchLocation = touch.location(in: view)
        if touchLocation.x > view.bounds.midX {
            movementComponent.move(to: .right)
        } else {
            movementComponent.move(to: .left)
        }
    }
}
