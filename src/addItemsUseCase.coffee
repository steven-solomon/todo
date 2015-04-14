class AddItemsUseCase
  constructor: (@itemsGateway) ->

  addItem: (text) ->
    @itemsGateway.addItem text

window.Todo = window.Todo || {}
window.Todo.AddItemsUseCase = AddItemsUseCase