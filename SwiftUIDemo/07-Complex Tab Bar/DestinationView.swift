import SwiftUI

let detailColors = [Color.primary, .red, .green, .secondary, .purple, .blue, .yellow]

struct DestinationView {
    let snapshot: Snapshot
}

extension DestinationView: View {
    var body: some View {
        VStack(spacing: 40) {
            Text(snapshot.rating.description)
                .font(.headline)
            Text(snapshot.date, style: .time)
            TabView {
                ForEach(detailColors, id: \.self) { color in
                    Image(systemName: symbol(snapshot.rating))
                        .resizable()
                        //.aspectRatio(1, contentMode: .fit)
                        .scaledToFit()
                        .padding(.horizontal)
                        .foregroundColor(color)
                }
            }
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .tabViewStyle(.page)
        }
    }
}
