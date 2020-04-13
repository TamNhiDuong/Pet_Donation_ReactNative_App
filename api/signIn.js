const signIn = (email, password) =>(
  fetch('http://localhost/pet-adoption-server/login.php',
{
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      Accept: 'application/json',
    },
    body: JSON.stringify({email, password})
  }).then(res => res.json())
);
module.exports = signIn;
 