// Funksionaliteti nga Stiven Arifaj

let users = [" Ardit\, \Elira\, \Joni-dhe-Sara\]; // Ndryshimi nga Nxënësi 3 në feature-js

const userListElement = document.getElementById('userList');
const addUserBtn = document.getElementById('addUserBtn');
const userNameInput = document.getElementById('userName');

// Funksioni për të shfaqur përdoruesit (Render)
function renderUsers() {
    userListElement.innerHTML = '';
    
    users.forEach((user, index) => {
        const card = document.createElement('div');
        card.className = 'user-card';
        
        card.innerHTML = `
            <h3>${user}</h3>
            <button class="delete-btn" onclick="deleteUser(${index})">Fshi</button>
        `;
        
        userListElement.appendChild(card);
    });
}

// Funksioni për të shtuar një përdorues të ri
function addUser() {
    const name = userNameInput.value.trim();
    
    if (name !== "") {
        users.push(name);
        userNameInput.value = "";
        renderUsers();
    } else {
        alert("Ju lutem shkruani një emër!");
    }
}

// Funksioni për të fshirë një përdorues
window.deleteUser = function(index) {
    users.splice(index, 1);
    renderUsers();
};

// Event Listeners
addUserBtn.addEventListener('click', addUser);

// Render initial
renderUsers();
