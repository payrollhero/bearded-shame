Application.classy.controller
  name: 'MainCtrl',
  inject: [
    '$scope', '$rootScope', 'shavesResource', 'ordersResource',
    'massageResource'
  ]

  init: ->
    @_getPriceList()
    @_getMassages()
    @_getFavoriteMassage()
    @$.cutLength = 0

  methods :
    _getPriceList: ->
      @shavesResource.getPrice()
        .then (response) =>
          @$.priceList = response
        ,(response) =>
          console.log 'I can\'t get price list :('

    _getMassages: ->
      @massageResource.list()
      .then (response) =>
        @$.massages = response
      ,(response) =>
        console.log 'I can\'t get favorite massage :('

    _getFavoriteMassage: ->
      @massageResource.get()
      .then (response) =>
        @$.favoriteMassage = response
      ,(response) =>
        console.log 'I can\'t get favorite massage :('

    new: (id) ->
      params =
        shave_id: id
        massage_id: @$rootScope.favoriteMassage.id
        length: @$.cutLength

      @ordersResource.new(params)
        .then (response) =>
          @$.orders = response
        ,(response) =>
          console.log 'Sorry, I\'m busy now'
