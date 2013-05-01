class BooksHr.Views.BooksItemEdit extends Backbone.View
  el: '#app'
  template: JST['books/itemEdit']
  events:
    'click a.remove-book' : 'removeBook'
    'submit #edit-book-form' : 'updateBook'
  initialize: ->
    @model.bind 'change', @render, @
    @model.bind 'destroy', @remove, @
    @model.fetch(reset: true)
  render: ->
    @$el.html @template(book: @model)
    @
  removeBook: ->
    @model.destroy({ 
      success: ->
        close()
        app = new BooksHr.Routers.Books()
        app.navigate '', {trigger: false} 
        location.reload() 
      error: ->
         alert('There was an error please try again or reload the page')
      })
    
  updateBook: (event)->
    event.preventDefault()
    @model.set { 
      name: @$('#name').val()
      author: @$('#author').val()
      status: @$('#status').val()
    }
    
    @model.save(null,{ 
      success: ->
        app = new BooksHr.Routers.Books()
        app.navigate '', {trigger: false}
        location.reload()  
      error: ->
         alert('There was an error please try again or reload the page')
      })
    #@model.update()