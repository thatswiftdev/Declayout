//
//  UIView+Anchor.swift
//  Declayout
//
//  Created by Bayu Kurniawan on 8/16/21.
//

import UIKit

public protocol Anchorable {
  typealias LayoutAnchor = LayoutAttribute.Anchor
  func top(to view: UIView, of anchor: LayoutAnchor, _ constant: CGFloat) -> Self
  func leading(to view: UIView, of anchor: LayoutAnchor, _ constant: CGFloat) -> Self
  func bottom(to view: UIView, of anchor: LayoutAnchor, _ constant: CGFloat) -> Self
  func trailing(to view: UIView, of anchor: LayoutAnchor, _ constant: CGFloat) -> Self
  func edges(to view: UIView, _ constant: CGFloat) -> Self
}

extension LayoutAttribute {
  public enum Anchor {
    case top(_ isSafeArea: Bool = false)
    case bottom(_ isSafeArea: Bool = false)
    case leading(_ isSafeArea: Bool = false)
    case trailing(_ isSafeArea: Bool = false)
  }
}

extension UIView {
  
  private func anchor<T: AnyObject>(_ type: LayoutAnchor) -> T {
    let safeArea = self.safeAreaLayoutGuide
    switch type {
    case let .top(isSafeArea):
      return isSafeArea ? safeArea.topAnchor as! T : self.topAnchor as! T
    case let .bottom(isSafeArea):
      return isSafeArea ? safeArea.bottomAnchor as! T : self.bottomAnchor as! T
    case let .leading(isSafeArea):
      return isSafeArea ? safeArea.leadingAnchor as! T : self.leadingAnchor as! T
    case let .trailing(isSafeArea):
      return isSafeArea ? safeArea.trailingAnchor as! T : self.trailingAnchor as! T
    }
  }
  
  @discardableResult
  public func top(to view: UIView, of anchor: LayoutAnchor = .top(), _ constant: CGFloat = .zero) -> Self {
    view.addSubview(self)
    topAnchor.constraint(equalTo: view.anchor(anchor), constant: constant).activated()
    return self
  }
  
  @discardableResult
  public func leading(to view: UIView, of anchor: LayoutAnchor = .leading(), _ constant: CGFloat = .zero) -> Self {
    view.addSubview(self)
    leadingAnchor.constraint(equalTo: view.anchor(anchor), constant: constant).activated()
    return self
  }
  
  @discardableResult
  public func bottom(to view: UIView, of anchor: LayoutAnchor = .bottom(), _ constant: CGFloat = .zero) -> Self {
    view.addSubview(self)
    bottomAnchor.constraint(equalTo: view.anchor(anchor), constant: -constant).activated()
    return self
  }
  
  @discardableResult
  public func trailing(to view: UIView, of anchor: LayoutAnchor = .trailing(), _ constant: CGFloat = .zero) -> Self {
    view.addSubview(self)
    trailingAnchor.constraint(equalTo: view.anchor(anchor), constant: -constant).activated()
    return self
  }
  
  @discardableResult
  public func edges(to view: UIView, _ constant: CGFloat = .zero) -> Self {
    return self.top(to: view, constant)
      .leading(to: view, constant)
      .bottom(to: view, constant)
      .trailing(to: view, constant)
  }
}