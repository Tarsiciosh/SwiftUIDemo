
import SwiftUI

struct TextEntryModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textFieldStyle(.roundedBorder)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 40)
    }
}

class CurrentViewModel: ObservableObject {
    @Published var rating = ""
    let minimumRating = 0
    let maximumRating = 100
}

extension CurrentViewModel {
    func clearRating() {
        rating = ""
    }
    
    var prompt: String {
        "Range \(minimumRating) - \(maximumRating)"
    }
    
    var inputIsNotValid: Bool {
        guard let int = Int(rating) else { return true }
        return int < minimumRating || int > maximumRating
    }
    
    var inputIsValid: Bool {
        !inputIsNotValid
    }
    
    var textInputWarning: String {
        "Enter an Int between " + prompt
    }
    
    var shouldDisplayWarning: Bool {
        !(rating.isEmpty || inputIsValid)
    }
}

struct CurrentView {
    let history: History
    @StateObject private var ratingViewModel = CurrentViewModel()
}

extension CurrentView: View {
    var body: some View {
        VStack(spacing: 40) {
            Text(ratingViewModel.textInputWarning)
                .foregroundColor(ratingViewModel.shouldDisplayWarning ? .red : .clear )
            
            TextField(ratingViewModel.prompt,
                      text: $ratingViewModel.rating)
            .onSubmit {
                if ratingViewModel.inputIsValid {
                    recordRating()
                }
            }
            .modifier(TextEntryModifier())
            
            Button("Record Rating", action: recordRating)
                .disabled(ratingViewModel.inputIsNotValid)
        }
    }
}

extension CurrentView {
    private func recordRating() {
        if let rating = Int(ratingViewModel.rating) {
            history.add(rating)
            ratingViewModel.clearRating()
        }
    }
}

struct CurrentView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentView(history: History())
    }
}
