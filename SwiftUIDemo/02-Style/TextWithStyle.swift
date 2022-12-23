import SwiftUI

struct TextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.red)
            .padding(10)
            .border(.gray)
    }
}

struct TextWithStyle: View {
    var value = 0
    
    var body: some View {
        Text(value.description)
            .modifier(TextModifier())
    }
}


struct TextWithStyle_Previews: PreviewProvider {
    static var previews: some View {
        TextWithStyle(value: 7)
            .previewLayout(.sizeThatFits)
    }
}
