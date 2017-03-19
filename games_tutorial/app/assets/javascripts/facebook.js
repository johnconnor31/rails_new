$('body').prepend('<div id=\fb-root\></div>');

// $.ajax( {url: 'https://connect.facebook.net/en_US/all.js',
//     dataType: 'script',
//     cache: true
// });

  window.fbAsyncInit = function() {
    FB.init({
      appId      : '1273884366011961',
      client_id  :'https://the-rails-understanding-sairam31.c9users.io/',
      cookie     : true,
      xfbml      : true,
      version    : 'v2.8',
    });
    // FB.AppEvents.logPageView();   
  };

  
  $('#sign_in').onclick=function(e,response){
        e.preventDefault();
        FB.login =function(response){
          console.log(response);
        if(response.authResponse)
          window.location = '/auth/facebook/callback';
        }
    }
    
    $('#sign_out').onclick= function(response){
      
      FB.getLoginStatus=function(response) {
      if(response.authResponse)
      FB.logout();
      return true;
        }
    }