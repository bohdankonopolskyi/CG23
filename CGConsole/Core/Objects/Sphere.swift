//
//  Sphere.swift
//  CGConsole
//
//  Created by Богдан Конопольський on 05.03.2023.
//

import Foundation

struct Sphere {
    
    //MARK: - Properties
    
    var center: Vector3
    var radius: Float
    
    //MARK: - Initialization
    
    init(center: Vector3, radius: Float) {
        self.center = center
        self.radius = radius
    }
    
    //MARK: - Public Methods
    
    func hit(ray: Ray, tMin: Float, tMax: Float) -> (Bool, Vector3) {
        let oc = ray.origin - center
        let a = ray.direction.dot(ray.direction)
        let b = 2 * oc.dot(ray.direction)
        let c = oc.dot(oc) - radius * radius
        let discriminant = b * b - 4 * a * c
        
        if discriminant > 0 {
            let t1 = (-b - sqrt(discriminant)) / (2 * a)
            let t2 = (-b + sqrt(discriminant)) / (2 * a)
            
            if t1 < tMax && t1 > tMin {
                return (true, ray.pointAt(t: t1))
            }
            if t2 < tMax && t2 > tMin {
                return (true, ray.pointAt(t: t2))
            }
        } else if discriminant == 0 {
            let t = (-b - sqrt(discriminant)) / (2 * a)
            
            if t < tMax && t > tMin {
                return (true, ray.pointAt(t: t))
            }
        }
        
        return (false, Vector3(x: 0, y: 0, z: 0))
    }
}
