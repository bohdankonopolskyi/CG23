//
//  main.swift
//  CGConsole
//
//  Created by Богдан Конопольський on 19.03.2023.
//  Contributed by StefanErrorerko

import Foundation
import CGCore


let imageWidth = 40

do {
  let camera: CameraProtocol = Camera(origin: Vector3(x: 0, y: 0, z: 0), direction: Vector3(x: 0, y: 0, z: 1), top: Vector3(x: 0, y: 1, z: 0), fieldOfView: 60, aspectRatio: (width: 16.0, height: 9.0))

  let sphere: ObjectProtocol = try Sphere(center: Vector3(x: 0, y: 0, z: 4), radius: 3)
  let disk: ObjectProtocol = try Disk(center: Vector3(x: 0, y: 0, z: 1), normal: Vector3(start: Point3(x: 0, y: 0, z: 5), end: Point3(x: 0, y: 0, z: 7)), radius: 1.5)
  let plane: ObjectProtocol = Plane(point: Vector3(x: 1, y: 2, z: 1), normal:Vector3(start: Point3(x: 0, y: 0, z: 0), end: Point3(x: -10, y: 1, z: 1)))

  let scene = Scene(objects: [sphere, disk, plane], light: Vector3(start: Point3(x: -1, y: -1, z: 0), end: Point3(x: 0, y: 0, z: 1)))

  let rayTracer: RayTracerProtocol = RayTracer(width: imageWidth, aspectRatio: (width: 16, height: 9), camera: camera, scene: scene)
  let image = rayTracer.trace()

  Presenter.present(image: image)

  exit(0)
}
catch {
  print("Some issues occured while objects initialisation process")
  exit(0)
}
