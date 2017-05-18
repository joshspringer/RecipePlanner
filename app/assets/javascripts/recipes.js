document.addEventListener("DOMContentLoaded", function(event) { 
  var app = new Vue({
    el: '#recipe_show',
    data: {
      message: 'Hello Vue!'

    },
    methods: {
      toggleFavorite: function(n) {
        console.log(n);
        console.log('toggleFavorite' + n);
        if (document.getElementById("fav_button" + n).className === "fa fa-heart-o") {
          document.getElementById("fav_button" + n).className = "fa fa-heart";
        } else {
          document.getElementById("fav_button" + n).className = "fa fa-heart-o";
        }
      },
      toggleMute: function() {
        console.log('toggleMute');
      }
    }
  });
});
