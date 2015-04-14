class PresentItemsUseCase
  constructor: (@itemsPresenter, @itemsGateway) ->
    @itemsGateway.addListener @getAllItems

  getAllItems: =>
    @itemsGateway.getAllItems (items) =>
      sortItemsById items
      @itemsPresenter.display items

  sortItemsById = (items) ->
    items.sort (a, b) ->
      return a.id - b.id

window.Todo = window.Todo || {}
window.Todo.PresentItemsUseCase = PresentItemsUseCase