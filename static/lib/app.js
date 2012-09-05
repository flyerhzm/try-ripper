$(function() {
  $('pre div').addClass("unfold");
  $('pre div').click(function() {
    var $self = $(this);
    if ($self.hasClass("unfold")) {
      $self.removeClass("unfold").addClass("fold");
      $self.children('div').hide();
    } else {
      $self.removeClass("fold").addClass("unfold");
      $self.children('div').show();
    }
    return false;
  });
});
