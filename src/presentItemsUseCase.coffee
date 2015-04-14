class PresentItemsUseCase
  constructor: (@itemsPresenter, @itemsGateway) ->
    @itemsGateway.addListener @handleEvent

  getAllItems: =>
    @itemsGateway.getAllItems (items) =>
      @sortItemsById items
      @itemsPresenter.display items

  sortItemsById: (items) ->
    items.sort (a, b) ->
      return a.id - b.id

  handleEvent: (items) =>
    @itemsPresenter.display items

window.Todo = window.Todo || {}
window.Todo.PresentItemsUseCase = PresentItemsUseCase