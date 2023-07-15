// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Finance",
  platforms: [.iOS(.v14)],
  products: [
    // Products define the executables and libraries a package produces, and make them visible to other packages.
    .library(
      name: "AddPaymentMethod",
      targets: ["AddPaymentMethod"]
    ),
    .library(
      name: "FinanceEntity",
      targets: ["FinanceEntity"]
    ),
    .library(
      name: "FinanceRepository",
      targets: ["FinanceRepository"]
    ),
  ],
  dependencies: [
    .package(
      name: "ModernRIBs",
      url: "https://github.com/DevYeom/ModernRIBs",
      .exact("1.0.2")
    ),
    .package(path: "../Platform")
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages this package depends on.
    .target(
      name: "AddPaymentMethod",
      dependencies: [
        "ModernRIBs",
        "FinanceEntity",
        "FinanceRepository",
        .product(name: "RIBsUtil", package: "Platform"),
        .product(name: "SuperUI", package: "Platform")
      ]
    ),
    .target(
      name: "FinanceEntity",
      dependencies: [
      ]
    ),
    .target(
      name: "FinanceRepository",
      dependencies: [
        "FinanceEntity",
        .product(name: "CombineUtil", package: "Platform")
      ]
    ),
  ]
)
