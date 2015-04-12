window.Todo = window.Todo || {}

class PresentItemsUseCase
  constructor: (@itemsPresenter, @itemsGateway) ->
    @itemsGateway.addListener callback

  getAllItems: =>
    @itemsGateway.getAllItems (items) =>
      sortItemsById items
      @itemsPresenter.display items

  sortItemsById = (items) ->
    items.sort (a, b) ->
      return a.id - b.id

  callback = ->

window.Todo.PresentItemsUseCase = PresentItemsUseCase