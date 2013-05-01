class BooksHr.Views.BooksItem extends Backbone.View
  tagName: 'tr'
  template: JST['books/item']
  events:
    'click a.remove-book' : 'removeBook'
  initialize: ->
    @model.bind 'change', @render,@
    @model.bind 'destroy', @remove, @
  render: ->
    @$el.html @template(book: @model)
    @
  removeBook: ->
    @model.destroy()