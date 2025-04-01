import SwiftData

@Model
class Book {
    var title: String
    @Relationship(deleteRule: .deny, inverse: \Author.books)
    var authors: [Author] = []

    init(title: String) {
        self.title = title
    }
}

@Model
class Author {
    var name: String
    @Relationship(deleteRule: .deny)
    var books: [Book] = []

    init(name: String) {
        self.name = name
    }
}
