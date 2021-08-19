//
//  DeclayoutTests.swift
//  DeclayoutTests
//
//  Created by Bayu Kurniawan on 8/16/21.
//

import XCTest
@testable import Declayout

class DeclayoutTests: XCTestCase {

  func test_view_translatesAutoresizingMaskIntoConstraintIsFalse() {

    let view = UIView.make { $0 = UIView() }
    
    XCTAssertEqual(view.translatesAutoresizingMaskIntoConstraints, false)
  }
  
  func test_view_constraintsIsEmpty() {
    
    let view = UIView.make { $0 = UIView() }
  
    XCTAssertTrue(view.constraints.isEmpty)
  }
  
  func test_view_constraintsIsNotEmpty() {
    
    let view = UIView.make { $0 = UIView() }
    _ = UIView.make {
      $0.center(.horizontal, to: view)
    }
    
    XCTAssertEqual(view.constraints.isEmpty, false)
  }
  
  func test_view_hasOneConstraint() {
    let view = UIView.make { $0 = UIView() }
    _ = UIView.make {
      $0.center(.horizontal, to: view)
    }
    
    XCTAssertEqual(view.constraints.count, 1)
  }
  
  func test_view_hasTwoConstraints() {
    let view = UIView.make { $0 = UIView() }
    _ = UIView.make {
      $0.center(to: view)
    }
    
    XCTAssertEqual(view.constraints.count, 2)
  }
  
}
