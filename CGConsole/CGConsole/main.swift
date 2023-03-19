//
//  main.swift
//  CGConsole
//
//  Created by Богдан Конопольський on 19.03.2023.
//

import Foundation
import CGCore


let aspectRatio: Float = 16.0 / 9.0
let imageWidth = 40
let imageHeight = Int(Float(imageWidth) / aspectRatio)

let lightVector =  Vector3(x: 3, y: 1, z: 3).normalized()
let light = Ray(origin: Vector3(x: 2, y: 3, z: 2), direction: lightVector)
let lightRay = Light(ray: light, intensity: 0)
print(light.pointAt(t: 1))

let material = Material(color: Vector3(x: 0, y: 0, z: 0), diffuse: 1, specular: 1)

let sphere: ObjectProtocol = Sphere(center: Vector3(x: 0, y: 0, z: 4), radius: 3, material: material)

let disk = Disk(center: Vector3(x: 0, y: 0, z: 10), normal: Vector3(x: 0, y: 0, z: 9), radius: 2, material: material)

let camera = Camera(origin: Vector3(x: 0, y: 0, z: 0), direction: Vector3(x: 0, y: 0, z: 1), top: Vector3(x: 0, y: 1, z: 0), fieldOfView: 100, aspectRatio: (width: 16.0, height: 9.0))
let plane = Plane(point: Vector3(start: Point3(x: 0, y: 0, z: 0), end: Point3(x: -100, y: 1, z: 1)), normal: Vector3(x: 1, y: -1, z: 0), material: material)

let startingPoint =     Vector3(start: Point3(x: 0, y: 0, z: 0), end: Point3(x: 0, y: 0, z: 0))
let directionVector =   Vector3(x: 1, y: 0, z: 0)
let pointOnPlane =      Vector3(start: Point3(x: 0, y: 0, z: 0), end: Point3(x: 3, y: 1, z: 1))
let normalVector =      Vector3(x: -1, y: -1, z: 0)

//print(directionVector.image[y][x](normalVector))
//if let intersection = plane.intersects(with: light) {
//    print("Intersection point: (\(intersection.x), \(intersection.y), \(intersection.z))")
//} else {
//    print("Vector is parallel to plane")
//}

let scene = Scene(objects: [sphere, disk], lights: [lightRay])

let render = Renderer(width: imageWidth, aspectRatio: (width: 16, height: 9), camera: camera, scene: scene)
let image = render.render()
for y in 0..<render.imageHeight {
    for x in (0..<render.imageWidth) {

//        let u = Float(x) / Float(imageWidth - 1)
//        let v = Float(y) / Float(imageHeight - 1)
//        let ray = camera.getRay(u: u, v: v)
//        if let intersection = sphere.intersects(with: ray) {

//           if let image[y][x] = sphere.reflects(lightRay: light, at: light.pointAt(t: intersection))
//            {
                if image[y][x] < 0 {
                    print("   ", terminator: "")
                } else if image[y][x] > 0 && image[y][x] < 0.2{
                    print(".  ", terminator: "")
                } else if image[y][x] > 0.2 && image[y][x] < 0.5 {
                    print("*  ", terminator: "")
                } else if image[y][x] > 0.5 && image[y][x] < 0.8 {
                    print("O  ", terminator: "")
                } else {
                    print("#  ", terminator: "")
                }
//            }

//        }
//        else {
//            print("   ", terminator: "")
//        }
    }
    print("\n")
}

exit(0)
