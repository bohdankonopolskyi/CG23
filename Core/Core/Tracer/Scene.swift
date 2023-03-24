//
//  Scene.swift
//  CGConsole
//
//  Created by Богдан Конопольський on 08.03.2023.
//

import Foundation

public class Scene {
    
    //MARK: - Properties
    
    private var lightVector: Vector3
    public var objects: [ObjectProtocol] = []
    public var light: Vector3 {
        get {
            return self.lightVector
        }
        
        set {
            lightVector = newValue.normalized()
        }
    }
    
    //MARK: - Initialization
    
    public init(objects: [ObjectProtocol], light: Vector3) {
        self.objects = objects
        self.lightVector = light.normalized()
    }
}
