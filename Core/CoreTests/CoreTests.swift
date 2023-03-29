//
//  CoreTests.swift
//  CoreTests
//
//  Created by Стефан Музика on 19.03.2023.
//

import XCTest
@testable import CGCore

final class CoreTests: XCTestCase {

    func testIfIntersectionRight1() throws {
        let sphere1: ObjectProtocol = Sphere(center: Vector3(x: 0, y: 0, z: 4), radius: 3)
        let sphere2: ObjectProtocol = Sphere(center: Vector3(x: 0, y: 0, z: 4), radius: 2)
        
        let scene1 = Scene(objects: [sphere1], light: Vector3(start: Point3(x: -1, y: -1, z: 0), end: Point3(x: 0, y: 0, z: 1)))
        let scene2 = Scene(objects: [sphere2, sphere1], light: Vector3(start: Point3(x: -1, y: -1, z: 0), end: Point3(x: 0, y: 0, z: 1)))

        let camera: CameraProtocol = Camera(origin: Vector3(x: 0, y: 0, z: 0), direction: Vector3(x: 0, y: 0, z: 1), top: Vector3(x: 0, y: 1, z: 0), fieldOfView: 100, aspectRatio: (width: 16, height: 9))

        let rayTracer1: RayTracerProtocol = RayTracer(width: 20, aspectRatio: (width: 16, height: 9), camera: camera, scene: scene1)
        let rayTracer2: RayTracerProtocol = RayTracer(width: 20, aspectRatio: (width: 16, height: 9), camera: camera, scene: scene2)

        let image1 = rayTracer1.trace()
        let image2 = rayTracer2.trace()

        XCTAssertEqual(image1, image2)
    }

    func testIfIntersectionRight2() throws {
        let sphere: ObjectProtocol = Sphere(center: Vector3(x: 0, y: 0, z: 4), radius: 3)
        let disk: ObjectProtocol = Disk(center: Vector3(x: 0, y: 0, z: 1), normal: Vector3(start: Point3(x: 0, y: 0, z: 5), end: Point3(x: 0, y: 0, z: 7)), radius: 1.5)
        let scene1 = Scene(objects: [disk], light: Vector3(start: Point3(x: -1, y: -1, z: 0), end: Point3(x: 0, y: 0, z: 1)))
        let scene2 = Scene(objects: [sphere, disk], light: Vector3(start: Point3(x: -1, y: -1, z: 0), end: Point3(x: 0, y: 0, z: 1)))

        let camera: CameraProtocol = Camera(origin: Vector3(x: 0, y: 0, z: 0), direction: Vector3(x: 0, y: 0, z: 1), top: Vector3(x: 0, y: 1, z: 0), fieldOfView: 100, aspectRatio: (width: 16, height: 9))

        let rayTracer1: RayTracerProtocol = RayTracer(width: 20, aspectRatio: (width: 16, height: 9), camera: camera, scene: scene1)
        let rayTracer2: RayTracerProtocol = RayTracer(width: 20, aspectRatio: (width: 16, height: 9), camera: camera, scene: scene2)

        let image1 = rayTracer1.trace()
        let image2 = rayTracer2.trace()

        XCTAssertEqual(image1, image2)
    }
    
    func testIfIntersectionWrong() throws {
        let sphere: ObjectProtocol = Sphere(center: Vector3(x: 0, y: 0, z: 4), radius: 3)
        let plane1: ObjectProtocol = Plane(point: Vector3(x: 3, y: -2, z: 1), normal:Vector3(start: Point3(x: 0, y: 0, z: 0), end: Point3(x: -8, y: 1, z: 1)))
        let plane2: ObjectProtocol = Plane(point: Vector3(x: -3, y: 2, z: -1), normal:Vector3(start: Point3(x: 0, y: 0, z: 0), end: Point3(x: 7, y: 1, z: 1)))

        
        let scene1 = Scene(objects: [sphere, plane1], light: Vector3(start: Point3(x: -1, y: -1, z: 0), end: Point3(x: 0, y: 0, z: 1)))
        let scene2 = Scene(objects: [sphere, plane2], light: Vector3(start: Point3(x: -1, y: -1, z: 0), end: Point3(x: 0, y: 0, z: 1)))

        let camera: CameraProtocol = Camera(origin: Vector3(x: 0, y: 0, z: 0), direction: Vector3(x: 0, y: 0, z: 1), top: Vector3(x: 0, y: 1, z: 0), fieldOfView: 100, aspectRatio: (width: 16, height: 9))

        let rayTracer1: RayTracerProtocol = RayTracer(width: 20, aspectRatio: (width: 16, height: 9), camera: camera, scene: scene1)
        let rayTracer2: RayTracerProtocol = RayTracer(width: 20, aspectRatio: (width: 16, height: 9), camera: camera, scene: scene2)

        let image1 = rayTracer1.trace()
        let image2 = rayTracer2.trace()

        XCTAssertNotEqual(image1, image2)
    }
    
    func testNegativeRadius() throws {
        do {
            let sphere: ObjectProtocol = try Sphere(center: Vector3(x: 0, y: 0, z: 4), radius: -3)
            let disk: ObjectProtocol = try Disk(center: Vector3(x: 0, y: 0, z: 1), normal: Vector3(start: Point3(x: 0, y: 0, z: 5), end: Point3(x: 0, y: 0, z: 7)), radius: -0.5)
            XCTFail("No check on radius negativeness.")
        }
        catch {
            return   
        }
    }
}
