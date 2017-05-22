import UIKit
import Foundation

let precision: CGFloat = 0.001

public extension CGAffineTransform {
    // Strict equality tends to trip on floating point imprecision.
    // For this playground, close is more relevant.
    
    public func kindaEquals(transform: CGAffineTransform) -> Bool {
        if (abs(self.a - transform.a) > precision) { return false }
        if (abs(self.b - transform.b) > precision) { return false }
        if (abs(self.c - transform.c) > precision) { return false }
        if (abs(self.d - transform.d) > precision) { return false }
        if (abs(self.tx - transform.tx) > precision) { return false }
        if (abs(self.ty - transform.ty) > precision) { return false }

        return true
    }
}
