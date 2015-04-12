window.Todo.UseCases = window.Todo.UseCases || {}

class PresentItemsUseCase
  constructor: (@itemsPresenter, @itemsGateway) ->

  getAllItems: =>
    @itemsPresenter.display()
    @itemsGateway.getAllItems()

window.Todo.UseCases.PresentItemsUseCase = PresentItemsUseCase