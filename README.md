# WrapStack

WrapStack is way to display views or content by vertically wrapping them in a horizontal pattern.

[![SwiftPM compatible](https://img.shields.io/badge/SwiftPM-compatible-orange.svg)](#swift-package-manager) ![Swift 5.1](https://img.shields.io/badge/Swift-5.1-orange.svg) ![platforms](https://img.shields.io/badge/platform-iOS%20%7C%20macOS%20%7C%20tvOS%20%7C%20watchOS-lightgrey.svg) ![languages](https://img.shields.io/badge/language-Swift%20%7C%20SwiftUI-lightgrey.svg)

# Requirements
* iOS 13 or 
* macOS 10.15

# Installation
There are two ways to add to your own project
1. Add as a Swift Package Dependency 
2. Import this project into your Xcode project and add under Frameworks and Libraries. 

```http
https://github.com/jonnyholland/WrapStack
````
````swift
import WrapStack
````
````swift
static let imageNames: [String] = ["plus", 
                                  "minus",
                                  "person",
                                  "trash",
                                  "doc",
                                  "paperplane",
                                  "newspaper"]
````
````swift
WrapStack(imageNames, id: \.self) { imageName in 
    Image(systemName: imageName)
}
````
````swift
WrapStack(imageNames, id: \.self) { imageName in 
    Text(imageName)
}
````
````swift
WrapStack(imageNames, id: \.self) { imageName in 
    Image(systemName: imageName)
    Text(imageName)
}
````
