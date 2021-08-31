//
//  Declayout
//  Created by Bayu Kurniawan (@overheardswift).
//

import UIKit

public protocol Centerable {
  typealias LayoutCenter = LayoutAttribute.Center
  func center(_ axis: LayoutCenter?, to view: Constraintable, _ isSafeArea: Bool, _ constant: CGFloat) -> Self
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

extension Centerable where Self: UIView {
  
  @discardableResult
  public func center(_ axis: LayoutCenter? = nil, to view: Constraintable,_ isSafeArea: Bool = false, _ constant: CGFloat = .zero) -> Self {
    view.addSubviews([self])
    switch axis {
    case .horizontal:
      centerHorizontal(to: view, isSafeArea, constant: constant)
    case .vertical:
      centerVertical(to: view, isSafeArea, constant: constant)
    case .none:
      centerHorizontal(to: view, isSafeArea, constant: constant)
      centerVertical(to: view, isSafeArea, constant: constant)
    }
    return self
  }
  
  private func centerHorizontal(to view: Constraintable, _ isSafeArea: Bool = false, constant: CGFloat = .zero) {
    centerXAnchor.constraint(equalTo: view.anchor(.centerX(isSafeArea)), constant: constant).activated()
  }
  
  private func centerVertical(to view: Constraintable, _ isSafeArea: Bool = false, constant: CGFloat = .zero) {
    centerYAnchor.constraint(equalTo: view.anchor(.centerY(isSafeArea)), constant: constant).activated()
  }
}

