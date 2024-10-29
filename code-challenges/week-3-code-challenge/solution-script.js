$(function () {
    $('movie-form').on('submit', function (event) {
        event.preventDefault()

        //Get form values
        const title = $('title').val();
        const genre = $('title').val();
        const year = $('year').val();

        //Create a movie object
        const movie = {title, genre, year};
        console.log(movie)

        //Get movies from LocalStorage

        if(localStorage.getItem('movies')){
            let movies = JSON.parse(localStorage.movies)
        }else{
            let movies = [];
        }

        // add the new movie to the array
        movies.push(movie);


        // Store the updated movies array back to 
        localStorage.setItem('movies', JSON.stringify(movies))


        //Clear the form inputs
        $('movie-form')[0].reset();


        displayMovies()
    })
    

    function displayMovies(){
        const movieList = $('movie-list');
        movieList.empty(); //clear the list


        //get movies
        let movies - JSON.parse(localStorage.getItem('movies')) || [];

        //use for/in loop to iterate over movies
        for(let index in movies){
            let movie = movies[index]
            let listItem = $('<li></li>').text("${movie.title} ({$movie.genre}, ${movie.year})");
            movieList.append(listItem)
        }

        
    }

      var URL = 'https://api.themoviedb.org/3/movie/11?api_key=${apiKey}'

    $('search-btn').click(function {
        var movie = $('search-movie').val()

        .ajax({
            url: URL + movie,
            method:"GET",
            success: function(data){
                if(data.Response === "True"){
                    const movieInfo = '
                    <h3>Title: </h3>
                    <p>Genre: </p>
                    <p>Year: </p>
                    ';
                    |$("#movie-data").append(movieInfo)}:
                 else  { |$("#movie-data").append("Movie not found")};
                
            },
            error:
        })
    })
})