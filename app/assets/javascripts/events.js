var addEvent = document.getElementById('addEvent');

//Get dialog references
var containerDialog = document.getElementById('container-dialog');


/**
 * Show dialog when the add event button is clicked
 */

addEvent.addEventListener('click', function () {
    containerDialog.classList.remove('hide-element');

    closedialog();
});


/**
 * Close the dialog box when you click on another item
 */
function closedialog() {
    document.querySelector('.container-dialog').addEventListener('click', function (event) {
        if (event.target.id.toLowerCase() === 'container-dialog') {
            containerDialog.classList.add('hide-element');
        }
    });
}

