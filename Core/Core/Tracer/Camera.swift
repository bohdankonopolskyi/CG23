//
//  Camera.swift
//  CGConsole
//
//  Created by Богдан Конопольський on 05.03.2023.
//

import Foundation

public protocol CameraProtocol: AnyObject {
    var origin: Vector3 { get }
    func getRay(u: Float, v: Float) -> Ray
}

public class Camera {
    
    //MARK: - Properties
    
    public let origin: Vector3
    public let direction: Vector3
    public let fieldOfView: Float
    public let lowerLeftCorner: Vector3
    public let horizontal: Vector3
    public let vertical: Vector3
    
    //MARK: - Initialization
    
    public init(origin: Vector3, direction: Vector3, top: Vector3, fieldOfView: Float, aspectRatio: (width: Float, height: Float)) {
        self.origin = origin
        self.direction = direction
        self.fieldOfView = fieldOfView
        
        let tetha = fieldOfView * Float.pi / 180
        let h = tan(tetha)
        let viewPortHeight = 2.0 * h
        let viewPortWidth = (aspectRatio.width / aspectRatio.height) * viewPortHeight
        
        let w = (origin - direction).normalized()
        let u = top.cross(w).normalized()
        let v = w.cross(u)
        
        let focusDistance = (origin - direction).length
        
        self.horizontal = u * (focusDistance * viewPortWidth)
        self.vertical = v * (focusDistance * viewPortHeight)
        self.lowerLeftCorner = origin - horizontal / 2 - vertical / 2 - (w * focusDistance)
    }
}

//MARK: - Public methods

extension Camera: CameraProtocol {
    public func getRay(u: Float, v: Float) -> Ray {
        return Ray(origin: origin, direction: lowerLeftCorner + horizontal * u + vertical * v - origin)
    }
}
