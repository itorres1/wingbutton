//WingButton.fullMenu;
WingButton.wingMenu = [];
WingButton.wings = [];

function recursiveAddMenuItems(item) {
  if ((item.is_orderable == 1) && (item.name.match(/wing/i))) {
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

$.getJSON(WingButton.currentMenuURL, function( data ) {
  WingButton.fullMenu = data.menu;
  recursiveAddMenuItems(data.menu);

  WingButton.wingMenu.forEach(function(item){
    //WingButton.wingOrders.push(new MenuItem(item.id));
    //WingButton.wingOrders[WingButton.wingOrders.length-1].render();
  });
  //item.name  => item's or category's name
  //item.price => 0.00 if a category or the item's price
  //item.is_orderable => 1 if an item, 0 if not...
  //item.id    => api's unique id
  //item's parents' ids
  //quantity
});


function MenuItem(itemID, quantity, optionId, itemName, price){
  this.itemID = itemID;
  this.quantity = quantity;
  this.optionID = optionID;
  this.itemName = itemName;
  this.price = price;
}

MenuItem.prototype.render = function(){
  //render a menuitem
  //<li class="wing" data-id="..."><span class="name">Hot Wing</span>...</li>
}

MenuItem.prototype.updateQuantity = function(quantity){

}


// The tray is composed of menu items and optional sub-items. A single menu item's format is: [menu item id]/[qty],[option id],[option id]... Multiple menu items are joined by a +: [menu item id]/[qty]+[menu item id2]/[qty2] For example: 3270/2+3263/1,3279 Means 2 of menu item 3270 (with no sub options) and 1 of item num 3263 with sub option 3279.