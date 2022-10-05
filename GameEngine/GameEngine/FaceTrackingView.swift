//
//  FaceTrackingView.swift
//  GameEngine
//
//  Created by Matheus P.K on 04/10/22.
//

import Foundation
import ARKit

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
