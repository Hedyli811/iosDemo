import SwiftData

@Model
class Book {
    var title: String
    @Relationship(deleteRule: .deny, inverse: \Author.books)
    var authors: [Author] = []
    
    @Relationship(deleteRule:.cascade,inverse: \BookCover.book)
    var cover:BookCover?

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

@Model
class BookCover{
    @Relationship(deleteRule:.nullify)
    var book:Book
    
    var imageName:String
    
    init(book: Book, imageName: String) {
        self.book = book
        self.imageName = imageName
    }
    
    
}
