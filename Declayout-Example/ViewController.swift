//
//  ViewController.swift
//  Declayout-Example
//
//  Created by Bayu Kurniawan on 8/16/21.
//

import UIKit
import Declayout

final class ViewController: UIViewController {
  
  private lazy var blueBox = UIView.make {
    $0.backgroundColor = .systemBlue
    $0.dimension(400)
      .center(to: view)
  }
  
  private lazy var redBox = UIView.make {
    $0.backgroundColor = .systemRed
    $0.edges(to: blueBox, 50)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubviews([
      self.blueBox
        .addSubviews([self.redBox])
    ])
  }
}
