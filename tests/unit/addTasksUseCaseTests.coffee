AddTasksUseCase = window.Todo.AddTasksUseCase

describe 'AddTasksUseCase', ->
  fakeGateway = null

  beforeEach ->
    fakeGateway = new FakeGateway

  it 'Should call addTask with task text on gateway', ->
    ITEM_TEXT = 'task text'
    addTasksUseCase = new AddTasksUseCase fakeGateway

    addTasksUseCase.addTask ITEM_TEXT

    assert.isTrue fakeGateway.addTask.calledWith(ITEM_TEXT)

  class FakeGateway
    addTask: sinon.spy()