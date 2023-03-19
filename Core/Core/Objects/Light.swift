//
//  Light.swift
//  CGConsole
//
//  Created by Богдан Конопольський on 08.03.2023.
//

import Foundation

public struct Light {
    
    //MARK: - Properties
    
    let ray: Ray
    let intensity: Float
    
    //MARK: - Initialization
    
    public init(ray: Ray, intensity: Float) {
        self.ray = ray
        self.intensity = intensity
    }
}
