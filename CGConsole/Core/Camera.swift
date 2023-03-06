//
//  Camera.swift
//  CGConsole
//
//  Created by Богдан Конопольський on 05.03.2023.
//

import Foundation

class Camera {
    
    //MARK: - Properties
    
    var origin: Vector3 = Vector3(x: 0, y: 0, z: 0)
    var direction: Vector3 = Vector3(x: 0, y: 0, z: 1)
    var fieldOfView: Float
    var lowerLeftCorner: Vector3
    var horizontal: Vector3
    var vertical: Vector3
    
    //MARK: - Initialization
    
    init(origin: Vector3, direction: Vector3, top: Vector3, fieldOfView: Float, aspectRatio: Float) {
        self.origin = origin
        self.direction = direction
        self.fieldOfView = fieldOfView
        
        let tetha = fieldOfView * Float.pi / 180
        let h = tan(tetha)
        let viewPortHeight = 2.0 * h
        let viewPortWidth = aspectRatio * viewPortHeight
        
        print(tetha, "h= ", h, viewPortHeight, viewPortWidth, separator: " ")
        
        let w = (origin - direction).normalized()
        let u = top.cross(w).normalized()
        let v = w.cross(u)
        print(w, u, v, separator: " ")
        
        let focusDistance = (origin - direction).length
        print("focus= ", focusDistance)
        
        self.horizontal = u * (focusDistance * viewPortWidth)
        self.vertical = v * (focusDistance * viewPortHeight)
        self.lowerLeftCorner = origin - horizontal / 2 - vertical / 2 - (w * focusDistance)
        print(self.horizontal, self.vertical, self.lowerLeftCorner, separator: " ")
    }
    
    //MARK: - Public methods
    
    func getRay(u: Float, v: Float) -> Ray {
        return Ray(origin: origin, direction: lowerLeftCorner + horizontal * u + vertical * v - origin)
    }
}
