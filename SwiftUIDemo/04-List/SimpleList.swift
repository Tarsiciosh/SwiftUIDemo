import SwiftUI

let letters = ["A","B","C","D","E"].map(Letter.init)

struct Letter: Identifiable {
    var name: String
    var id = UUID()
    
    init(name: String) {
        self.name = name
    }
}

struct SimpleList: View {
    var body: some View {
        List {
            ForEach (letters) { letter in
                HStack {
                    Text(letter.name)
                    Spacer()
                    Image(systemName: "pencil")
                        .padding([.trailing])
                }
            }
        }
    }
}

struct SimpleList_Previews: PreviewProvider {
    static var previews: some View {
        SimpleList()
            .previewLayout(.sizeThatFits)
    }
}
