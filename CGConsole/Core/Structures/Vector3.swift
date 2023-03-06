//
//  Vector3.swift
//  CGConsole
//
//  Created by Богдан Конопольський on 05.03.2023.
//

import Foundation

struct Vector3 {
    
    //MARK: - Properties
    
    var x: Float
    var y: Float
    var z: Float
    
    var length: Float {
        return sqrt(x * x + y * y + z * z)
    }
    
    var lengthSquared: Float {
        return x * x + y * y + z * z
    }
    
    //MARK: - Initialization
    
    init(x: Float, y: Float, z: Float) {
        self.x = x
        self.y = y
        self.z = z
    }
    
    //MARK: - Public methods
    
    func normalized() -> Vector3 {
        let len = length
        return Vector3(x: x / len, y: y / len, z: z / len)
    }
    
    func dot(_ other: Vector3) -> Float {
        return x * other.x + y * other.y + z * other.z
    }
    
    func cross(_ other: Vector3) -> Vector3 {
        let x = self.y * other.z - self.z * other.y
        let y = self.z * other.x - self.x * other.z
        let z = self.x * other.y - self.y * other.x
        return Vector3(x: x, y: y, z: z)
    }
    
    //MARK: - Operators
    
    static func +(lhs: Vector3, rhs: Vector3) -> Vector3 {
        return Vector3(x: lhs.x + rhs.x, y: lhs.y + rhs.y, z: lhs.z + rhs.z)
    }
    
    static func -(lhs: Vector3, rhs: Vector3) -> Vector3 {
        return Vector3(x: lhs.x - rhs.x, y: lhs.y - rhs.y, z: lhs.z - rhs.z)
    }
    
    static func *(lhs: Vector3, rhs: Float) -> Vector3 {
        return Vector3(x: lhs.x * rhs, y: lhs.y * rhs, z: lhs.z * rhs)
    }
    
    static func /(lhs: Vector3, rhs: Float) -> Vector3 {
        return Vector3(x: lhs.x / rhs, y: lhs.y / rhs, z: lhs.z / rhs)
    }
}
