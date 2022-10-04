//
//  GameView.swift
//  GameEngine
//
//  Created by Matheus P.K on 03/10/22.
//

import Foundation
import SpriteKit

class GameView: SKView {
    init() {
        super.init(frame: .zero)
        setupIndicators()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods
    private func setupIndicators() {
        #if DEBUG
        ignoresSiblingOrder = true
        showsFPS = true
        showsNodeCount = true
        showsPhysics = true
        showsFields = true
        #endif
    }
    
}
