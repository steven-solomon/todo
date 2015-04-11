window.Todo.UseCases = window.Todo.UseCases || {}

class OrderedItemsUseCase
  constructor: (@itemsPresenter, @itemsGateway) ->

  getAllItems: =>
    @itemsPresenter.display()
    @itemsGateway.getAllItems()

window.Todo.UseCases.OrderedItemsUseCase = OrderedItemsUseCase