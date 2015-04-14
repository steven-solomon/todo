TasksGateway = window.Todo.TasksGateway

describe 'TasksGateway', ->
  tasksGateway = null

  beforeEach ->
    tasksGateway = new TasksGateway

  it 'Should invoke callback when task is added', ->
    callback = sinon.spy()

    tasksGateway.addListener callback
    addTask()

    assert.isTrue callback.calledOnce

  it 'Should invoke callback when task is added', ->
    firstCallback = ->
    secondCallback = sinon.spy()

    tasksGateway.addListener firstCallback
    tasksGateway.addListener secondCallback
    addTask()

    assert.isTrue secondCallback.calledOnce

  addTask = ->
    tasksGateway.addTask 'new task'