//
//  Presenter.swift
//  CGConsole
//
//  Created by Богдан Конопольський on 15.03.2023.
//

import Foundation

protocol PresenterProtocol {
    static func present(image: Array<Array<Float>>)
}

struct Presenter: PresenterProtocol {
    static func present(image: Array<Array<Float>>) {
        image.forEach { row in
            row.forEach { value in
                var filler: String
                
                switch value {
                case ..<0:
                    filler = "   "
                case 0..<0.2:
                    filler = ".  "
                case 0.2..<0.5:
                    filler = "*  "
                case 0.5..<0.8:
                    filler = "o  "
                default:
                    filler = "#  "
                }
                print(filler, terminator: " ")
            }
            print("\n")
        }
    }
}
