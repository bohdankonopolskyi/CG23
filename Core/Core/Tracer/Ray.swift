//
//  Ray.swift
//  CGConsole
//
//  Created by Богдан Конопольський on 05.03.2023.
//

import Foundation

public struct Ray {
    
    //MARK: - Properties
    
    public var origin: Vector3
    public var direction: Vector3
    
    //MARK: - Initialization
    
    public init(origin: Vector3, direction: Vector3) {
        self.origin = origin
        self.direction = direction
    }
    
    //MARK: - Public methods
    
    public func pointAt(t: Float = 1) -> Vector3 {
        return origin + direction * t
    }
}
