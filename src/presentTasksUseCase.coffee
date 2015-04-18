class PresentTasksUseCase
  constructor: (@tasksPresenter, @tasksGateway) ->
    @tasksGateway.addListener @handleUpdate

  getAllTasks: =>
    @tasksGateway.getAllTasks @handleUpdate

  handleUpdate: (tasks) =>
    @tasksPresenter.display tasks

window.Todo = window.Todo or {}
window.Todo.PresentTasksUseCase = PresentTasksUseCase