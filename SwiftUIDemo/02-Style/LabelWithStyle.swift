import SwiftUI

enum SurroundLabelStyle: LabelStyle {
    case clear
    case dark
    
    var color: Color {
        switch self {
        case .clear:
            return .gray
        case .dark:
            return .brown
        }
    }
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            HStack(spacing: 3) {
                configuration.icon
                    .scaleEffect(0.5)
                configuration.icon
                configuration.icon
                    .scaleEffect(0.5)
            }
            .foregroundColor(color)
            
            configuration.title
                .font(.headline)
                .padding()
        }
    }
}

struct LabelWithStyle {
    let name: String
    
    init(_ name: String) {
        self.name = name
    }
}

extension LabelWithStyle: View {
    var body: some View {
        Label(name, systemImage: name)
            //.labelStyle(SurroundLabelStyle.dark)
    }
}
