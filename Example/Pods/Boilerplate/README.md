[<p align="center"><img alt="Boilerplate" src="http://cdn.movieweb.com/img.news/NEnBKLdGEGLarq_1_1.jpg"></p>](#boilerplate)

# Boilerplate

![🐧 linux: ready](https://img.shields.io/badge/%F0%9F%90%A7%20linux-ready-red.svg)
![🐤 3.0: ready](https://img.shields.io/badge/🐤3.0-ready-red.svg)
[![Build Status](https://travis-ci.org/crossroadlabs/Boilerplate.svg?branch=master)](https://travis-ci.org/crossroadlabs/Boilerplate)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
![Platform OS X | iOS | tvOS | watchOS | Linux](https://img.shields.io/badge/platform-OS X | iOS | tvOS | watchOS | Linux-orange.svg)
![Swift version](https://img.shields.io/badge/Swift-2.2 | 3.0-blue.svg)
[![GitHub license](https://img.shields.io/badge/license-Apache 2.0-lightgrey.svg)](https://raw.githubusercontent.com/crossroadlabs/Regex/master/LICENSE)
[![GitHub release](https://img.shields.io/github/release/crossroadlabs/Boilerplate.svg)](https://github.com/crossroadlabs/Boilerplate/releases)

## Swift boilerplate code library with tons of useful stuff, including Swift 3.0 and Linux compatibility layers

## Goals

[<img align="left" src="https://raw.githubusercontent.com/crossroadlabs/Express/master/logo-full.png" hspace="20" height=128>](https://github.com/crossroadlabs/Express) Boilerplate library was mainly introduced to fulfill the needs of [Swift Express](https://github.com/crossroadlabs/Express) - web application server side framework for Swift. Now it's a part of Crossroad Labs Foundation.

Still we hope it will be useful for everybody else.

[May less boilerplate code be with you ;)](#examples)

## Getting started

### Installation

#### [Package Manager](https://swift.org/package-manager/)

Add the following dependency to your [Package.swift](https://github.com/apple/swift-package-manager/blob/master/Documentation/Package.swift.md):

```swift
.Package(url: "https://github.com/crossroadlabs/Boilerplate.git", majorVersion: 0)
```

Run ```swift build``` and build your app. Package manager is supported on OS X, but it's still recommended to be used on Linux only.

#### [Carthage](https://github.com/Carthage/Carthage)
Add the following to your [Cartfile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile):

```
github "crossroadlabs/Boilerplate"
```

Run `carthage update` and follow the steps as described in Carthage's [README](https://github.com/Carthage/Carthage#adding-frameworks-to-an-application).

#### [CocoaPods](http://cocoapods.org/)
Add the following to your [Podfile](http://guides.cocoapods.org/using/the-podfile.html):

```rb
pod 'Boilerplate'
```

Make sure that you are integrating your dependencies using frameworks: add `use_frameworks!` to your Podfile. Then run `pod install`.

### Examples

#### Swift 3.0:

Swift 3.0 has a pretty much different API in standard library from Swift 2.2. You can import Boilerplate and the code below (Swift 3.0 style) will just work with your Swift 2.2 compiler:

```swift
var array = ["a", "b", "c"]
        
array.append(contentsOf: ["e"]) //this is not correct in Swift 2.2 without Boilerplate
```

#### Useful utility classes (like Timeout):

Just a quick example, showing how easy it is to manage different time APIs with Timeout:

```swift
let to = Timeout.Infinity
XCTAssertEqual(to.timeSinceNow(), NSDate.distantFuture())
XCTAssertEqual(to.timeInterval, Double.infinity)

//convert to NSTimeInterval
to.timeInterval

//convert to NSDate
to.timeSinceNow()

//convert to dispatch_time_t
to.dispatchTime
```

### Further

Examples above are just a quick intro to what Boilerplate can bring you. Take a look inside and see yourself. It handles __NS Bridging__ and exact type comparison in case you want to avoid __Automatic Bridging__, some __Funtional__ extensions, __CF Bridging__, __Error Handling__ including low level __C APIs Error Handling__, __Collections Routines__ i.e. __Collections Zipping__, __Crossplatform Threads__ and much more.

Contributions are welcome. Let's get rid of boilerplate code in Swift together.

### Keep your code clean ;)

## Contributing

To get started, <a href="https://www.clahub.com/agreements/crossroadlabs/Boilerplate">sign the Contributor License Agreement</a>.

## [![Crossroad Labs](http://i.imgur.com/iRlxgOL.png?1) by Crossroad Labs](http://www.crossroadlabs.xyz/)