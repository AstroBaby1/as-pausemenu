window.addEventListener("message", (event) => {
    const drawTextElement = document.getElementById("drawText");
    var dollar = Intl.NumberFormat('en-US');
    if (event.data.type === 'characterData') {
        // Access the data sent from Lua
        var characterData = event.data.data;
        console.log(characterData.bankAmount)
        // Update the HTML elements with the received data
        document.querySelector('.character-text').innerHTML = characterData.characterName;
        document.querySelector('.jobtext').innerHTML = characterData.job;
        document.querySelector('.cashamount').innerHTML = (dollar.format(characterData.cashAmount));
        document.querySelector('.bankamount').innerHTML = (dollar.format(characterData.bankAmount));
        document.querySelector('.players').innerText = characterData.playersOnline;
        document.querySelector('.policeo').innerText = characterData.policeAvailable ? 'AVAILABLE' : 'UNAVAILABLE';
    
    }

    if (event.data.action === "show") {
        $(".pausemenu").fadeIn(200);
        $(".settings").fadeIn(200);
        $(".discord").fadeIn(200);
        $(".leave").fadeIn(200);
        $(".playeronline").fadeIn(200);
        $(".police").fadeIn(200);

    } 
    if (event.data.action === "hide") {
        $(".pausemenu").fadeOut(1);
        $(".settings").fadeOut(1);
        $(".discord").fadeOut(1);
        $(".leave").fadeOut(1);
        $(".playeronline").fadeOut(1);
        $(".police").fadeOut(1);

    }
});

// Function for the MAP button
function mapButtonClick() {
    $.post('http://as-pausemenu/Map', JSON.stringify({}));

}

// Function for the SETTINGS button
function settingsButtonClick() {
    $.post('http://as-pausemenu/Settings', JSON.stringify({}));

}

// Function for the DISCORD button
function discordButtonClick() {
    // Add your code here
}

// Function for the LEAVE button
function leaveButtonClick() {
    $.post('http://as-pausemenu/DropPlayer', JSON.stringify({}));
}
