const checkToken = (token) => (
  fetch('http://localhost/pet-adoption-server/check_login.php', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      Accept: 'application/json',
    },
    body: JSON.stringify({token})
  }).then(res => res.json())
);
module.exports = checkToken;
