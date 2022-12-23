import Foundation

class ValueViewModel: ObservableObject {
    @Published private var model = ValueModel(value: 0)
}

extension ValueViewModel {
    var currentValue: Int {
        model.value
    }
    func back() {
        model = model.decrease
    }
    func forward() {
        model = model.increase
    }
}
