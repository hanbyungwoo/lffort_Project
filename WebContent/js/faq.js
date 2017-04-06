jQuery(function(){
  
  var article = $('.faq .article');
  article.addClass('show');
  article.find('.a').slideUp(100);
  
  $('.faq .article .trigger').click(function(){
    var myArticle = $(this).parents('.article:first');
    if(myArticle.hasClass('show')){
      article.addClass('show').removeClass('hide'); // 아코디언 효과를 원치 않으면 이 라인을 지우세요
      article.find('.a').slideUp(100); // 아코디언 효과를 원치 않으면 이 라인을 지우세요
      myArticle.removeClass('hide').addClass('show');
      myArticle.find('.a').slideDown(100);
    } else {
      myArticle.removeClass('show').addClass('hide');
      myArticle.find('.a').slideUp(100);
    }
  });
  
  $('.faq .hgroup .trigger').click(function(){
    var hidden = $('.faq .article.hide').length;
    if(hidden > 0){
      article.removeClass('hide').addClass('show');
      article.find('.a').slideDown(100);
    } else {
      article.removeClass('show').addClass('hide');
      article.find('.a').slideUp(100);
    }
  });
  
});