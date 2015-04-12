PresentItemsUseCase = window.Todo.PresentItemsUseCase
Task = window.Todo.Task

describe 'PresentItemsUseCase', ->
  itemsPresenter = null
  itemsGateway = null

  beforeEach ->
    itemsPresenter = new FakeItemsPresenter
    itemsGateway = new FakeItemsGateway

  it 'Should display no items when there are not any', ->
    itemsGateway.setItems []

    items = getDisplayedItemsFromTheUseCase()

    expect(items.length).to.be.equal(0)

  it 'Should display three items in order', ->
    ITEMS_OUT_OF_ORDER = [new Task 2, 'second task'
                          new Task 1, 'first task'
                          new Task 3, 'last task' ]

    ITEMS_IN_ORDER = [new Task 1, 'first task'
                      new Task 2, 'second task'
                      new Task 3, 'last task' ]

    itemsGateway.setItems ITEMS_OUT_OF_ORDER

    items = getDisplayedItemsFromTheUseCase()

    expect(items).to.deep.equal(ITEMS_IN_ORDER)

  it 'Should register as listener', ->
    presentItemsUseCase = new PresentItemsUseCase itemsPresenter, itemsGateway

    assert.isTrue itemsGateway.addListener.calledOnce

  getDisplayedItemsFromTheUseCase = ->
    presentItemsUseCase = new PresentItemsUseCase itemsPresenter, itemsGateway
    presentItemsUseCase.getAllItems()
    return itemsPresenter.items

  class FakeItemsPresenter
    display: (items) =>
      @items = items

  class FakeItemsGateway
    constructor: ->
      @addListener = sinon.spy()
    setItems: (@items) ->
    getAllItems: (success) ->
      success @items