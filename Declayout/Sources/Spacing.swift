//
//  Spacing.swift
//  Declayout
//
//  Created by Bayu Kurniawan on 8/16/21.
//

import UIKit

extension LayoutAttribute {

  public enum Spacing {
    case top(_ isMargin: Bool = false)
    case bottom(_ isMargin: Bool = false)
    case left(_ isMargin: Bool = false)
    case leading(_ isMargin: Bool = false)
    case right(_ isMargin: Bool = false)
    case trailing(_ isMargin: Bool = false)
    
    public var value: NSLayoutConstraint.Attribute {
      switch self {
      case let .top(isMargin):
        return isMargin ? .topMargin : .top
      case let .left(isMargin):
        return isMargin ? .leftMargin : .left
      case let .leading(isMargin):
        return isMargin ? .leadingMargin : .leading
      case let .bottom(isMargin):
        return isMargin ? .bottomMargin : .bottom
      case let .right(isMargin):
        return isMargin ? .rightMargin : .right
      case let .trailing(isMargin):
        return isMargin ? .trailingMargin : .trailing
      }
    }
  }
}

