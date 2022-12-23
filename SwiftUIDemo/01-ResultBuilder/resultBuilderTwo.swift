import Foundation
import SwiftUI


struct CheckerBoard<A: View, B: View> {
    let firstView: A
    let secondView: B
}

//INITIALIZERS
extension CheckerBoard where B == Rectangle {
    init(@CheckerBoardBuilder builder: () -> A) {
        firstView = builder()
        secondView = Rectangle()
    }
}
extension CheckerBoard {
    init(@CheckerBoardBuilder builder: () -> (A,B)) {
        (firstView, secondView) = builder()
    }
}

// RESULT BUILDER STRUCT
@resultBuilder
struct CheckerBoardBuilder {
    static func buildBlock<A: View>(_ firstView: A) -> A {
        firstView
    }
    
    static func buildBlock<A: View, B: View> (_ firstView: A, _ secondView: B) -> (A,B) {
        (firstView, secondView)
    }
}

//BODY COMPUTED VARIABLE
extension CheckerBoard: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0){
                firstView
                    .frame(minWidth: 0, maxWidth: .infinity) //to be equally spaced?
                secondView
                    .frame(minWidth: 0, maxWidth: .infinity)
            }
            HStack(spacing: 0) {
                secondView
                    .frame(minWidth: 0, maxWidth: .infinity)
                firstView
                    .frame(minWidth: 0, maxWidth: .infinity)
            }
        }
    }
}

struct ContentView2: View {
    var body: some View {
        VStack {
            CheckerBoard {
                Text("Hello")
            }
            CheckerBoard {
                Text("pencil")
                Image(systemName: "pencil")
                    .frame(minHeight: 200)
            }
        }
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
            .previewLayout(.sizeThatFits)
    }
}
