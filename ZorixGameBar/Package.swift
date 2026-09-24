// swift-tools-version: 5.8
let package = Package(
    name: "ZorixGameBar",
    platforms: [.macOS(.v12)],
    products: [.executable(name: "zorix-gamebar", targets: ["ZorixGameBar"])],
    targets: [.executableTarget(name: "ZorixGameBar", dependencies: [])]
)
