// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "FeedbackBulb",
  platforms: [
    .iOS(.v16),
    .macCatalyst(.v16)
  ],
  products: [
    // Products define the executables and libraries a package produces, and make them visible to other packages.
    .library(
      name: "FeedbackBulb",
      targets: ["FeedbackBulb"]),
    .library(
      name: "FeedbackBulb.Toolbox",
      targets: ["FeedbackBulb.Toolbox"]),
  ],
  dependencies: [
    // Dependencies declare other packages that this package depends on.
    .package(url: "https://github.com/vapor/multipart-kit", from: "4.5.2"),
    .package(url: "https://github.com/siteline/SwiftUI-Introspect", from: "0.2.3"),
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages this package depends on.
    .target(
      name: "FeedbackBulb",
      dependencies: [.product(name: "MultipartKit", package: "multipart-kit")]),
    .target(
      name: "FeedbackBulb.Toolbox",
      dependencies: ["FeedbackBulb", .product(name: "Introspect", package: "SwiftUI-Introspect")]),
    .testTarget(
      name: "FeedbackBulbTests",
      dependencies: ["FeedbackBulb"]),
  ]
)
