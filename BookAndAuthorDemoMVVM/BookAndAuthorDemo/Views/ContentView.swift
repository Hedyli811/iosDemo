import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var context
    
    var body: some View {
        TabView {
            BookListView(viewModel: BookListViewModel(context: context))
                .tabItem {
                    Label("Books", systemImage: "book")
                }

            AuthorListView(viewModel: AuthorListViewModel(context: context ))
                .tabItem {
                    Label("Authors", systemImage: "person")
                }
        }
    }
}


#Preview {
    ContentView()
}
