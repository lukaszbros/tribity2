 $(document).ready ->
 #Hover efect for work page
  $('body').on 'mouseenter ', '.project', () -> $(@).stop().animate({backgroundColor: "#eeeeee"})
  $('body').on 'mouseleave ', '.project', ()  -> $(@).stop().animate({backgroundColor:'#ffffff'})  