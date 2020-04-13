const initData = () => (
    fetch('http://localhost/pet-adoption-server/')
        .then(res => res.json())
);
export default initData;