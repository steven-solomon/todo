PresentItemsUseCase = window.Todo.PresentItemsUseCase
Task = window.Todo.Task

describe 'PresentItemsUseCase', ->
  fakeItemsPresenter = null
  fakeItemsGateway = null
  presentItemsUseCase = null

  beforeEach ->
    fakeItemsPresenter = new FakeItemsPresenter
    fakeItemsGateway = new FakeItemsGateway
    presentItemsUseCase = new PresentItemsUseCase fakeItemsPresenter, fakeItemsGateway

  it 'Should display no items when there are not any', ->
    fakeItemsGateway.setItems []

    items = getDisplayedItemsFromTheUseCase()

    expect(items.length).to.be.equal(0)

  it 'Should display three items in order', ->
    ITEMS_OUT_OF_ORDER = [new Task 2, 'second task'
                          new Task 1, 'first task'
                          new Task 3, 'last task' ]

    ITEMS_IN_ORDER = [new Task 1, 'first task'
                      new Task 2, 'second task'
                      new Task 3, 'last task' ]

    fakeItemsGateway.setItems ITEMS_OUT_OF_ORDER

    items = getDisplayedItemsFromTheUseCase()

    expect(items).to.deep.equal(ITEMS_IN_ORDER)

  it 'Should register as listener', ->
    LISTENERS_LENGTH = 1
    listeners = fakeItemsGateway.getListeners()

    assert.strictEqual listeners.length, LISTENERS_LENGTH

  getDisplayedItemsFromTheUseCase = ->
    presentItemsUseCase.getAllItems()
    return fakeItemsPresenter.items

  class FakeItemsPresenter
    display: (items) =>
      @items = items

  class FakeItemsGateway
    constructor: ->
      @listeners = []
    setItems: (@items) ->
    getAllItems: (success) ->
      success @items
    addListener: (listener) =>
      @listeners.push listener
    getListeners: =>
      return @listeners