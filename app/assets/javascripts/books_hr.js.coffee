window.BooksHr =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new BooksHr.Routers.Books
    Backbone.history.start()

$(document).ready ->
  BooksHr.initialize()