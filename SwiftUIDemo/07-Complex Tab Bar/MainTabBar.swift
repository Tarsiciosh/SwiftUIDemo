import SwiftUI

struct MainTabBar {
    let history = History()
}

extension MainTabBar: View {
    var body: some View {
        TabView {
            CurrentView(history: history)
                .tabItem {
                    Label("Record Mood",
                          systemImage: "tray.and.arrow.down")
                    
                }
            HistoryView(history: history)
                .tabItem {
                    Label("History Mood",
                          systemImage: "tray.full")
                    
                }
        }
    }
}

struct MainTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBar()
    }
}
