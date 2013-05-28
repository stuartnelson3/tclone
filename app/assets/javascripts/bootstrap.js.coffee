jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()

  $("#tweet_text").on "keyup", (e) ->
    $char_count = $(".char-count")
    characters_remaining = 140 - $(this).val().length
    if characters_remaining < 0
      $char_count.addClass("red")
    else
      $char_count.removeClass("red")
    $char_count.text(characters_remaining)

$(document).on "click", ".favorite", (e) ->
  params = {
    type: 'POST'
    url: '/favorite'
    data: {tweet_id: $(@).data("id")}
    success: =>
      $(@).removeClass("favorite btn-primary").addClass("unfavorite btn-danger").text("Unfavorite")
  }
  $.ajax(params)

$(document).on "click", ".unfavorite", (e) ->
  params = {
    type: 'DELETE'
    url: '/unfavorite'
    data: {tweet_id: $(@).data("id")}
    success: =>
      $(@).addClass("favorite btn-primary").removeClass("unfavorite btn-danger").text("Favorite")
  }
  $.ajax(params)
