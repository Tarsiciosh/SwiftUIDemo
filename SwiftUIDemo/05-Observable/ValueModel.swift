import Foundation

struct ValueModel {
    let value: Int
}

extension ValueModel {
    var decrease: ValueModel {
        ValueModel(value: value - 1)
    }
    var increase: ValueModel {
        ValueModel(value: value + 1)
    }
}
