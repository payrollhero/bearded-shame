Application.factory 'shavesResource', ($http) ->
  apiRequestUrl = Application.helpers.apiRequestUrl

  getPrice: () ->
    promise = $http(
      url: apiRequestUrl('/orders/price')
      method: 'GET'
    )
    promise.then (response) ->
      response.data
