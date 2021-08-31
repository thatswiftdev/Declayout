//
//  Declayout
//  Created by Bayu Kurniawan (@overheardswift).
//
import XCTest
import Declayout

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
}
