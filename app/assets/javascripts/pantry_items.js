
document.addEventListener("DOMContentLoaded", function(event) { 
  Vue.component('v-select', VueSelect.VueSelect);
  var app = new Vue({
    el: '#pantry',
    data: {
      pantry_items: {},
      herbs: {},
      newPantryItem: '',
    },
    mounted: function() {
      // console.log('mounted');
      // $.get("/api/v1/mypantry/1", function(response) {
      //   this.pantry_items = response;
      //   // console.log(response);
      //   console.log(this.pantry_items);
      // }.bind(this));
    },
    methods: {
      addPantryItem: function() {
        // need to connect ingredient name to ingredient id
        var parameters = {
          ingredient_name: this.newPantryItem,
          pantry_type: 1
        };
        if (this.newPantryItem !== "") {
          console.log(this.newPantryItem);
          $.post("/api/v1/pantry_items", parameters, function(response) {
            this.pantry_items.push(response);
            // this.newPantryItem = "";
          }.bind(this));
          // this.pantry_items.push( {
          //   ingredient_name: this.newPantryItem,
          //   pantry_type: 1
          // });
        } else {
          console.log('new pantry item form is blank');
        }
        this.newPantryItem = "";
        // console.log(this.pantry_items);
      },
      deletePantryItem: function(category,ingredient) {
        console.log('delete an item:');
        console.log('ingredient id: ' + ingredient);
        // update to use current_user
        var parameters = {
          ingredient_id: ingredient,
          category_id: category,
        };
        $.get("/api/v1/pantry_items", parameters);
      }
    }

  });
});
