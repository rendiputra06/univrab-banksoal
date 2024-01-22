$(document).ready(function(){
    load_unseen_notification();
});

$('.noti-icon').on('click', function(){
    $('#new_notif').html('');
    load_unseen_notification('yes');
});