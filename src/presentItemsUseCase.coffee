window.Todo = window.Todo || {}

class PresentItemsUseCase
  constructor: (context) ->
    @itemsPresenter = context.itemsPresenter
    @itemsGateway = context.itemsGateway

  getAllItems: =>
    @itemsGateway.getAllItems (items) =>
      items.sort (a, b) ->
        return a.id - b.id
      @itemsPresenter.display items

window.Todo.PresentItemsUseCase = PresentItemsUseCase