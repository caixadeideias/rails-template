var App = window.App = {
  // Put other existing namespaces here
  Common: {
    init: function(){
    },

    finish: function(){
    },
    flash: function(){
      setTimeout( function(){
        $('.flash').slideDown('slow')
      }, 100)
      if( $('.flash a').length === 0){
        setTimeout( function(){
          $('.flash').slideUp('slow')
        }, 16000)
        $(window).click( function(){
          $('.flash').slideUp()
        })
      }
    },
  }
};