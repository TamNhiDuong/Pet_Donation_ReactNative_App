const submitOrder = (token, arrayDetail) => (
  fetch('https://php-server-pet-adoption.herokuapp.com/cart.php', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      Accept: 'application/json',
    },
    body: JSON.stringify({token, arrayDetail})
  }).then(res => res.text())
);
module.exports = submitOrder;