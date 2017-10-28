
var lastColor='#cc66ff';
var grid = clickableGrid(20,20,function(el,row,col,i){
  $(el).css('background-color', lastColor);
  $.ajax({
    url: '/save_color',
    dataType: 'json',
    data: {box_no: i, color: lastColor},
    type: 'POST',
    beforeSend: function(xhr) {
      xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
    },
    success: function(data) {
      $('#colorList > tbody:last-child').html('');
      $.each(data, function( index, value ) {
        $('#colorList > tbody:last-child').append('<tr><td>'+value['user']['user_name']+'</td><td>'+value.color+'</td></tr>');
      });
      $('span.history').show();
    }
  });
});

function clickableGrid( rows, cols, callback ){
  var i=0;
  var grid = document.createElement('table');
  grid.className = 'grid';
  for (var r=0;r<rows;++r){
    var tr = grid.appendChild(document.createElement('tr'));
    for (var c=0;c<cols;++c){
      var cell = tr.appendChild(document.createElement('td'));
      cell.id = ++i;
      cell.className = 'gridCell';
      cell.addEventListener('click',(function(el,r,c,i){
        return function(){
          callback(el,r,c,i);
        }
      })(cell,r,c,i),false);
    }
  }
  return grid;
}
function update(jscolor) {
  lastColor = '#'+jscolor;
}

$( document ).ready(function() {
  $('body').append(grid);

  (function getAllColors() {
    $.ajax({
      url: '/color_data',
      type: 'GET',
      success: function(data) {
        $.each(data, function( index, value ) {
          $('td#'+value.boxNo).css('background-color', value.color);
        });
      },
      complete: function() {
        setTimeout(getAllColors, 5000);
      }
    });
  })();

});
