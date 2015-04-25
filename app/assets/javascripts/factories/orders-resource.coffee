Application.factory 'ordersResource', ($http) ->
  apiRequestUrl = Application.helpers.apiRequestUrl

  list: ->
    promise = $http(
      url: apiRequestUrl('/orders')
      method: 'GET'
    )
    promise.then (response) ->
      response.data

  my: ->
    promise = $http(
      url: apiRequestUrl('/orders/my')
      method: 'GET'
    )
    promise.then (response) ->
      response.data

  new: (params) ->
    promise = $http(
      url: apiRequestUrl('/orders/new')
      method: 'POST'
      data: params
    )
    promise.then (response) ->
      response.data
