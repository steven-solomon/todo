TasksGateway = window.Todo.TasksGateway

describe 'TasksGateway', ->
  tasksGateway = null
  callback = null

  beforeEach ->
    tasksGateway = new TasksGateway
    callback = sinon.spy()

  it 'Should invoke callback when task is added', ->
    tasksGateway.addListener callback
    addTask()

    assert.isTrue callback.calledOnce

  it 'Should invoke callback when task is added', ->
    tasksGateway.addListener callback
    tasksGateway.addListener callback
    addTask()

    assert.isTrue callback.calledTwice

  addTask = ->
    tasksGateway.addTask 'new task'