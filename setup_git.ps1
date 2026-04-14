git config user.name "Stiven Arifaj"
git config user.email "stiven@example.com"

# 1. TOMASI (HTML)
git checkout main
git checkout -b feature-html
Set-Content -Path index.html -Value @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <h1>User Dashboard</h1>
    </header>
    <main class="container">
        <section class="input-section">
            <input type="text" id="userName" placeholder="Shkruaj emrin...">
            <button id="addUserBtn">Add User</button>
        </section>
        <section id="userList" class="user-grid">
            <!-- Përdoruesit do të shfaqen këtu -->
        </section>
    </main>
    <script src="script.js"></script>
</body>
</html>
'@ -Encoding UTF8

Set-Content -Path script.js -Value 'let users = ["Ardit", "Elira", "Tomas"];' -Encoding UTF8
git add .
git commit -m "Nxenesi 1 (Tomas) - Shton strukturen HTML"
git push -u origin feature-html

# 2. JONI (CSS)
git checkout main
git checkout -b feature-css
Set-Content -Path style.css -Value @'
body { font-family: 'Segoe UI', sans-serif; background-color: #f4f7f6; margin: 0; text-align: center; }
header { background-color: #2c3e50; color: white; padding: 20px; margin-bottom: 20px; }
.container { max-width: 800px; margin: auto; padding: 20px; }
.input-section { margin-bottom: 30px; }
input { padding: 10px; border-radius: 5px; border: 1px solid #ddd; width: 200px; }
button { padding: 10px 20px; background-color: #27ae60; color: white; border: none; border-radius: 5px; cursor: pointer; }
button:hover { background-color: #219150; }
.user-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(180px, 1fr)); gap: 20px; }
.user-card { background: white; padding: 15px; border-radius: 10px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
.delete-btn { background-color: #e74c3c; margin-top: 10px; }
'@ -Encoding UTF8

Set-Content -Path script.js -Value 'let users = ["Ardit", "Elira", "Joni"];' -Encoding UTF8
git add .
git commit -m "Nxenesi 2 (Joni) - Shton dizajnin CSS"
git push -u origin feature-css

# 3. STIVENI (JS)
git checkout main
git checkout -b feature-js
Set-Content -Path script.js -Value @'
let users = ["Ardit", "Elira", "Jon", "Sara"];

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
'@ -Encoding UTF8
git add .
git commit -m "Nxenesi 3 (Stiven) - Shton funksionalitetin JS"
git push -u origin feature-js

# 4. BASHKIMI (MERGE) NË MAIN DHE KRIJIMI I KONFLIKTIT
git checkout main
git merge feature-html

# Merge CSS (shkakton konflikt te script.js sepse e kane ndryshuar te dy rreshtin 1)
git merge feature-css
# Zgjidhet konflikti paraprak midis Tomit dhe Jonit fshehurazi
Set-Content -Path script.js -Value 'let users = ["Ardit", "Elira", "Joni", "Tomas"];' -Encoding UTF8
git add script.js
git commit -m "Merge CSS dhe HTML (Konflikti i zgjidhur)"

# KRIJIMI I KONFLIKTIT KRYESOR ME KODIN TËND (feature-js)
git merge feature-js
