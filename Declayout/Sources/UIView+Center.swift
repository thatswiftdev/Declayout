//
//  UIView+Center.swift
//  Declayout
//
//  Created by Bayu Kurniawan on 8/16/21.
//

import UIKit

public protocol Centerable {
  typealias LayoutCenter = LayoutAttribute.Center
  func center(to view: UIView, center: LayoutCenter?, _ constant: CGFloat) -> Self
}

extension LayoutAttribute {
  public enum Center  {
    case horizontal
    case vertical
    
    public var value: NSLayoutConstraint.Attribute {
      switch self {
      case .horizontal: return .centerX
      case .vertical: return .centerY
      }
    }
  }
}

extension UIView {
  
  @discardableResult
  public func center(to view: UIView, center: LayoutCenter? = nil, _ constant: CGFloat = .zero) -> Self {
    view.addSubview(self)
    switch center {
    case .horizontal:
      centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant).activated()
    case .vertical:
      centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).activated()
    case .none:
      centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant).activated()
      centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).activated()
    }
    return self
  }
}

