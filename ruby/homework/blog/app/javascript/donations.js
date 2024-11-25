$(document).ready(function() {
    // Toggle the description for recurring donations
    $('#donation_recurring').on('change', function() {
      if ($(this).is(':checked')) {
        $('#recurring-description').show();
      } else {
        $('#recurring-description').hide();
      }
    });
  
    // Validate donation amount before submission
    $('form').on('submit', function(event) {
      const amount = parseFloat($('#donation_amount').val());
      if (isNaN(amount) || amount <= 0) {
        alert('Please enter a valid donation amount greater than $0.');
        event.preventDefault();
      }
    });
  });
  