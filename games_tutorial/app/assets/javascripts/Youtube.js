// Search for a specified string.
  var q = $('#game_name').val();
  console.log('youtube console');
  var request = gapi.client.youtube.search.list({
    q: q,
    part: 'snippet',
    maxResults:1
  });
  request.execute(function(response) {
    var str = JSON.stringify(response.result);
    console.log(str);
  });