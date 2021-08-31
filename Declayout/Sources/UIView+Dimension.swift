//
//  Declayout
//  Created by Bayu Kurniawan (@overheardswift).
//

import UIKit

public protocol Dimensionable  {
  typealias LayoutDimension = LayoutAttribute.Dimension
  func height(_ constant: CGFloat) -> Self
  func height(equalTo view: Constraintable, of dimension: LayoutDimension, multiplier: CGFloat) -> Self
  func width(_ constant: CGFloat) -> Self
  func width(equalTo view: Constraintable, of dimension: LayoutDimension, multiplier: CGFloat) -> Self
  func dimension(_ constant: CGFloat) -> Self
  func dimension(_ type: LayoutDimension) -> NSLayoutDimension
}

extension LayoutAttribute {
  public enum Dimension {
    case width
    case height
    
    public var value: NSLayoutConstraint.Attribute {
      switch self {
      case .width: return .width
      case .height: return .height
      }
    }
  }
}

extension Dimensionable where Self: UIView {
  
  public func dimension(_ type: LayoutDimension) -> NSLayoutDimension {
    switch type {
    case .height:
      return self.heightAnchor
    case .width:
      return self.widthAnchor
    }
  }
  
  @discardableResult
  public func height(_ constant: CGFloat) -> Self {
    heightAnchor.constraint(equalToConstant: constant).activated()
    return self
  }
  
  @discardableResult
  public func height(equalTo view: Constraintable, of dimension: LayoutDimension = .height, multiplier: CGFloat = 1) -> Self {
    view.addSubviews([self])
    heightAnchor.constraint(equalTo: view.dimension(dimension), multiplier: multiplier).activated()
    return self
  }
  
  @discardableResult
  public func width(_ constant: CGFloat) -> Self {
    widthAnchor.constraint(equalToConstant: constant).activated()
    return self
  }
  
  @discardableResult
  public func width(equalTo view: Constraintable, of dimension: LayoutDimension = .width, multiplier: CGFloat = 1) -> Self {
    view.addSubviews([self])
    widthAnchor.constraint(equalTo: view.dimension(dimension), multiplier: multiplier).activated()
    return self
  }
  
  @discardableResult
  public func dimension(_ constant: CGFloat) -> Self {
    return self.height(constant)
      .width(constant)
  }
}
