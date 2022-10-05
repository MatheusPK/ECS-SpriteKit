//
//  FaceTrackingMovementComponent.swift
//  GameEngine
//
//  Created by Matheus P.K on 04/10/22.
//

import Foundation
import GameplayKit
import ARKit

class FaceTrackingMovementComponent: GKComponent {
    
    let faceTrackingView: FaceTrackingView
    
    override init() {
        faceTrackingView = FaceTrackingView()
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didAddToEntity() {
        faceTrackingView.startSession()
        faceTrackingView.session.delegate = self
    }
}

extension FaceTrackingMovementComponent: ARSessionDelegate {
    func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
        guard let faceAnchor = anchors.first as? ARFaceAnchor else { return }
        
        guard let browInnerUp = faceAnchor.blendShapes[.browInnerUp] as? Float else { return }
        guard let leftBrownDown = faceAnchor.blendShapes[.browDownLeft] as? Float else { return }
        guard let rightBrownDown = faceAnchor.blendShapes[.browDownLeft] as? Float else { return }
        guard let mouthLeft = faceAnchor.blendShapes[.mouthRight] as? Float else { return }
        guard let mouthRight = faceAnchor.blendShapes[.mouthLeft] as? Float else { return }
        
        var directions: [MovementComponent.Direction] = [.idle]
        
        if browInnerUp > 0.5 {
            directions.append(.up)
        }
        
        if (leftBrownDown > 0.3 && rightBrownDown > 0.3) {
            directions.append(.down)
        }
        
        if mouthLeft > 0.4 {
            directions.append(.left)
        }
        
        if mouthRight > 0.4 {
            directions.append(.right)
        }
        
        if let movementComponent = entity?.component(ofType: MovementComponent.self) {
            for direction in directions {
                movementComponent.move(to: direction)
            }
        }
    }
}




