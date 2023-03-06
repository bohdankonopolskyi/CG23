//
//  main.swift
//  CGConsole
//
//  Created by Богдан Конопольський on 27.02.2023.
//

import Foundation

let camera = Camera(origin: Vector3(x: 0, y: 0, z: 0), direction: Vector3(x: 0, y: 0, z: -1), top: Vector3(x: 0, y: 1, z: 0), fieldOfView: 100, aspectRatio: 16 / 9)
let sphere = Sphere(center: Vector3(x: 0, y: 0, z: -3), radius: 3)

let aspectRatio: Float = 16.0 / 9.0
let imageWidth = 40
let imageHeight = Int(Float(imageWidth) / aspectRatio)

for y in (0..<imageHeight).reversed() {
    for x in 0..<imageWidth {
        
        let u = Float(x) / Float(imageWidth - 1)
                let v = Float(y) / Float(imageHeight - 1)
                let ray = camera.getRay(u: u, v: v)
        //print(ray)
        if sphere.hit(ray: ray, tMin: 0.1, tMax: 1).0 {
            print("#  ", terminator: "")
        }
        else {
            print("_  ", terminator: "")
        }
    }
    print("\n")
}

