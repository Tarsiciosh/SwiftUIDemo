import SwiftUI

let roots = root(of: symbolNames).map(Node.init)

struct Node: Identifiable {
    let id = UUID()
    let name: String
}

struct DisclosureGroupContentView: View {
    var body: some View {
        List {
            ForEach(roots) { root in
                DisclosureGroup {
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: [GridItem(.flexible())]) {
                            ForEach(symbols(withRoot: root)) { symbol in
                                Image(systemName: symbol.name)
                            }
                        }
                    }
                } label: {
                    Text(root.name)
                }
            }
        }
    }
}

struct DisclosureGroupContentView_Previews: PreviewProvider {
    static var previews: some View {
        DisclosureGroupContentView()
    }
}
