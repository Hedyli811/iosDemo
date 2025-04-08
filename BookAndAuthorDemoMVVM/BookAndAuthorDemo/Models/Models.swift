import SwiftData

@Model
class Book {
    var title: String
    @Relationship(deleteRule: .deny, inverse: \Author.books)
    var authors: [Author] = []
  
  @Relationship(deleteRule: .cascade, inverse: \BookCover.book)
  var cover: BookCover?

    init(title: String) {
        self.title = title
    }
}

@Model
class BookCover {
  var imageName: String
  @Relationship(deleteRule: .nullify)
var book:Book?
  
  
  
  init(imageName : String, book :Book) {
    self.imageName = imageName
    self.book = book
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
