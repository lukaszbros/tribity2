$ ->
  
  #Home page load
  $.ajax 'home.html',
      type: 'GET'
      cache: false
      success: (data) ->
        $('#main_content').html(data).fadeIn('fast')
  
  #Load page animation function
  loadContent = (data) ->
    $('#main_content').fadeOut 'fast', ->
          $(@).html(data).fadeIn('fast');
  
  #Back to home page by clicking logo      
  $('#logo').click ->
    $.ajax 'home.html',
      type: 'GET'
      success: (data) ->
        loadContent data
          
  #All links
  $('body').on 'click', 'a', (event) ->
    event.preventDefault()
    href = $(@).attr("href")
    $.ajax href,
      type: 'GET'      
      success: (data) ->
        loadContent data
