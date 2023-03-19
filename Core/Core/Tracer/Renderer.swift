//
//  ViewPort.swift
//  CGConsole
//
//  Created by Богдан Конопольський on 07.03.2023.
//

import Foundation

public protocol RendererProtocol {
    func render() -> Array<Array<Float>>
}

public class Renderer {
    
    //MARK: - Properties
    
    public let imageWidth: Int
    public let imageHeight: Int
    public let camera: CameraProtocol
    public let scene: Scene
    
    //MARK: - Initialization
    
    public init(width: Int, height: Int, camera: CameraProtocol, scene: Scene) {
        self.imageWidth = width
        self.imageHeight = height
        self.camera = camera
        self.scene = scene
    }
    
    public convenience init(width: Int, aspectRatio: (width:Float, height:Float), camera: CameraProtocol, scene: Scene) {
        let height = Int(Float(width) / aspectRatio.width * aspectRatio.height)
        self.init(width: width, height: height, camera: camera, scene: scene)
    }
    
    //MARK: - Private methods
    
    private func getClosestObject(of objects: [ObjectProtocol], for ray: Ray) -> (object: ObjectProtocol?, t: Float?) {
        var closestObject: ObjectProtocol? = nil
        var closestT: Float? = nil
        
        objects.forEach { object in
            if let t = object.intersects(with: ray) {
                if closestT == nil || t < closestT! {
                    closestObject = object
                    closestT = t
                }
            }
        }
        return (object: closestObject, t: closestT)
    }
}

//MARK: - Public methods

extension Renderer: RendererProtocol {
    public func render() -> Array<Array<Float>> {
        var image = Array(repeating: Array(repeating: Float(0), count: imageWidth), count: imageHeight)
        
        for y in 0..<imageHeight {
            for x in (0..<imageWidth).reversed() {
                
                let u = Float(x) / Float(imageWidth - 1)
                let v = Float(y) / Float(imageHeight - 1)
                let castRay = camera.getRay(u: u, v: v)
                
                let closest = getClosestObject(of: scene.objects, for: castRay)
                
                if let object = closest.object, let t = closest.t {
                    
                    let point = castRay.pointAt(t: t)
                    
                    image[y][x] = object.reflects(lightRay: scene.lights[0].ray, at: point) ?? 0
                }
            }
        }
        return image
    }
}
