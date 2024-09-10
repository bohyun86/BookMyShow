// JavaScript to toggle dropdown menu visibility
document.getElementById('cs-dropdown').addEventListener('mouseover', function(event) {
    event.preventDefault(); // Prevent default link behavior
    const dropdownMenu = document.getElementById('cs-dropdown-menu');
    dropdownMenu.style.display = dropdownMenu.style.display === 'block' ? 'none' : 'block';
});



// Hide the dropdown when clicking outside
document.addEventListener('click', function(event) {
    const dropdownMenu = document.getElementById('cs-dropdown-menu');
    const isClickInside = document.getElementById('cs-dropdown').contains(event.target);
    if (!isClickInside && dropdownMenu.style.display === 'block') {
        dropdownMenu.style.display = 'none';
    }
});