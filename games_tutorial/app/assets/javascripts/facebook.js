$('body').prepend('<div id="fb-root"></div>');


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

  
$('#sign_in_fb').click(
  function(e,response)
  { 
    alert('signin click');
    e.preventDefault();
    FB.getLoginStatus(
      function(response){
        if(response.status=='not_authorized'){
          console.log('already logged in');
        }
        else
          FB.login =function(response)
          {
            console.log('logging in');
            if(response.authResponse)
              window.location = '/auth/facebook/callback';
          }
    });
});
$('#sign_out_fb').click(function(response){
  console.log("logout");
  FB.getLoginStatus(function(response){ 
  if(response.authResponse)
    {
      FB.logout(); 
      console.log("fb logout");
    }
  });
  return true;
});