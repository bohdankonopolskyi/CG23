//
//  Material.swift
//  CGConsole
//
//  Created by Богдан Конопольський on 28.02.2023.
//

import Foundation

public struct Material {
    
    //MARK: - Properties
    
   public let color: Vector3
   public let diffuse: Float
   public let specular: Float
    
    //MARK: - Initialization
    
    public init(color: Vector3, diffuse: Float, specular: Float) {
        self.color = color
        self.diffuse = diffuse
        self.specular = specular
    }
}
