Application.classy.controller
  name: 'OrdersCtrl',
  inject: ['$scope', 'ordersResource']

  init: ->
    @_getOrdersList()

  methods :
    _getOrdersList: ->
      @ordersResource.list()
      .then (response) =>
        @$.orders = response
      ,(response) =>
        console.log 'I can\'t get orders list :('
