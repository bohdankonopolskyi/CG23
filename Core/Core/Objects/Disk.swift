//
//  Disk.swift
//  CGConsole
//
//  Created by Богдан Конопольський on 06.03.2023.
//  Contributed by StefanErrorerko

import Foundation

public struct Disk {
    
    //MARK: - Errors
    
    enum SphereError: Error {
        case NegativeRadius
    }
    
    //MARK: - Properties
    
    public var center: Vector3
    public var normal: Vector3
    public var radius: Float
    
    //MARK: - Initialization
    
    public init(center: Vector3, normal: Vector3, radius: Float) throws {
        self.center = center
        self.normal = normal.normalized()
        if radius < 0 {
            throw SphereError.NegativeRadius
        }
        self.radius = radius
    }
}

//MARK: - Public methods

extension Disk: ObjectProtocol {
    
    public func normal(at point: Vector3) -> Vector3 {
        return normal
    }
    
    public func intersects(with ray: Ray) -> Float? {
        let denominator = normal.dot(ray.direction)
        if abs(denominator) < 1e-6 {
            return nil
        }
        let numerator = normal.dot(center - ray.origin)
        let t = numerator / denominator
        if t < 0 {
            return nil
        }
        let point = ray.pointAt(t: t)
        if (point - center).length > radius {
            return nil
        }
        return t
    }
}
