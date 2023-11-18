import Foundation

public extension FixedWidthInteger {
    init?(data: Data) {
        let bytes = data.withUnsafeBytes {
            $0.load(as: Self.self)
        }
        self = bytes.byteSwapped
    }

    var bytes: [UInt8] {
        withUnsafeBytes(of: byteSwapped, Array.init)
    }
}
