//= require bootstrap_sb_admin_base_v2
//= require notifyjs
//= require bootbox


$.rails.allowAction = function(element) {
    
    var msg = element.attr('data-confirm');
    if (!msg) {return true;}
    
    var opts = {
        title: "Confirmation",
        message: msg,
        buttosn: {
            confirm: {
                label: 'Yes',
                className: 'btn-success'
            },
            cancel: {
                label: 'No',
                className: 'btn-danger'
            }
        },
        callback: function(result){
            if (result) {
              element.removeAttr('data-confirm');
              element.trigger('click.rails')
              
            }
            
        }
  };
  
  bootbox.confirm(opts);
  
  return false;
  
}
    
