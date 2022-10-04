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
        
        var direction = MovementComponent.Direction.idle
        
        if browInnerUp > 0.5 {
            direction = .up
        }
        
        if (leftBrownDown > 0.3 && rightBrownDown > 0.3) {
            direction = .down
        }
        
        if mouthLeft > 0.4 {
            direction = .left
        }
        
        if mouthRight > 0.4 {
            direction = .right
        }
        
        if let movementComponent = entity?.component(ofType: MovementComponent.self) {
            movementComponent.move(to: direction)
        }
    }
}

class FaceTrackingView: ARSCNView, ARSCNViewDelegate {

    //MARK: - Initializers
    init() {
        super.init(frame: .zero, options: nil)
        scene = SCNScene()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Public Methods
    public func startSession(){
        session.run(ARFaceTrackingConfiguration(), options: [.resetTracking, .removeExistingAnchors])
    }
    
    public func pauseSession(){
        session.pause()
    }
}


