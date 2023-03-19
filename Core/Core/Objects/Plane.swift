//
//  Plane.swift
//  CGConsole
//
//  Created by Богдан Конопольський on 06.03.2023.
//

import Foundation

public struct Plane {
    
    //MARK: - Properties
    
    let point: Vector3
    let normal: Vector3
    public var material: Material
    
    //MARK: - Initialization
    
    public init(point: Vector3, normal: Vector3, material: Material) {
        self.point = point
        self.normal = normal.normalized()
        self.material = material
    }
}

//MARK: - Public methods

extension Plane: ObjectProtocol {
    
    public func normal(at point: Vector3) -> Vector3 {
        return self.normal
    }
    
    //    func hit(ray: Ray) -> Float? {
    //        let denominator = normal.dot(ray.direction)
    //        if abs(denominator) < 1e-6 {
    //            return nil
    //        }
    //        let numerator = normal.dot(point - ray.origin)
    //        let t = numerator / denominator
    //        if t < 0 {
    //            return nil
    //        }
    //        return t
    //    }
    
    public func intersects(with ray: Ray) -> Float? {
        let numerator = self.normal.dot(ray.origin - self.point)
        let denominator = self.normal.dot(ray.direction)
        
        if denominator == 0 {
            return nil
        }
        
        return -numerator / denominator
    }
}
