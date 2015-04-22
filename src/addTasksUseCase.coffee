class AddTasksUseCase
  constructor: (@tasksGateway) ->

  addTask: (text) ->
    @tasksGateway.addTask text

window.Todo ?= {}
window.Todo.AddTasksUseCase = AddTasksUseCase