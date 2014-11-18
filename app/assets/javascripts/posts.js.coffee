$(document).ready ->
  $("form").height($(window).height()/10)
  $(".ajax_save").click ->
    $("#post_message_type").val("ajax")
    valuesToSubmit = $('form').serialize()
    $.ajax(
      type: "POST"
      url: "/posts"
      data: valuesToSubmit
      dataType: "JSON"
    ).done (data) ->
      $(".ajax_posts").prepend(data.message + "<br>")
      $("#post_message_type").val("submit")
    return false

  $(".js_erb_save").click ->
    $("#post_message_type").val("js_erb")
    valuesToSubmit = $('form').serialize()
    $.ajax(
      type: "POST"
      url: "/posts"
      data: valuesToSubmit,
      dataType : 'script'
    )
    return false
  return