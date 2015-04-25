Application.classy.controller
  name: 'UserCtrl',
  inject: ['$scope', 'ordersResource', 'massageResource']

  init: ->
    @_getMyOrdersList()

  methods :
    _getMyOrdersList: ->
      @ordersResource.my()
      .then (response) =>
        @$.orders = response
      ,(response) =>
        console.log 'I can\'t get orders list :('
