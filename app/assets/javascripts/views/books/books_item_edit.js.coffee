class BooksHr.Views.BooksItemEdit extends Backbone.View
  el: '#app'
  template: JST['books/itemEdit']
  initialize: ->
    @model.bind 'change', @render, @
    @model.fetch(reset: true)
    
  render: ->
    
    @$el.html @template(book: @model)
    @$el.find('#edit-book-form-'+@model.get('id')+ ' .remove-book').unbind().bind('click',@removeBook)
    @$el.find('#edit-book-form-'+@model.get 'id').unbind().bind('submit',@updateBook)
    @
  removeBook: =>
    @model.destroy({ 
      success: ->
        app = new BooksHr.Routers.Books()
        app.navigate '', {trigger: true} 
      error: ->
         alert('There was an error please try again or reload the page')
      })
    
  updateBook: (event) =>
    event.preventDefault()
    @model.set { 
      name: @$('#name').val()
      author: @$('#author').val()
      status: @$('#status').val()
    }
    
    @model.save(null,{ 
      success: ->
        app = new BooksHr.Routers.Books()
        app.navigate '', {trigger: true}
        #location.reload()  
      error: ->
         alert('There was an error please try again or reload the page')
      })
    #@model.update()
    return false;