window.Todo = window.Todo || {}

class PresentItemsUseCase
  constructor: (context) ->
    @itemsPresenter = context.itemsPresenter
    @itemsGateway = context.itemsGateway

  getAllItems: =>
    @itemsGateway.getAllItems (items) =>
      sortItemsById items
      @itemsPresenter.display items

  sortItemsById = (items) ->
    items.sort (a, b) ->
      return a.id - b.id

window.Todo.PresentItemsUseCase = PresentItemsUseCase