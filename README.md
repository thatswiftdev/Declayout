# Declayout

Write simple and declarative-_ish_ Auto Layout constraints with Swift.

## Contents

- [Installation](#installation)
- [Usage](#usage)
- [Credits](#credits)
- [License](#license)

## Installation

### Cocoapods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following commands:

```bash
$ gem install cocoapods
```

To integrate Declayout into your Xcode project using CocoaPods, add this line into your `Podfile`:

```ruby
pod 'Declayout'
```
Then, run the following command:

```bash
$ pod install
```

## Usage

### Quick Start

```swift
import Declayout

final class ViewController: UIViewController {
  
  private lazy var blueBox = UIView.make {
    $0.backgroundColor = .systemBlue
    
    // Constraints code example, in the same block where the view's properties defined.
    $0.dimension(400)
      .center(to: view)
  }
  
  private lazy var redBox = UIView.make {
    $0.backgroundColor = .systemRed
    $0.edges(to: blueBox, 50)
      .center(to: blueBox)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubviews([
      self.blueBox
        .addSubviews([self.redBox])
    ])
  }
}
```

## Credits
- Bayu Kurniawan ([@overheardswift](https://twitter.com/overheardswift))

## License
Declayout is released under the MIT license. See LICENSE for details.
