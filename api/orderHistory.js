const orderHistory = (token) => (
    fetch('https://php-server-pet-adoption.herokuapp.com/order_history.php', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Accept: 'application/json',
      },
      body: JSON.stringify({token})
    }).then(res => res.json())
  );
  module.exports = orderHistory;
  