AddItemsUseCase = window.Todo.AddItemsUseCase

describe 'AddItemsUseCase', ->
  fakeGateway = null

  beforeEach ->
    fakeGateway = new FakeGateway

  it 'Should call addItem with item text on gateway', ->
    ITEM_TEXT = 'item text'
    addItemsUseCase = new AddItemsUseCase fakeGateway

    addItemsUseCase.addItem ITEM_TEXT

    assert.isTrue fakeGateway.addItem.calledWith(ITEM_TEXT)

  class FakeGateway
    addItem: sinon.spy()