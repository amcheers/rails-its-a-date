import { nodeName } from "jquery";

const searchfunction = () => {

    const datesList = document.querySelectorAll('.title-to-search');
    const searchBar = document.getElementById('searchBar');
    let hpCharacters = [];

    if (searchBar) {
        searchBar.addEventListener('keyup', (e) => {
            const searchString = e.target.value.toLowerCase();
            for (var value of datesList.values()) {
                if (!value.textContent.toLowerCase().trim().includes(searchString)) {
                    value.closest(".category-search").hidden = true;
                }
                else {
                    value.closest(".category-search").hidden = false;
                }
            }
        });
    };

};

export { searchfunction };