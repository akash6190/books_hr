class BooksHr.Views.BooksIndex extends Backbone.View
  el: '#app'
  template: JST['books/index']
  events:
    'submit #add-book-form' : 'createOnSubmit'
  initialize: ->
    @collection.bind 'reset', @render, @
    @collection.bind 'add', @addBook, @
    
  render: ->
    $(@el).html(@template())
    console.log(@$)
    @collection.each (book) =>
      view = new BooksHr.Views.BooksItem model: book
      @$('#books').append view.render().el
      @
  createOnSubmit: (event) ->
    event.preventDefault();
    
    @collection.create { 
      name: @$('#name').val()
      author: @$('#author').val()
      status: @$('#status').val()
    }
    @$('#add-book-form')[0].reset()
    @
  addBook: (book) ->
    view = new BooksHr.Views.BooksItem model: book
    @$('#books').append(view.render().el)
    @
