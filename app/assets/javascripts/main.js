$(function() {
  // Remove alert message after a delay
  $(".alert" ).delay(5000).fadeOut(2000);




  // Nav bar active button handler
  function stripTrailingSlash(str) {
    if(str.substr(-1) == '/') {
      return str.substr(0, str.length - 1);
    }
    return str;
  }

  var url = window.location.pathname;  
  var activePage = stripTrailingSlash(url);

  $('.nav li a').each(function(){  
    var currentPage = stripTrailingSlash($(this).attr('href'));

    if (activePage == currentPage) {
      $(this).parent().addClass('active'); 
      $(this).addClass('nav-active');
    } 
  });

});

