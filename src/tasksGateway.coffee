class TasksGateway
  constructor: ->
    @listeners = []
    @tasks = []

  addListener: (callback) ->
    @listeners.push callback

  addTask: (title) =>
    @_createTask title
    @_notifyListeners()

  _createTask: (title) =>
    id = @tasks.length + 1
    task = new Task id, title
    @tasks.push task

  _notifyListeners: =>
    for listener in @listeners
      listener @tasks

window.Todo = window.Todo or {}
window.Todo.TasksGateway = TasksGateway