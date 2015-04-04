define ['src/controller'], (Controller)->
	describe 'Controller', ->
		it 'Should call addItem on repository', ->
			ITEM = {}
			fakeRepository = new FakeRepository
			controller = new Controller fakeRepository
			controller.addItem(ITEM)

			expect(fakeRepository.addItemCallCount).to.be.equal(1)

	class FakeRepository 
		constructor: ->
			@addItemCallCount = 0
		addItem: =>
			@addItemCallCount++