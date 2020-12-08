import { nodeName } from "jquery";

const searchfunction = () => {


const datesList = document.querySelectorAll('.title-to-search');
const searchBar = document.getElementById('searchBar');
let hpCharacters = [];

if (searchBar) {
searchBar.addEventListener('keyup', (e) => {
    const searchString = e.target.value.toLowerCase();

    for(var value of datesList.values()) {
        console.log(searchString);
        console.log(value.textContent.toLowerCase().includes(searchString));
        console.log(value.textContent.toLowerCase());
        if (!value.textContent.toLowerCase().includes(searchString)) {
            value.parentNode.hidden = true;
        }
        else{
            value.parentNode.hidden = false;
        }
      }
});
};

};

export { searchfunction };