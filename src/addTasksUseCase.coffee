class AddTasksUseCase
  constructor: (@tasksGateway) ->

  addItem: (text) ->
    @tasksGateway.addItem text

window.Todo = window.Todo || {}
window.Todo.AddTasksUseCase = AddTasksUseCase