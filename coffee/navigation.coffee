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
      cache: false
      success: (data) ->
        loadContent data
          
  #All links
  $('body').on 'click', 'a:not(.direct)', (event) ->
    event.preventDefault()
    href = $(@).attr("href")
    $.ajax href,
      type: 'GET'
      cache: false      
      success: (data) ->
        loadContent data
        
  #Hover efect for work page
  #$('body').on 'mouseenter ', '.project', () -> $(@).animate({backgroundColor: "#aaaaaa"})
  #$('body').on 'mouseleave ', '.project', ()  -> $(@).animate({backgroundColor:'#ffffff'})  