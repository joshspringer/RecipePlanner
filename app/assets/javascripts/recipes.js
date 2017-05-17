document.addEventListener("DOMContentLoaded", function(event) { 
  var app = new Vue({
    el: '#recipe_show',
    data: {
      message: 'Hello Vue!'

    },
    methods: {
      toggleFavorite: function() {
        console.log('toggleFavorite');
        if (document.getElementById("fav_button").className === "fa fa-heart-o") {
          document.getElementById("fav_button").className = "fa fa-heart";
        } else {
          document.getElementById("fav_button").className = "fa fa-heart-o";
        }
      },
      toggleMute: function() {
        console.log('toggleMute');
      }
    }
  });
});
