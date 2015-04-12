PresentItemsUseCase = window.Todo.PresentItemsUseCase
Task = window.Todo.Task

describe 'PresentItemsUseCase', ->
  context = null

  beforeEach ->
    context =
      itemsPresenter: new FakeItemsPresenter
      itemsGateway: new FakeItemsGateway

  it 'Should display no items when there are not any', ->
    context.itemsGateway.setItems []

    items = getItemsFromTheUseCase()

    expect(items.length).to.be.equal(0)

  it 'Should display three items in order', ->
    ITEMS_OUT_OF_ORDER = [new Task 2, 'second task'
                          new Task 1, 'first task'
                          new Task 3, 'last task' ]

    ITEMS_IN_ORDER = [new Task 1, 'first task'
                      new Task 2, 'second task'
                      new Task 3, 'last task' ]

    context.itemsGateway.setItems ITEMS_OUT_OF_ORDER

    items = getItemsFromTheUseCase()

    expect(items).to.deep.equal(ITEMS_IN_ORDER)

  getItemsFromTheUseCase = ->
    presentItemsUseCase = new PresentItemsUseCase context
    presentItemsUseCase.getAllItems()
    return context.itemsPresenter.items

  class FakeItemsPresenter
    display: (items) =>
      @items = items

  class FakeItemsGateway
    setItems: (@items) ->
    getAllItems: (success) ->
      success @items