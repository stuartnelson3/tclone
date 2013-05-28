jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()

$(document).on "keyup", "#tweet_text", (e) ->
  $char_count = $(".char-count")
  $create_tweet = $(".create-tweet")
  characters_remaining = 140 - $(this).val().length
  if characters_remaining < 0
    $char_count.addClass("red")
    $create_tweet.attr("disabled", true)
  else
    $char_count.removeClass("red")
    $create_tweet.attr("disabled", false)
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

$(document).on "click", ".follow", (e) ->
  params = {
    type: 'POST'
    url: '/follower_connections/create'
    data: {user_id: $(@).data("id")}
    success: =>
      $(@).removeClass("follow btn-primary").addClass("unfollow btn-danger").text("Unfollow")
  }
  $.ajax(params)

$(document).on "click", ".unfollow", (e) ->
  params = {
    type: 'DELETE'
    url: '/follower_connections/destroy'
    data: {user_id: $(@).data("id")}
    success: =>
      $(@).addClass("follow btn-primary").removeClass("unfollow btn-danger").text("Follow")
  }
  $.ajax(params)
