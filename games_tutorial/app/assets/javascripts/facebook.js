$('body').prepend('<div id="fb-root"></div>');

window.fbAsyncInit=function(){
  console.log('fbAsyncInit');
  FB.init({appId: '1273884366011961', cookie: true});
}
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