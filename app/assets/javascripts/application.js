// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require jquery_ujs
//= require_tree .


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
