//
//  UIView+Constraintable.swift
//  Declayout
//
//  Created by Bayu Kurniawan on 8/16/21.
//

import UIKit

@propertyWrapper
private struct UsesAutoLayout<T: UIView> {
   var wrappedValue: T {
    didSet {
      wrappedValue.translatesAutoresizingMaskIntoConstraints = false
    }
  }
  
   init(wrappedValue: T) {
    self.wrappedValue = wrappedValue
  }
}

public enum LayoutAttribute {}

public protocol Constraintable: Dimensionable, Anchorable, Centerable {
  typealias ConstraintParameter = (inout Self) -> Void
}

extension Constraintable where Self: UIView {
  
  @discardableResult
  public func constraints(_ with: ConstraintParameter) -> Self {
    @UsesAutoLayout var this = self
    with(&this)
    return this
  }
  
  @discardableResult
  public func addConstraints(_ constraints: [Constraint]) -> Self {
    let constraints = constraints.map { $0.constraint }
    self.addConstraints(constraints)
    return self
  }
  
  @discardableResult
  public func addSubviews(_ views: [UIView]) -> Self {
    views.forEach { view in
      self.addSubview(view)
    }
    return self
  }
}

extension UIView: Constraintable {}

extension UIStackView {
  @discardableResult
  public func addArrangedSubviews(_ views: [UIView]) -> Self {
    views.forEach { view in
      self.addArrangedSubview(view)
    }
    return self
  }
}


