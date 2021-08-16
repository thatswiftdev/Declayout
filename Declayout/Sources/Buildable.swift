//
//  Buildable.swift
//  Declayout
//
//  Created by Bayu Kurniawan on 8/16/21.
//

import Foundation

public protocol Buildable {
  typealias BuilderParameter = (inout Self) -> Void
  init()
}

extension Buildable {
  public static func make(_ with: BuilderParameter) -> Self {
    var this = self.init()
    with(&this)
    return this
  }
}

extension NSObject: Buildable {}
