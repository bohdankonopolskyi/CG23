//
//  ObjectProtocol.swift
//  CGConsole
//
//  Created by Богдан Конопольський on 07.03.2023.
//

import Foundation

public protocol ObjectProtocol {
    var material: Material { get }
    func normal(at point: Vector3) -> Vector3
    func intersects(with ray: Ray) -> Float?
    func reflects(lightRay: Ray, at surfacePoint: Vector3) -> Float?
}

public extension ObjectProtocol {
    func reflects(lightRay: Ray, at surfacePoint: Vector3) -> Float? {
        return lightRay.direction.dot(normal(at: surfacePoint))
    }
}
