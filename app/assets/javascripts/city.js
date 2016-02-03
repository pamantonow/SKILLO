var cities = [];

$( document ).ready(function() {
  var response;
  var url = '/users.json'


  var getAjax = $.ajax({
    method: "GET",
    url: url,
    success: onSuccess,
    dataType: "json"
  });

 
  function onSuccess(response){
   
    for(var i = 0; i < response.length; i++){
    cities.push(response[i].city)
    }
    cities = cities.getUnique()
    $('#city .typeahead').typeahead({
  hint: true,
  highlight: true,
  minLength: 1
},
{
  name: 'cities',
  source: substringMatcher(cities)
});
  }
  //onSuccess();

});

Array.prototype.getUnique = function(){
   var u = {}, a = [];
   for(var i = 0, l = this.length; i < l; ++i){
      if(u.hasOwnProperty(this[i])) {
         continue;
      }
      a.push(this[i]);
      u[this[i]] = 1;
   }
   return a;
}

  var substringMatcher = function(strs) {

  return function findMatches(q, cb) {
    var matches, substringRegex;

    // an array that will be populated with substring matches
    matches = [];

    // regex used to determine if a string contains the substring `q`
    substrRegex = new RegExp(q, 'i');

    // iterate through the pool of strings and for any string that
    // contains the substring `q`, add it to the `matches` array
    $.each(strs, function(i, str) {
      if (substrRegex.test(str)) {
        matches.push(str);
      }
    });

    cb(matches);
  };
};

