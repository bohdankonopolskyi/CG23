//
//  Vector3.swift
//  Core
//
//  Created by Богдан Конопольський on 19.03.2023.
//

import Foundation

public struct Vector3 {
    
    //MARK: - Properties
    
    public var x: Float
    public var y: Float
    public var z: Float
    
    public var length: Float {
        return sqrt(x * x + y * y + z * z)
    }
    
    public var lengthSquared: Float {
        return x * x + y * y + z * z
    }
    
    //MARK: - Initialization
    
    public  init(x: Float, y: Float, z: Float) {
        self.x = x
        self.y = y
        self.z = z
    }
    
    public init(start: Point3, end: Point3) {
        self.x = end.x - start.x
        self.y = end.y - start.y
        self.z = end.z - start.z
    }
}

public extension Vector3
{
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

