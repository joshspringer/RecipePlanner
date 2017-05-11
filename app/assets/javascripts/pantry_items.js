
document.addEventListener("DOMContentLoaded", function(event) { 
  var app = new Vue({
    el: '#app',
    data: {
      message: 'Hello Vue!',
      ingredients: [1,2,2,2,2,2],
      newPantryItem: 'a',
    },
    mounted: function() {
      console.log('mounted');
      $.get("/api/v1/mypantry/1", function(response) {
        console.log(this.ingredients);
        this.ingredients = response;
        console.log(this.ingredients);
        console.log(this);
        console.log(this.newPantryItem);
        this.newPantryItem = 'potato';
        console.log(this.newPantryItem);
        console.log(this._data.ingredients);
      }.bind(this));

    },
    methods: {
      addPantryItem: function() {
        if (this.newPantryItem !== "") {
          console.log('this.newPantryItem');
          // this.ingredients.push( {
          //   name: this.newPantryItem,
          // });
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
