$ ->
  $(document.body).on "click", "[data-action]", (e) ->
    e.preventDefault()
    link = $(this).attr('href')
    status_d = $(this).closest('tr').find(".status")
    $.post link, (data) ->
      if data.error
        alert data.error
      else
        status_d.html(data.status)
