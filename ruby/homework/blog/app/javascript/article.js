$(document).ready(function() {
    console.log("jQuery is working!");

    // Toggle the visibility of additional comments
    $('#toggle-button').click(function() {
        // Toggle the visibility of the additional comments section
        $('#additional-comments').toggle();

        // Change the button text based on the visibility of the comments section
        if ($('#additional-comments').is(':visible')) {
            $('#toggle-button').text('Show Less Comments');
        } else {
            $('#toggle-button').text('Show More Comments');
        }
    });

    // Dynamic content loading for comments
    $('#load-comments').on('click', function() {
        const categoryId = $('#category-id').data('category'); // Get category ID
        const articleId = $('#load-comments').data('article'); // Get article ID

        const url = `/categories/${categoryId}/articles/${articleId}/comments`; // Define the URL to fetch comments

        console.log("Fetching comments from:", url);

        // Use $.getJSON to fetch comments asynchronously
        $.getJSON(url, function(data) {
            console.log("Comments fetched:", data);
            // Append each comment to the #comments container
            data.forEach(comment => {
                $('#comments').append(`
                    <div class="comment">
                        <p>${comment.content}</p>
                        <p><strong>By:</strong> ${comment.author}</p>
                    </div>
                `);
            });
        })
        .fail(function(jqXHR, textStatus, errorThrown) {
            console.error("Error fetching comments:", textStatus, errorThrown);
            // Display an error message if the request fails
            $('#comments').append('<p>Failed to load comments. Please try again later.</p>');
        });
    });

    // Like button functionality
    $(document).on('click', '.like-btn', function() {
        const commentId = $(this).data('comment-id'); // Get the comment ID
        const button = $(this);

        // Toggle the button text between "Like" and "Unlike"
        if (button.text() === "Like") {
            button.text("Unlike");
            button.addClass('liked'); // Optional: Add a class for styling
        } else {
            button.text("Like");
            button.removeClass('liked');
        }

        // Log the action for debugging
        console.log(`Toggled Like state for comment ID: ${commentId}`);
    });
});
