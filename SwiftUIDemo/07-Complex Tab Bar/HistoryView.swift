import SwiftUI

struct HistoryView {
    @ObservedObject private(set) var history: History
}

extension HistoryView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(history.snapshots){ snapshot in
                    NavigationLink(destination: DestinationView(snapshot: snapshot)) {
                        HStack {
                            Text("Rating: \(snapshot.rating)")
                            Spacer()
                            Text(snapshot.date, style: .time)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .onDelete(perform: history.remove)
            }
            .navigationTitle("Ratings")
            .navigationBarItems(trailing: EditButton())
        }
    }
}
