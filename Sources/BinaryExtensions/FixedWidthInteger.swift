import Foundation

public extension FixedWidthInteger {
    init?(data: Data) {
        guard let value = Self(data.hexEncodedString(stripLeadingZeroes: false), radix: 16) else {
            return nil
        }
        self = value
    }

    var bytes: [UInt8] {
        withUnsafeBytes(of: self, Array.init)
    }
}
