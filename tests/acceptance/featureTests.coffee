App = window.Todo.App

describe 'Todo Application', ->
  context = null

  beforeEach ->
    context =
      itemsPresenter: new FakeItemsPresenter
      itemsGateway: new FakeItemsGateway

  it 'Should display no items when there are not any', ->
    context.itemsGateway.setItems []

    items = getItemsFromTheApp()

    expect(items.length).to.be.equal(0)

  it 'Should display three items in order', ->
    ITEMS_OUT_OF_ORDER = [{ id: 2, title: 'second task'}
                      { id: 1, title: 'first task'}
                      { id: 3, title: 'last task' }]

    ITEMS_IN_ORDER = [{ id: 1, title: 'first task'}
                      { id: 2, title: 'second task'}
                      { id: 3, title: 'last task' }]

    context.itemsGateway.setItems ITEMS_OUT_OF_ORDER

    items = getItemsFromTheApp()

    expect(items).to.deep.equal(ITEMS_IN_ORDER)

  getItemsFromTheApp = ->
    app = new App context
    app.getAllItems()
    return context.itemsPresenter.items

  class FakeItemsPresenter
    display: (items) =>
      @items = items

  class FakeItemsGateway
    setItems: (@items) ->
    getAllItems: (success) ->
      success @items

  class ItemsControl
    constructor: (itemsPresenter, itemsGateway) ->