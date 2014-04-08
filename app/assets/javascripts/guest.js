//WingButton.fullMenu;
// WingButton.wings = [];
WingButton.wingTray = {};
WingButton.wingMenu = [];
WingButton.wingOptions = [];

// recursive function adds items to wingMenu list if it's a wing item
function recursiveAddMenuItems(item) {
  if ((item.is_orderable === 1) && (item.name.match(/wing/i))) {
    WingButton.wingMenu.push(item);
  }
  if (item.children) {
    item.children.forEach(function(child){
      recursiveAddMenuItems(child);
    });
  } else if (item.length) {
    item.forEach(function(child){
      recursiveAddMenuItems(child);
    });
  }
}

//get restaurant items from api
$.getJSON(WingButton.currentMenuURL, function( data ) {
  // WingButton.fullMenu = data.menu;
  recursiveAddMenuItems(data.menu);
  WingButton.wingMenu.forEach(function(item){
    renderMenuItem(item);
  });
});

//render function is recursive so it renders meal options
var renderMenuItem = function(item){
  var menuSection = $('<div>');
  var article = $('<article>');
  var name = $('<span>' + item.name + '</span>');
  if(item.price != '0.00'){
    var price = $('<b>' + "$" + item.price + '</b>')
    menuSection.attr('class', "menu-item" );
    var input = $('<input type="text" class="item-quantity-input" id="'+item.id+'">')
  }else{
    menuSection.attr('class', "menu-category" );
  };
  var descrip = $('<p>' + item.descrip + '</p>')
  article.append(input);

  article.append(name);
  article.append(price);
  menuSection.append(article);
  $('#all-content').append(menuSection);
  $('#'+item.id+'').keyup(function() {
      WingButton.wingTray[item.id] = this.value;
      renderTray();
    });
};

var renderTray = function(){
  
}

//will be called within renderMenuItem to render options
var renderMenuOption = function(item){
// if (item.children) {
  //   item.children.forEach(function(child){
  //     renderMenuItem(child);
  //   });
  // } else if (item.length) {
  //   item.forEach(function(child){
  //     renderMenuItem(child);
  //   });
  // }
};





// The tray is composed of menu items and optional sub-items. A single menu item's format is: [menu item id]/[qty],[option id],[option id]... Multiple menu items are joined by a +: [menu item id]/[qty]+[menu item id2]/[qty2] For example: 3270/2+3263/1,3279 Means 2 of menu item 3270 (with no sub options) and 1 of item num 3263 with sub option 3279.