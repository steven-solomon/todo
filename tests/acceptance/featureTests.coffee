define ['src/app'], (App) ->
	describe 'Todo Application', ->
		it 'Should have no items when there are not any', ->
      context =
        itemsPresenter: new FakeItemsPresenter
        itemsGateway: new FakeItemsGateway

      app = new App context
      app.getAllItems()

      items = context.itemsPresenter.items

      expect(items.length).to.be.equal(0)

    class FakeItemsPresenter
      display: (items) ->
        @items = items

    class FakeItemsGateway
      getItems: ->
        return []

    class ItemsControl
      constructor: (itemsPresenter, itemsGateway) ->
