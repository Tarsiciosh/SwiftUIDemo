import SwiftUI

let symbols = symbolNames.map(Symbol.init(name:))

struct Symbol: Identifiable, Hashable {
    let name: String
    let id = UUID()
}

struct ListSwipe {
    @State private var favorites = Set<Symbol>()
    @State private var deleted = Set<Symbol>()
    @State private var searchString = ""
}

extension ListSwipe {
    private var filteredSymbols: [Symbol] {
        let remainingSymbols = symbols.filter { symbol in
            !deleted.contains(symbol)
        }
        
        if searchString.isEmpty {
            return remainingSymbols
        } else {
            return remainingSymbols.filter { symbol in
                symbol.name.contains(searchString.lowercased())
            }
        }
    }
}

extension ListSwipe: View {
    var body: some View {
        NavigationView {
            List(filteredSymbols) { symbol in
                LabelWithStyle(symbol.name)
                    .listItemTint(favorites.contains(symbol)
                                  ? .orange : .accentColor)
                    .swipeActions {
                        Button("Favorites", action: {
                            if favorites.contains(symbol) {
                                favorites.remove(symbol)
                            } else {
                                favorites.insert(symbol)
                            }
                        })
                            .tint(.orange)
                        Button("Delete",
                               role: .destructive,
                               action: { deleted.insert(symbol) })
                    }
            }
            .searchable(text: $searchString)
            .navigationTitle("Symbols")
        }
    }
}

struct ListSwipe_Previews: PreviewProvider {
    static var previews: some View {
        ListSwipe()
    }
}
