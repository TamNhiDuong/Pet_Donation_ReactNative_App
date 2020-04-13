const searchAPI = (keyWord) => (
  fetch('http://localhost/pet-adoption-server/search.php?key=' + keyWord).then(res => 
    res.json())
);
export default searchAPI;