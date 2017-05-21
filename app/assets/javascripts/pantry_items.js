
document.addEventListener("DOMContentLoaded", function(event) { 
  Vue.component('v-select', VueSelect.VueSelect);
  var app = new Vue({
    el: '#pantry',
    data: {
      pantry_items: {},
      herbs: {}, //1
      fruit: {}, //3
      veg: {}, //4
      meat: {}, //5
      canned: {}, //6
      sauces: {}, //7
      dairy: {}, //8
      baking: {}, //9
      pasta: {}, //10
      bread: {}, //11
      oil: {}, //12
      nuts: {}, //13
      uncat: {}, //14
      newPantryItem: '',
    },
    mounted: function() {
      console.log('mounted');
      // change /1 to current_user
      $.get("/api/v1/mypantry/1", function(response) {
        this.herbs = response[1];
        this.fruit = response[3];
        this.veg = response[4];
        this.meat = response[5];
        this.canned = response[6];
        this.sauces = response[7];
        this.dairy = response[8];
        this.baking = response[9];
        this.pasta = response[10];
        this.bread = response[11];
        this.oil = response[12];
        this.nuts = response[14];
        this.uncat = response[2];

      }.bind(this));


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
      deletePantryItem: function(category, ingredient, ingredient_object) {
        console.log('delete an item:');
        console.log('category: ' + category);
        console.log('ingredient id: ' + ingredient);
        // console.log('current_user id: ' + document.getElementById("current_user").value);
        var parameters = {
          ingredient_id: ingredient,
        };
        // $.ajax({
        //   url: '/api/v1/pantry_items',
        //   method: 'delete',
        //   data: parameters
        // });

        $.get("/api/v1/remove_pantry_items", parameters);

        var index = this[category].indexOf(ingredient_object);
        console.log(index);
        this[category].splice(index, 1);
      }
    }

  });
});
