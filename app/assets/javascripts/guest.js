//WingButton.fullMenu;
WingButton.wingMenu = [];
WingButton.wings = [];
WingButton.wingOrders = [];

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

//gets restaurant items from api
$.getJSON(WingButton.currentMenuURL, function( data ) {
  WingButton.fullMenu = data.menu;
  recursiveAddMenuItems(data.menu);

  WingButton.wingMenu.forEach(function(item){
    WingButton.wings.push(new MenuItem(item.id, item.name, item.price ));
  });
  WingButton.wings[WingButton.wings.length-1].render()
  //item.name  => item's or category's name
  //item.price => 0.00 if a category or the item's price
  //item.is_orderable => 1 if an item, 0 if not...
  //item.id    => api's unique id
  //item's parents' ids
  //quantity
});

// define constructor for menu items
function MenuItem(itemID, itemName, itemPrice){
  this.itemID = itemID;
  this.itemName = itemName;
  this.itemPrice = itemPrice;
}

MenuItem.prototype.render = function(){
  //render a menuitem
  //<li class="wing" data-id="..."><span class="name">Hot Wing</span>...</li>
  var menuSection = $('<div>');
  menuSection.attr('class', "menu-section");
  var article = $('<article>');
  var name = $('<h2>' + this.itemName + '</h2>')
  var price = $('<h3>' + "$" + this.itemPrice + '</h3>')
  article.append(name);
  article.append(price);
  menuSection.append(article);

  $('body').append(menuSection);
}

MenuItem.prototype.updateQuantity = function(quantity){

}


// The tray is composed of menu items and optional sub-items. A single menu item's format is: [menu item id]/[qty],[option id],[option id]... Multiple menu items are joined by a +: [menu item id]/[qty]+[menu item id2]/[qty2] For example: 3270/2+3263/1,3279 Means 2 of menu item 3270 (with no sub options) and 1 of item num 3263 with sub option 3279.