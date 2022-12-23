import SwiftUI

@propertyWrapper
struct Rounding {
    private var value: Double = 0
    
    var wrappedValue: Double {
        get {
            value
        }
        set {
            value = (newValue * 10).rounded() / 10
        }
    }
    
    init(wrappedValue initialValue: Double) {
        self.wrappedValue = initialValue
    }
}

struct DoubleDisplay {
    @Rounding var value: Double
}

extension DoubleDisplay: View {
    var body: some View {
        Text(value.description)
    }
}

struct DesignHelper {
    @Binding var currentValue: Double
    let range: ClosedRange<Double>
}

extension DesignHelper: View {
    var body: some View {
        VStack(spacing: 20) {
            DoubleDisplay(value: currentValue)
            Slider(value: $currentValue,
                   in: 0...100)
        }
    }
}

