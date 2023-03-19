//
//  Point3.swift
//  Core
//
//  Created by Богдан Конопольський on 19.03.2023.
//

import Foundation

public struct Point3 {
    
    //MARK: - Properties
    
    public var x: Float
    public var y: Float
    public var z: Float
    
    //MARK: - Initialization
    
    public init(x: Float, y: Float, z: Float) {
        self.x = x
        self.y = y
        self.z = z
    }
}
//MARK: - Operators

public extension Point3 {
    
    static func +(lhs: Point3, rhs: Vector3) -> Point3 {
        return Point3(x: lhs.x + rhs.x, y: lhs.y + rhs.y, z: lhs.z + rhs.z)
    }
    
    static func -(lhs: Point3, rhs: Point3) -> Vector3 {
        return Vector3(x: lhs.x - rhs.x, y: lhs.y - rhs.y, z: lhs.z - rhs.z)
    }
}
