window.Todo = window.Todo or {}

class AddItemsUseCase
  constructor: (@itemsGateway) ->

  addItem: ->
    @itemsGateway.addItem()

window.Todo.AddItemsUseCase = AddItemsUseCase