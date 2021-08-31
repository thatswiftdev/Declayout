//
//  Declayout
//  Created by Bayu Kurniawan (@overheardswift).
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

public protocol Constraintable: Dimensionable, Spacingable, Centerable {
  typealias ViewParams = (inout Self) -> Void
  @discardableResult
  func addSubviews(_ views: [UIView]) -> Self
  init()
}

extension Constraintable where Self: UIView {
  
  @discardableResult
  public static func make(_ with: ViewParams) -> Self {
    @UsesAutoLayout var this: Self
    this = self.init()
    with(&this)
    return this
  }
  
  @discardableResult
  public func addCustomConstraints(_ constraints: [Constraint]) -> Self {
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


