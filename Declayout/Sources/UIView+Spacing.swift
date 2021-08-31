//
//  Declayout
//  Created by Bayu Kurniawan (@overheardswift).
//

import UIKit

public protocol Spacingable {
  typealias LayoutAnchor = LayoutAttribute.Anchor
  func top(to view: Constraintable, of anchor: LayoutAnchor, _ constant: CGFloat) -> Self
  func leading(to view: Constraintable, of anchor: LayoutAnchor, _ constant: CGFloat) -> Self
  func bottom(to view: Constraintable, of anchor: LayoutAnchor, _ constant: CGFloat) -> Self
  func trailing(to view: Constraintable, of anchor: LayoutAnchor, _ constant: CGFloat) -> Self
  func horizontalPadding(to view: Constraintable, _ constant: CGFloat) -> Self
  func verticalPadding(to view: Constraintable, _ constant: CGFloat) -> Self
  func edges(to view: Constraintable, _ constant: CGFloat, _ isSafeArea: Bool) -> Self
  func anchor<T: AnyObject>(_ type: LayoutAnchor) -> T
}

extension LayoutAttribute {
  
  public enum Anchor {
    case top(_ isSafeArea: Bool = false)
    case bottom(_ isSafeArea: Bool = false)
    case leading(_ isSafeArea: Bool = false)
    case trailing(_ isSafeArea: Bool = false)
    case centerY(_ isSafeArea: Bool = false)
    case centerX(_ isSafeArea: Bool = false)
  }
  
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

extension Spacingable where Self: UIView {
  
  public func anchor<T: AnyObject>(_ type: LayoutAnchor) -> T {
    let safeArea = self.safeAreaLayoutGuide
    switch type {
    case let .top(isSafeArea):
      return (isSafeArea ? safeArea.topAnchor : topAnchor) as! T
    case let .bottom(isSafeArea):
      return (isSafeArea ? safeArea.bottomAnchor : self.bottomAnchor) as! T
    case let .leading(isSafeArea):
      return (isSafeArea ? safeArea.leadingAnchor : self.leadingAnchor) as! T
    case let .trailing(isSafeArea):
      return (isSafeArea ? safeArea.trailingAnchor : self.trailingAnchor) as! T
    case let .centerY(isSafeArea):
      return (isSafeArea ? safeArea.centerYAnchor : self.centerYAnchor) as! T
    case let .centerX(isSafeArea):
      return (isSafeArea ? safeArea.centerXAnchor : self.centerXAnchor) as! T
    }
  }
  
  @discardableResult
  public func top(to view: Constraintable, of anchor: LayoutAnchor = .top(), _ constant: CGFloat = .zero) -> Self {
    view.addSubviews([self])
    topAnchor.constraint(equalTo: view.anchor(anchor), constant: constant).activated()
    return self
  }
  
  @discardableResult
  public func leading(to view: Constraintable, of anchor: LayoutAnchor = .leading(), _ constant: CGFloat = .zero) -> Self {
    view.addSubviews([self])
    leadingAnchor.constraint(equalTo: view.anchor(anchor), constant: constant).activated()
    return self
  }
  
  @discardableResult
  public func bottom(to view: Constraintable, of anchor: LayoutAnchor = .bottom(), _ constant: CGFloat = .zero) -> Self {
    view.addSubviews([self])
    bottomAnchor.constraint(equalTo: view.anchor(anchor), constant: -constant).activated()
    return self
  }
  
  @discardableResult
  public func trailing(to view: Constraintable, of anchor: LayoutAnchor = .trailing(), _ constant: CGFloat = .zero) -> Self {
    view.addSubviews([self])
    trailingAnchor.constraint(equalTo: view.anchor(anchor), constant: -constant).activated()
    return self
  }
  
  @discardableResult
  public func horizontalPadding(to view: Constraintable, _ constant: CGFloat = .zero) -> Self {
    view.addSubviews([self])
    return leading(to: view, constant).trailing(to: view, constant)
  }
  
  @discardableResult
  public func verticalPadding(to view: Constraintable, _ constant: CGFloat = .zero) -> Self {
    view.addSubviews([self])
    return top(to: view, constant).bottom(to: view, constant)
  }
  
  @discardableResult
  public func edges(to view: Constraintable, _ constant: CGFloat = .zero, _ isSafeArea: Bool = false) -> Self {
    return self.top(to: view, of: .top(isSafeArea), constant)
      .leading(to: view, of: .leading(isSafeArea), constant)
      .bottom(to: view, of: .bottom(isSafeArea), constant)
      .trailing(to: view, of: .trailing(isSafeArea), constant)
  }
}
