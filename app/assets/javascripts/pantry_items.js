
document.addEventListener("DOMContentLoaded", function(event) { 
  var app = new Vue({
    el: '#pantry',
    data: {
      message: 'Hello Vue!',
      ingredients: [],
      newPantryItem: '',
    },
    mounted: function() {
      console.log('mounted');
      $.get("/api/v1/mypantry/1", function(response) {
        this.ingredients = response;
      }.bind(this));

    },
    methods: {
      addPantryItem: function() {
        if (this.newPantryItem !== "") {
          // console.log(this.newPantryItem);
          this.ingredients.push( {
            name: this.newPantryItem,
          });
        } else {
          console.log('new pantry item form is blank');
        }
        this.newPantryItem = "";
      },
      getIngredients: function() {
        console.log('get is working');
      }
    }

  });
});
