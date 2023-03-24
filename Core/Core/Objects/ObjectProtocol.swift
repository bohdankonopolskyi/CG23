//
//  ObjectProtocol.swift
//  CGConsole
//
//  Created by Богдан Конопольський on 07.03.2023.
//

import Foundation

public protocol ObjectProtocol {
    func normal(at point: Vector3) -> Vector3
    func intersects(with ray: Ray) -> Float?
    func reflects(lightRay: Vector3, at surfacePoint: Vector3) -> Float
}

extension ObjectProtocol {
    public func reflects(lightRay: Vector3, at surfacePoint: Vector3) -> Float {
        return normal(at: surfacePoint).dot(lightRay)
    }
}
