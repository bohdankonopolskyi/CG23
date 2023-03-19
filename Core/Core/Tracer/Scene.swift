//
//  Scene.swift
//  CGConsole
//
//  Created by Богдан Конопольський on 08.03.2023.
//

import Foundation

public class Scene {
    
    //MARK: - Properties
    
    var objects: [ObjectProtocol] = []
    var lights: [Light] = []
    
    //MARK: - Initialization
    
    public init(objects: [ObjectProtocol], lights: [Light]) {
        self.objects = objects
        self.lights = lights
    }
}
