PresentTasksUseCase = window.Todo.PresentTasksUseCase
Task = window.Todo.Task

describe 'PresentTasksUseCase', ->
  fakeTasksPresenter = null
  fakeTasksGateway = null
  presentTasksUseCase = null

  beforeEach ->
    fakeTasksPresenter = new FakeTasksPresenter
    fakeTasksGateway = new FakeTasksGateway
    presentTasksUseCase = new PresentTasksUseCase fakeTasksPresenter, fakeTasksGateway

  it 'Should display no tasks when there are not any', ->
    fakeTasksGateway.setTasks []

    tasks = getDisplayedTasksFromTheUseCase()

    expect(tasks.length).to.be.equal(0)

  it 'Should display three tasks in order', ->
    ITEMS_OUT_OF_ORDER = [new Task 2, 'second task'
                          new Task 1, 'first task'
                          new Task 3, 'last task' ]

    ITEMS_IN_ORDER = [new Task 1, 'first task'
                      new Task 2, 'second task'
                      new Task 3, 'last task' ]

    fakeTasksGateway.setTasks ITEMS_OUT_OF_ORDER

    tasks = getDisplayedTasksFromTheUseCase()

    expect(tasks).to.deep.equal(ITEMS_IN_ORDER)

  it 'Should register as listener', ->
    LISTENERS_LENGTH = 1
    listeners = fakeTasksGateway.getListeners()

    assert.strictEqual listeners.length, LISTENERS_LENGTH

  it 'Should call display with tasks', ->
    TASK_LIST = [new Task 1, 'a task']

    listeners = fakeTasksGateway.getListeners()
    firstListener = listeners[0]
    firstListener TASK_LIST

    assert.deepEqual fakeTasksPresenter.tasks, TASK_LIST

  getDisplayedTasksFromTheUseCase = ->
    presentTasksUseCase.getAllTasks()
    return fakeTasksPresenter.tasks

  class FakeTasksPresenter
    display: (tasks) =>
      @tasks = tasks

  class FakeTasksGateway
    constructor: ->
      @listeners = []
    setTasks: (@tasks) ->
    getAllTasks: (success) ->
      success @tasks
    addListener: (listener) =>
      @listeners.push listener
    getListeners: =>
      return @listeners