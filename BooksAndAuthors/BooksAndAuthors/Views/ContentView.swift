import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            BookListView()
                .tabItem {
                    Label("Books", systemImage: "book")
                }

            AuthorListView()
                .tabItem {
                    Label("Authors", systemImage: "person")
                }
        }
    }
}
