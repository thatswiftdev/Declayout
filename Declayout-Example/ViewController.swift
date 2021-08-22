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
  
  private lazy var stackView = UIStackView.make {
    $0.axis = .vertical
    $0.spacing = 8
    $0.distribution = .fillEqually
    $0.center(to: redBox)
      .edges(to: redBox, 40)
  }
  
  private lazy var label = UILabel.make {
    $0.textColor = .black
    $0.font = .systemFont(ofSize: 24, weight: .medium)
    $0.textAlignment = .center
    $0.text = "Box-In-A-Box-In-A-Box"
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubviews([
      self.blueBox
        .addSubviews([
          self.redBox
            .addSubviews([
              self.stackView
                .addArrangedSubviews([
                  makeView(title: "#1", color: .systemOrange),
                  makeView(title: "#2", color: .systemYellow),
                  makeView(title: "#3", color: .systemGreen)
                ])
            ])
        ]),
      self.label
    ])
    .addConstraints([
      .spacing(from: label, .top(), to: blueBox, .bottom()),
      .center(.horizontal, from: label, to: blueBox)
    ])

  }
  
  private func makeView(title: String, color: UIColor) -> UIView {
    return UIView.make { view in
      let label = UILabel.make {
        $0.text = title
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 24, weight: .semibold)
        $0.center(to: view)
      }
      view.backgroundColor = color
      view.addSubview(label)
    }
  }
}

