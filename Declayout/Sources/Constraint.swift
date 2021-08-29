//
//  Constraint.swift
//  Declayout
//
//  Created by Bayu Kurniawan on 8/16/21.
//

import UIKit

public enum Constraint {
  
  case center(
        _ attribute: LayoutAttribute.Center,
        from: UIView,
        relation: NSLayoutConstraint.Relation = .equal,
        to: UIView?,
        multiplier: CGFloat = 1,
        constant: CGFloat = .zero
       )
  
  case spacing(
        from: UIView,
        _ attribute1: LayoutAttribute.Spacing,
        relation: NSLayoutConstraint.Relation = .equal,
        to: UIView?,
        _ attribute2: LayoutAttribute.Spacing?,
        multiplier: CGFloat = 1,
        constant: CGFloat = .zero
       )
  
  case dimension(
        from: UIView,
        _ attribute1: LayoutAttribute.Dimension,
        relation: NSLayoutConstraint.Relation = .equal,
        to: UIView?,
        _ attribute2: LayoutAttribute.Dimension?,
        multiplier: CGFloat = 1,
        constant: CGFloat = .zero
       )
  
  var constraint: NSLayoutConstraint {
    switch self {
    case let .spacing(firstView, attribute1, relation, secondView, attribute2, multiplier, constant):
      return makeConstraint(from: firstView, attribute1.value, relation: relation, to: secondView, attribute2?.value ?? .notAnAttribute, multiplier: multiplier, constant: constant)
    case let .center(attribute, firstView, relation, secondView, multiplier, constant):
      return makeConstraint(from: firstView, attribute.value, relation: relation, to: secondView, attribute.value, multiplier: multiplier, constant: constant)
    case let .dimension(firstView, attribute1, relation, secondView, attribute2, multiplier, constant):
      return makeConstraint(from: firstView, attribute1.value, relation: relation, to: secondView, attribute2?.value ?? .notAnAttribute, multiplier: multiplier, constant: constant)
    }
  }
  
  private func makeConstraint(from firstView: UIView, _ attribute1: NSLayoutConstraint.Attribute, relation: NSLayoutConstraint.Relation = .equal, to secondView: UIView?, _ attribute2: NSLayoutConstraint.Attribute, multiplier: CGFloat, constant: CGFloat) -> NSLayoutConstraint {
    return NSLayoutConstraint(item: firstView, attribute: attribute1, relatedBy: relation, toItem: secondView, attribute: attribute2, multiplier: multiplier, constant: constant)
  }
  
}


extension NSLayoutConstraint {
  public func activated() {
    NSLayoutConstraint.activate([self])
  }
}

