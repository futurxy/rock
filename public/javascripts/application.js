$(document).ready(function() {
  $('a[method]').livequery(function(){
    var message = $(this).attr('confirm');
    var method  = $(this).attr('method');
    
    if (!method && !message) return;
    
    $(this).click(function(event){
      if (message && !confirm(message)) {
        event.preventDefault();
        return;
      }
      
      if (method == 'post' || method == 'put' || method == 'delete') {
        event.preventDefault();
        var form = $("<form/>").attr('method', 'post').attr('action', this.href).attr('style', 'display: none');
        if (method != "post") {
          form.append($('<input type="hidden" name="_method"/>').attr('value', method));
        }
        form.insertAfter(this).submit();
      }
    });
  });
});