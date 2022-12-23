import SwiftUI

struct DoubleBorderButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .border(.green)
            .padding(5)
            .border(.gray)
    }
}

struct ButtonWithStyle {
    let symbolName: String
    let action: () -> Void
    
    init(_ symbolName: String,
         action: @escaping () -> Void = {}) {
        self.symbolName = symbolName
        self.action = action
    }
}

extension ButtonWithStyle: View {
    var body: some View {
        Button(action: action) {
            Image(systemName: symbolName)
        }
        .buttonStyle(DoubleBorderButtonStyle())
    }
}

struct ButtonWithStyle_Previews: PreviewProvider {
    static var previews: some View {
        ButtonWithStyle("trash"){
            print("pressed")
        }
    }
}
