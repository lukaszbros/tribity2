$(document).ready ->
  
  #Home page load
  $('#main_content').load('contact.html').fadeIn('fast')
  
  #Load page animation function
  loadContent = (address) ->
    $('#main_content').fadeOut 'fast', ->
      $(@).load(address).fadeIn('fast')
  
  #Back to home page by clicking logo      
  $('#logo').click ->
    loadContent('home.html');
          
  #All links
  $('body').on 'click', 'a:not(.direct)', (event) ->
    event.preventDefault()
    href = $(@).attr("href")
    loadContent(href)
        
  #Hover efect for work page
  $('body').on 'mouseenter ', '.project', () -> $(@).stop().animate({backgroundColor: "#eeeeee"})
  $('body').on 'mouseleave ', '.project', ()  -> $(@).stop().animate({backgroundColor:'#ffffff'})  