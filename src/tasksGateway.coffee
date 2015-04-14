class TasksGateway
  constructor: ->
    @listeners = []

  addListener: (callback) ->
    @listeners.push callback
  addTask: ->
    for listener in @listeners
      listener()

window.Todo = window.Todo || {}
window.Todo.TasksGateway = TasksGateway