class PresentTasksUseCase
  constructor: (@tasksPresenter, @tasksGateway) ->
    @tasksGateway.addListener @handleEvent

  getAllTasks: =>
    @tasksGateway.getAllTasks (tasks) =>
      @sortTasksById tasks
      @tasksPresenter.display tasks

  sortTasksById: (tasks) ->
    tasks.sort (a, b) ->
      return a.id - b.id

  handleEvent: (tasks) =>
    @tasksPresenter.display tasks

window.Todo = window.Todo || {}
window.Todo.PresentTasksUseCase = PresentTasksUseCase