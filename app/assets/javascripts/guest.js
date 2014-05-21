// window.WingButton = {};
// //WingButton.fullMenu;
// // WingButton.wings = [];
// WingButton.wingTray = {};
// WingButton.wingMenu = [];
// WingButton.wingOptions = [];

// Animation for the header
$('#header a').mouseenter(function(){
  $('#header a').css("color", "red");
});
$('#header').mouseleave(function(){
  $('#header a').css("color", "orange");
});

// Animation for forms
$('input').focus(function(){
  $(this).css('outline-color', 'orange');
})

// recursive function adds items to wingMenu list if it's a wing item
function recursiveAddMenuItems(item) {
  // WingButton.wingMenu.push(item);
  if ( (item.name) && (item.name.match(/wing/i)) ) {
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
    var price = $('<b> ' + "$" + item.price + '</b>')
    menuSection.attr('class', "menu-item" );
    var input = $('<input type="text" class="item-quantity-input" id="'+item.id+'">')
  }else{
    menuSection.attr('class', "menu-item" );
    menuSection.css({"font-weight":"bold", "font-size":"18px"});

  };
  var descrip = $('<p>' + item.descrip + '</p>')
  article.append(input);
  article.append(name);
  article.append(price);
  menuSection.append(article);
  $('<hr>').appendTo(menuSection);
  $('.menu-items').append(menuSection);
  $('#'+item.id+'').keyup(function() {
    WingButton.wingTray[item.id] = this.value;
    renderTray();
  });
};

var createOrderString = function(){
  var result = "";
  $.each(WingButton.wingTray, function(index, value){
    if(value > 0){
      result = result + index + "/" + value + "+";
    }
  });
  result = result.substring(0, result.length - 1);
  return result;
};

var renderTray = function(){
  $('.tray-section').remove();
  var total = 0;
  $.each(WingButton.wingTray, function(index, value){
    if(value>0){
      var selectItem = {}
      var traySection = $('<div class="tray-section">')
      var article = $('<article>')
      WingButton.wingMenu.forEach(function(item){
        if(item.id === index){
          selectItem = item;
        };
      })
      var itemPrice = $('<b>' + " $" + selectItem.price * value + '</b>');
      total = total + (selectItem.price * value)
      var name = $('<em>' + selectItem.name + '</em>');
      article.append(name);
      article.append(itemPrice);
      traySection.append(article);
      $('#tray').append(traySection)
    }
  });
  var orderString = createOrderString();
  var traySection = $('<div class="tray-section">')
  addTotal = $('<br>Total: <b>$'+total+'</b></br>');
  var form = $('<form action="/guest/order" method="POST">');
  form.append('<input type="hidden" name="orderString" value="'+orderString+'"/>');
  // form.append('<input name="authenticity_token" type="hidden" value="'+window._token+ '" />')
  form.append('<br><input type="submit" class="enter-wings" id="orderButton" value="Order now" />');
  traySection.append(addTotal);
  traySection.append(form)
  $('#tray').append(traySection);
};
renderTray();

// Render Google Map
var geocoder;
var map;
function initialize() {
  geocoder = new google.maps.Geocoder();
  var latlng = new google.maps.LatLng(-34.397, 150.644);
  var mapOptions = {
    zoom: 15,
    center: latlng
  }
  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
  codeAddress();
}
function codeAddress() {
  var address = $('#address').text();
  geocoder.geocode( { 'address': address}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      map.setCenter(results[0].geometry.location);
      var marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
      });
    } 
  });
}
$(document).ready(function() { initialize() });

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
