window.Todo = window.Todo or {}

class AddItemsUseCase
  constructor: (@itemsGateway) ->

  addItem: (text) ->
    @itemsGateway.addItem text

window.Todo.AddItemsUseCase = AddItemsUseCase