//
//  Point3.swift
//  CGConsole
//
//  Created by Богдан Конопольський on 05.03.2023.
//

import Foundation

struct Point3 {
    
    //MARK: - Properties
    
    var x: Float
    var y: Float
    var z: Float
    
    //MARK: - Initialization
    
    init(x: Float, y: Float, z: Float) {
        self.x = x
        self.y = y
        self.z = z
    }
    
    //MARK: - Operators
    
    static func +(lhs: Point3, rhs: Vector3) -> Point3 {
        return Point3(x: lhs.x + rhs.x, y: lhs.y + rhs.y, z: lhs.z + rhs.z)
    }
    
    static func -(lhs: Point3, rhs: Point3) -> Vector3 {
        return Vector3(x: lhs.x - rhs.x, y: lhs.y - rhs.y, z: lhs.z - rhs.z)
    }
}
