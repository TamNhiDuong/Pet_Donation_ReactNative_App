const searchAPI = (keyWord) => (
  fetch('https://php-server-pet-adoption.herokuapp.com/search.php?key=' + keyWord).then(res => 
    res.json())
);
export default searchAPI;