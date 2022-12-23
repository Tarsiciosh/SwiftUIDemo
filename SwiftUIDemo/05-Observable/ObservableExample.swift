import SwiftUI
import Combine

struct ObservableExample {
    @ObservedObject var viewModel: ValueViewModel
}

extension ObservableExample: View {
    var body: some View {
        VStack(spacing: 30) {
            TextWithStyle(value: viewModel.currentValue)
            HStack (spacing: 60) {
                ButtonWithStyle("arrow.left", action: viewModel.back)
                ButtonWithStyle("arrow.right", action: viewModel.forward)
            }
        }
    }
}

struct Observable_Previews: PreviewProvider {
    static var previews: some View {
        ObservableExample(viewModel: ValueViewModel())
    }
}
