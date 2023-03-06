//
//  Ray.swift
//  CGConsole
//
//  Created by Богдан Конопольський on 05.03.2023.
//

import Foundation

struct Ray {
    
    //MARK: - Properties
    
    var origin: Vector3
    var direction: Vector3
    
    //MARK: - Initialization
    
    init(origin: Vector3, direction: Vector3) {
        self.origin = origin
        self.direction = direction
    }
    
    //MARK: - Public methods
    
    func pointAt(t: Float) -> Vector3 {
        return origin + direction * t
    }
}
