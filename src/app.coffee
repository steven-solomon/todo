window.Todo = window.Todo || {}

class App
  constructor: (context) ->
    @itemsPresenter = context.itemsPresenter
    @itemsGateway = context.itemsGateway

  getAllItems: =>
    @itemsGateway.getAllItems (items) =>
      @itemsPresenter.display items

window.Todo.App = App