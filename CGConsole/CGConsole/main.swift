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

let camera: CameraProtocol = Camera(origin: Vector3(x: 0, y: 0, z: 0), direction: Vector3(x: 0, y: 0, z: 1), top: Vector3(x: 0, y: 1, z: 0), fieldOfView: 100, aspectRatio: (width: 16.0, height: 9.0))

let sphere: ObjectProtocol = Sphere(center: Vector3(x: 0, y: 0, z: 4), radius: 3)
let disk: ObjectProtocol = Disk(center: Vector3(x: 5, y: 5, z: 5), normal: Vector3(x: 1, y: 1, z: 1), radius: 2)
let plane: ObjectProtocol = Plane(point: Vector3(start: Point3(x: 0, y: 0, z: 0), end: Point3(x: -10, y: 1, z: 1)), normal: Vector3(x: 1, y: 2, z: 1))

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

let scene = Scene(objects: [sphere, disk], light: Vector3(x: 0, y: 0, z: 0))

let rayTracer: RayTracerProtocol = RayTracer(width: imageWidth, aspectRatio: (width: 16, height: 9), camera: camera, scene: scene)
let image = rayTracer.trace()

Presenter.present(image: image)

exit(0)
