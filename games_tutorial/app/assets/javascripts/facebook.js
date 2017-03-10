$('body').prepend('<div id="fb-root"></div>');

window.fbAsyncInit=function(){
  console.log('fbAsyncInit');
  FB.init({appId: '1273884366011961', cookie: true});
}
  $('#sign_in').click(
    function(e,response)
    { 
      console.log('signin click');
      e.preventDefault();
      FB.login =function(response)
      {
        if(response.authResponse)
          window.location = '/auth/facebook/callback';
      }
  });
  $('#sign_out').onclick=function(response){
    FB.getLoginStatus=function(response){ 
    if(response.authResponse)
      {
        FB.logout(); 
        console.log("fb logout");
      }
    }
    return true;
}