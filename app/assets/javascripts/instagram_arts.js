(function($){

  $('.button-flag').on('click', function(e){
    if( $('body').hasClass('index-out') == true ){
      removeIndexOut();
    } else {
      addIndexOut();
    }
  });

  $('.button-find').on('click', function(e){
    if( $('body').hasClass('index-out') == true ){
      removeIndexOut();
    } else {
      addIndexOut();
    }
  });

  $('.button-back').on('click', function(e){
    removeIndexOut();
  });

  var removeIndexOut = function(){
    $('body').removeClass('index-out');
  }
  var addIndexOut = function(){
    $('body').addClass('index-out');
  }

})(jQuery);
