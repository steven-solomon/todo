AddTasksUseCase = window.Todo.AddTasksUseCase

describe 'AddTasksUseCase', ->
  fakeGateway = null

  beforeEach ->
    fakeGateway = new FakeGateway

  it 'Should call addItem with item text on gateway', ->
    ITEM_TEXT = 'item text'
    addTasksUseCase = new AddTasksUseCase fakeGateway

    addTasksUseCase.addItem ITEM_TEXT

    assert.isTrue fakeGateway.addItem.calledWith(ITEM_TEXT)

  class FakeGateway
    addItem: sinon.spy()