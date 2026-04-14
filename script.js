let users = ["Ardit", "Elira", "Joni", "Tomas", "Jon", "Sara"];

function renderUsers() {
    const userList = document.getElementById('userList');
    if(!userList) return;
    userList.innerHTML = '';
    users.forEach((user, index) => {
        const card = document.createElement('div');
        card.className = 'user-card';
        card.innerHTML = `
            <h3>${user}</h3>
            <button class="delete-btn" onclick="deleteUser(${index})">Delete</button>
        `;
        userList.appendChild(card);
    });
}

function addUser() {
    const nameInput = document.getElementById('userName');
    if (nameInput && nameInput.value) {
        users.push(nameInput.value);
        nameInput.value = '';
        renderUsers();
    }
}

function deleteUser(index) {
    users.splice(index, 1);
    renderUsers();
}

const addBtn = document.getElementById('addUserBtn');
if(addBtn) addBtn.onclick = addUser;
renderUsers();
