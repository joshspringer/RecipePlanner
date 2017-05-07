
document.addEventListener("DOMContentLoaded", function(event) { 
  var app = new Vue({
    el: '#app',
    mounted: function() {
      console.log('mounted');
    },
    data: {
      message: 'Hello Vue!',
      ingredients: '',
      newPantryItem: '',
    },

  });
});
