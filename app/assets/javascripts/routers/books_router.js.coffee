class BooksHr.Routers.Books extends Backbone.Router
  routes:
    '' : 'index'

  index: ->
    books = new BooksHr.Collections.Books
    new BooksHr.Views.BooksIndex collection: books
    books.fetch(reset: true)
