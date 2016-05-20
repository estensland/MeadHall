///<reference path='../models/book.ts'/>
///<reference path='../lib/apply_mixins.ts'/>

class BooksIn{
  books: Array<Book>;

  addBooks(newBooks: Array<Book>){
    this.books = this.books.concat(newBooks)
  }
}
