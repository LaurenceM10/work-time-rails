var input = document.getElementById('user-filter');
var userList = document.getElementById('list-filter-user');

/*
* When the user pressed a key in the input
* filter users
*/
input.addEventListener('keyup', function () {
   filterUsers();
   closeFilter();
});

input.addEventListener('click', function () {
    closeFilter();
});

/**
 * To close the filter when the pressed some other elements
 */
function closeFilter() {
    document.querySelector('.artistic-container').addEventListener('click', function (event) {
        if (event.target.id.toLowerCase() === 'list-filter-user'
            || event.target.id.toLowerCase() === 'user-filter') {

            userList.classList.add('show');

        } else {
            userList.classList.remove('show');
        }
    });
}


/**
 * To show a box filter
 */
function filterUsers() {
    var input, filter, ul, li, span, i;

    input = document.getElementById("user-filter");
    filter = input.value.toUpperCase();
    ul = document.getElementById("list-filter-user");
    li = ul.getElementsByTagName("li");
    for (i = 0; i < li.length; i++) {
        span = li[i].getElementsByTagName("span")[0];
        if (span.innerHTML.toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "";
        } else {
            li[i].style.display = "none";
        }
    }
}