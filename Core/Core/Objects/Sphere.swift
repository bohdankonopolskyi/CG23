//
//  Sphere.swift
//  CGConsole
//
//  Created by Богдан Конопольський on 05.03.2023.
//  Contibuted by StefanErrorerko

import Foundation

public struct Sphere {
    
    //MARK: - Enum
    
    enum SphereError: Error {
        case NegativeRadius
    }
    
    //MARK: - Properties
    
    public var center: Vector3
    public var radius: Float
    
    //MARK: - Initialization
    
    public init(center: Vector3, radius: Float) throws {
        self.center = center
        if radius < 0 {
            throw SphereError.NegativeRadius
        }
        self.radius = radius
    }
}

//MARK: - Public Methods

extension Sphere: ObjectProtocol {
    
    public func normal(at point: Vector3) -> Vector3 {
        return (center - point).normalized()
    }
    
    public func intersects(with ray: Ray) -> Float? {
        //normalized ray direction vector
        let dir = ray.direction
        //difference of ray origin and sphere center
        let s = ray.origin - self.center
        let a = dir.dot(dir)
        let b = 2 * s.dot(ray.direction)
        let c = s.dot(s) - pow(self.radius, 2)
        let discriminant = b * b - 4 * a * c
        
        if discriminant >= 0 {
            let t1 = (-b - sqrt(discriminant)) / (2 * a)
            let t2 = (-b + sqrt(discriminant)) / (2 * a)
            
            let t = Float.minimum(t1, t2)
            
            if t < 0 {
                return nil
            }
            return t
        }
        return nil
    }
}
