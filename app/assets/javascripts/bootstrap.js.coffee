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
