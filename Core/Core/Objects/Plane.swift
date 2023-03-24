//
//  Plane.swift
//  CGConsole
//
//  Created by Богдан Конопольський on 06.03.2023.
//

import Foundation

public struct Plane {
    
    //MARK: - Properties
    
    public var point: Vector3
    public var normal: Vector3
    
    //MARK: - Initialization
    
    public init(point: Vector3, normal: Vector3) {
        self.point = point
        self.normal = normal.normalized()
    }
}

//MARK: - Public methods

extension Plane: ObjectProtocol {
    
    public func normal(at point: Vector3) -> Vector3 {
        return normal.normalized()
    }
    
    public func intersects(with ray: Ray) -> Float? {
        let numerator = self.normal.dot(ray.origin - self.point)
        let denominator = self.normal.dot(ray.direction)
        
        if denominator == 0 {
            return nil
        }
        
        return -numerator / denominator
    }
}
