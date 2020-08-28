window.addEventListener('load', function(){
  $("#item_price").on('input', function(){
    let price = $("#item_price").val();
    if( 300 <= price && price <= 9999999) {
    let tax = Math.floor(price / 10);
    let profit = (price - tax);
    $("#add-tax-price").text(tax);
    $("#profit").text(profit);
    }else{
    $("#add-tax-price").text('');
    $("#profit").text('');
    }
  })
});