import saveToken from './saveToken';

const refreshToken = (token) => (
  fetch('https://php-server-pet-adoption.herokuapp.com/refresh_token.php', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      Accept: 'application/json',
    },
    body: JSON.stringify({token})
  })
    .then(res => res.text())
    .then(token => saveToken(token))
);
module.exports = refreshToken;
