import SwiftUI
import SwiftData

@main
struct BooksAndAuthorsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Book.self, Author.self,BookCover.self])
    }
}
