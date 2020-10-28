$(function() {
  return $('#parking_postcode').jpostal({
    postcode: ['#parking_postcode'],
    address: {
      '#parking_prefecture_code': '%3',
      '#parking_address': '%4%5%6%7',
    },
  });
});