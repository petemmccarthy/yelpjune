$(document).ready(function(){
  $('.endorsement-link').on('click', function(event) {
    var endorsementCount = $(this).siblings('.endorsement_count')
    event.preventDefault();

 // you create a callback inside the post method to hget the response back
    $.post(this.href, function(response) {
      endorsementCount.text(response.new_endorsement_count);
    });
  })
})
// on the site the above needs the endorsement(s) pluralization sorting

// ensure you have js true in your tests!!