import Foundation

public extension Data {
    init?(hexEncodedString: String, stripLeadingZeroes: Bool = true) {
        var mutableString = hexEncodedString
        if mutableString.hasPrefix("0x") {
            mutableString.removeFirst(2)
        }
        if mutableString.count % 2 != 0 {
            mutableString = "0" + mutableString
        }
        if stripLeadingZeroes {
            while mutableString.hasPrefix("00") {
                mutableString.removeFirst(2)
            }
        }
        var bytes = [UInt8]()
        for index in stride(from: 0, to: mutableString.count, by: 2) {
            let startIndex = mutableString.index(mutableString.startIndex, offsetBy: index)
            let endIndex = mutableString.index(startIndex, offsetBy: 2)
            guard let byte = UInt8(mutableString[startIndex..<endIndex], radix: 16) else {
                return nil
            }
            bytes.append(byte)
        }
        self = Self(bytes)
    }

    func hexEncodedString(stripLeadingZeroes: Bool = true) -> String {
        var mutableString = reduce("") {
            $0 + String(format: "%02x", $1)
        }
        if stripLeadingZeroes {
            while mutableString.hasPrefix("0") {
                mutableString.removeFirst()
            }
        }
        return mutableString
    }

    var bytes: Array<UInt8> {
        Array(self)
    }
}
