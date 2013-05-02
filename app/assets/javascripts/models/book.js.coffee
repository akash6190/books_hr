class BooksHr.Models.Book extends Backbone.Model
  urlRoot: '/books'
  defaults: 
    name: ''
    author: ''
    status: ''
  validate: (attrs) ->
      return 'Name cannot be empty' unless attrs.name.length > 0
      return 'Author cannot be blank' unless attrs.author.length > 0
