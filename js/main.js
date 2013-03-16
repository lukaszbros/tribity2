// Generated by CoffeeScript 1.4.0
(function() {

  $(document).ready(function() {
    $('body').on('mouseenter ', '.purpose:not(.selected-purpose)', function() {
      return $(this).find('.icon').attr('class', function(i, c) {
        return c.replace(/_icon/, '_icon_hover');
      });
    });
    $('body').on('mouseleave ', '.purpose:not(.selected-purpose)', function() {
      return $(this).find('.icon').attr('class', function(i, c) {
        return c.replace(/_hover/g, '');
      });
    });
    return $('body').on('click', '.purpose', function() {
      $('.purpose').removeClass('selected-purpose');
      $('.icon').attr('class', function(i, c) {
        return c.replace(/_hover/g, '');
      });
      $(this).addClass('selected-purpose');
      $(this).find('.icon').attr('class', function(i, c) {
        return c.replace(/_icon/, '_icon_hover');
      });
      console.log($(this).attr('id'));
      return $('#purpose').val($(this).attr('id'));
    });
  });

  $(document).ready(function() {
    var loadContent, selectLogo;
    $('#main_content').load('work-racinglife.html', function() {
      return $(this).fadeIn('fast');
    });
    selectLogo = function(address) {
      switch (address) {
        case 'home.html':
          return $('logo').html('Tribity <span class="ux">UX</span> <span class="design">Design</span> <span class="software">Software</span>');
        case 'work.html':
          return $('logo').html('Tribity<span class="grey">\'s work</span>');
      }
    };
    loadContent = function(address) {
      $('footer').fadeOut('fast');
      $('#logo').hide("slide", {
        direction: "up"
      }, 'fast');
      return $('#main_content').fadeOut('fast', function() {
        return $(this).load(address, function() {
          $(this).fadeIn('fast');
          selectLogo(address);
          $('#logo').slideDown();
          return $('footer').fadeIn('fast');
        });
      });
    };
    $('#logo').click(function() {
      return loadContent('home.html');
    });
    $('body').on('click', 'a:not(.direct)', function(event) {
      var href;
      event.preventDefault();
      href = $(this).attr("href");
      return loadContent(href);
    });
    return $('body').on('click', '.project', function() {
      return loadContent('work-' + $(this).attr('id') + '.html');
    });
  });

  $(document).ready(function() {
    $('body').on('mouseenter ', '.project', function() {
      return $(this).stop().animate({
        backgroundColor: "#eeeeee"
      });
    });
    return $('body').on('mouseleave ', '.project', function() {
      return $(this).stop().animate({
        backgroundColor: '#ffffff'
      });
    });
  });

}).call(this);
