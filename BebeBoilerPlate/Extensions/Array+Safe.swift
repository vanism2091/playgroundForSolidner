//
//  Array+Safe.swift
//  BebeBoilerPlate
//
//  Created by sei on 11/7/23.
//

import Foundation

extension Array {
    subscript(safe index: Array.Index) -> Element? {
        get { indices ~= index ? self[index] : nil }
        set {
            guard let element = newValue else {
                return
            }
            self[index] = element
        }
    }
}
