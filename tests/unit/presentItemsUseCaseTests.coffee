PresentItemsUseCase = window.Todo.UseCases.PresentItemsUseCase

describe 'PresentItemsUseCase', ->
  fakeItemsPresenter = null
  fakeItemsGateway = null
  orderedItemsUseCase = null

  beforeEach ->
    fakeItemsPresenter = new FakeItemsPresenter
    fakeItemsGateway = new FakeItemsGateway
    orderedItemsUseCase = new PresentItemsUseCase fakeItemsPresenter, fakeItemsGateway

    orderedItemsUseCase.getAllItems()

  it 'Should call display on presenter', ->
    assert.isTrue fakeItemsPresenter.display.calledOnce

  it 'Should call getAllItems on gateway', ->
    assert.isTrue fakeItemsGateway.getAllItems.calledOnce

  class FakeItemsPresenter
    constructor: ->
      @display = sinon.spy()
  class FakeItemsGateway
    constructor: ->
      @getAllItems = sinon.spy()