import SwiftUI

struct ContentView {
}

extension ContentView: View {
    var body: some View {
        VStack {
            Text("Hello")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.sizeThatFits)
    }
}
