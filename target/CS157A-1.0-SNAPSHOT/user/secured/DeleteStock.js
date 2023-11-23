(function ($) {
    var search_button = $('.fa-trash'),
        input = $('.input'),
        submit_button = $('.submit-button'),
        textInput = $('#textInput'),  // Assuming your input field has an ID of 'textInput'
        myForm = $('#myForm');

    search_button.on('click', function () {
        // Show the input field and submit button
        input.fadeIn(500).addClass('visible');
        submit_button.fadeIn(500).addClass('visible');
    });

    myForm.on('submit', function (e) {
        e.preventDefault();
        // Get the text from the input field
        var enteredText = textInput.val();

        // Log the entered text to the console (for debugging purposes)
        console.log('Entered text:', enteredText);

        // Now you can send 'enteredText' to your JSP page using AJAX
        $.ajax({
            type: 'POST',
            url: 'DeleteStock.jsp',  // Replace with the actual URL of your JSP page
            data: { enteredText: enteredText },
            success: function (response) {
                console.log('Server response:', response);
                window.location.href = "DeleteStock.jsp?id=" + enteredText;
                //window.location.href = 'DeleteStock.jsp'
            },
            error: function (xhr, status, error) {
                console.error('Error:', status, error);
            }
        });
    });

})(jQuery);
