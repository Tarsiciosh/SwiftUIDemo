import SwiftUI

// A container view that arranges its child views in a grid that grows horizontally,
// creating items only as needed.

struct LazyHGridExample {
    let rows = [
        GridItem(.fixed(100)),
        GridItem(.adaptive(minimum: 40)),
        GridItem(.fixed(100))
    ]
}

extension LazyHGridExample: View {
    var body: some View {
        ScrollView([.horizontal]) {
            LazyHGrid(rows: rows) {
                ForEach(symbols) { symbol in
                    Image(systemName: symbol.name)
                        .resizable()
                        .scaledToFit()
                }
            }
        }
    }
}

struct HGridExample_Previews: PreviewProvider {
    static var previews: some View {
        LazyHGridExample()
    }
}
