import SwiftUI

// A container view that arranges its child views in a grid that grows vertically,
// creating items only as needed.

struct LazyVGridExample {
    let columns = [
        GridItem(.fixed(100)), GridItem(.adaptive(minimum: 30)), GridItem(.fixed(100))
    ]
    // [GridItem(.adaptive(minimum: 50, maximum: 100))]
}

extension LazyVGridExample: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns) {
                ForEach(symbols) { symbol in
                    Image(systemName: symbol.name)
                        .resizable()
                        .scaledToFit()
                }
            }
        }
    }
}

struct LazyVGridExample_Previews: PreviewProvider {
    static var previews: some View {
        LazyVGridExample()
    }
}

