 getTop = ->
    height = $('#screenshot').height()
    $('#screenshot').css('top',height * 0.0641026)
    
 $(document).ready ->
 #Hover efect for work page
  $('body').on 'mouseenter ', '.project', () -> $(@).stop().animate({backgroundColor: "#eeeeee"})
  $('body').on 'mouseleave ', '.project', ()  -> $(@).stop().animate({backgroundColor:'#ffffff'})  
    
  $(window).resize ->
    getTop()
    
