//get the form elements
const movieForm = document.getElementById('movie-form');
const movieList = document.getElementById('movie-list');

//Store and retrieve movies from localStorage
let movieCollection = JSON.parse(localStorage.getItem('movies')) || [];

//Display stored movies on page load
window.onload = displayMovies;

movieForm.addEventListener('submit', (e) => {
    const title = document.getElementById('movie-title').valueOf;
    const genre = document.getElementById('genre').valueOf;
    const year = document.getElementById('year').valueOf;

    //Create movie oobject
    const movie = {title, genre, year};
    movieCollection.push(movie);

    //Save to localStorage
    localStorage.setItem('movies, JSON.stringify(movieCollection)');

    //Clear form inputs
    movieForm.reset();

    //Resfresh the displayed movie list
    displayMovies();
    
})

// Display stored movies and add remove option
function displayMovies() {
    movieList.innerHTML = '';
    for (let i = 0; i < movieCollection.length; i++) {
        const movie = movieCollection[i];
        const li = document.createElement('li');
        li.textContent = `${movie.title} (${movie.year}) - Genre: ${movie.genre}`;
        
        const removeBtn = document.createElement('button');
        removeBtn.textContent = 'Remove';
        removeBtn.addEventListener('click', () => {
            movieCollection.splice(i, 1); // Remove movie
            localStorage.setItem('movies', JSON.stringify(movieCollection)); // Update localStorage
            displayMovies(); // Refresh list
        });
        
        li.appendChild(removeBtn);
        movieList.appendChild(li);
    }
}


$("#add-movie").on("click", function () {
    // add click function & logic for AJAX request here
    
    var URL = 'https://api.themoviedb.org/3/movie/11?api_key=${apiKey}'
    // Make an AJAX request to fetch current weather data
    $.ajax({
        url: URL, // Use the constructed API URL
        method: 'GET', // Use the GET method to retrieve the data
        success: function(response) {
            console.log("Movie data: ", response)
            $("#movie-data").html(`
                <div>${movie.poster}</div>
            `);
        },
        error: function(error) {
            // Log any errors to the console for debugging
            console.error('Error getting movie data', error);
            // Display an error message if something goes wrong with the API request
            $("#error-message").text("There was an error retrieving the movie data.");
        }
    });
});
