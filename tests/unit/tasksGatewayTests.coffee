TasksGateway = window.Todo.TasksGateway

describe 'TasksGateway', ->
  TASK_TITLE = 'new task'
  tasksGateway = null
  callback = null

  beforeEach ->
    tasksGateway = new TasksGateway
    callback = sinon.spy()

  it 'Should invoke callback when task is added', ->
    TASKS = [
      id: 1
      title: TASK_TITLE
    ]

    tasksGateway.addListener callback
    addTask()

    assert.isTrue callback.calledWith(TASKS)

  it 'Should invoke callback when task is added', ->
    tasksGateway.addListener callback
    tasksGateway.addListener callback
    addTask()

    assert.isTrue callback.calledTwice

  it 'Should increment id for each new task', ->
    TASKS = [
      { id: 1, title: TASK_TITLE }
      { id: 2, title: TASK_TITLE }
    ]

    tasksGateway.addListener callback
    addTask()
    addTask()

    assert.isTrue callback.calledWith(TASKS)

  addTask = ->
    tasksGateway.addTask TASK_TITLE