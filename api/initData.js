const initData = () => (
    fetch('https://php-server-pet-adoption.herokuapp.com/')
        .then(res => res.json())
);
export default initData;