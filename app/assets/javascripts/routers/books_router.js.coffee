class BooksHr.Routers.Books extends Backbone.Router
  routes:
    '' : 'index'
    ':id': 'editBook'

  index: ->
    books = new BooksHr.Collections.Books
    new BooksHr.Views.BooksIndex(collection: books)
    books.fetch(reset: true)
  
  editBook: (id)->
    book = new BooksHr.Models.Book({id})
    new BooksHr.Views.BooksItemEdit(model: book)
