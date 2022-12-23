import SwiftUI

class History: ObservableObject {
    @Published private(set) var snapshots: [Snapshot] = [] 
}

extension History {
    func add(_ rating: Int) {
        snapshots.append(Snapshot(rating: rating))
    }
    
    func remove(_ indexSet: IndexSet) {
        indexSet.forEach { index in
            snapshots.remove(at: index)
        }
    }
}
