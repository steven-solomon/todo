define ['src/app'], (app) ->
	describe 'Todo Application', ->
		it 'Should have no items when there are not any', -> 
			items = app.getAllItems()

			expect(items.length).to.be.equal(0)