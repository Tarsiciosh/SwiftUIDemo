import SwiftUI

struct TitledView <A: View> {
    let title: String
    let view: A
}

//INITIALIZER
extension TitledView {
    init(title: String, @TitledViewBuilder builder: () -> A) {
        self.view = builder()
        self.title = title
    }
}

// RESULT BUILDER STRUCT
@resultBuilder
struct TitledViewBuilder {
    static func buildBlock<A: View>(_ theView: A) -> A {
        theView
    }
}

//BODY COMPUTED VARIABLE
extension TitledView: View {
    var body: some View {
        VStack {
            Text(title)
            view
        }
    }
}

struct ContentView1: View {
    var body: some View {
        VStack(spacing: 40) {
            TitledView(title: "edit") {
                Image(systemName: "pencil")
            }
            TitledView(title: "delete") {
                Image(systemName: "trash")
            }
            TitledView(title: "name") {
                Text("John")
            }
        }
    }
}

struct ContentView1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView1()
            .previewLayout(.sizeThatFits)
    }
}
