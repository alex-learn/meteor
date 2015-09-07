
class @FooterMediator extends Space.ui.Mediator

  @Template: 'footer'

  Dependencies:
    store: 'TodosStore'
    meteor: 'Meteor'

  setDefaultState: -> availableFilters: @_mapAvailableFilters()

  setInitialState: ->
    activeTodosCount: @store.get('activeTodos').count()
    completedTodosCount: @store.get('completedTodos').count()

  onClearCompletedTodos: -> @meteor.call 'clearCompletedTodos'

  _mapAvailableFilters: -> _.map @store.FILTERS, (key) ->
    name: key[0].toUpperCase() + key.slice 1
    path: key
