OrderedItemsUseCase = window.Todo.UseCases.OrderedItemsUseCase

describe 'OrderedItemsUseCase', ->
  it 'Should call display on presenter', ->
    fakeItemsPresenter = new FakeItemsPresenter
    fakeItemsGateway = new FakeItemsGateway
    orderedItemsUseCase = new OrderedItemsUseCase fakeItemsPresenter, fakeItemsGateway

    orderedItemsUseCase.getAllItems()

    assert.isTrue fakeItemsPresenter.display.calledOnce

  it 'Should call getAllItems on gateway', ->
    fakeItemsPresenter = new FakeItemsPresenter
    fakeItemsGateway = new FakeItemsGateway
    orderedItemsUseCase = new OrderedItemsUseCase fakeItemsPresenter, fakeItemsGateway

    orderedItemsUseCase.getAllItems()

    assert.isTrue fakeItemsGateway.getAllItems.calledOnce

  class FakeItemsPresenter
    constructor: ->
      @display = sinon.spy()
  class FakeItemsGateway
    constructor: ->
      @getAllItems = sinon.spy()