$(function() {
  $('.nav-tabs a').click(function() {
    $('.nav-tabs li').removeClass('active');
    $(this).parent().addClass('active');
    $('input[name=source]').val($(this).attr('href').replace('#', ''));
  });

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
