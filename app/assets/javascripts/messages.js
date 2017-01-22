// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function () {
  $(function () {
    var contactId = window.location.href.match(/\?contact_id=\d+/)[0].replace("?contact_id=", "");
    $.get('messages.json',
      {
        contact_id: contactId
      },
      function (data) {
        loadMessages(data.messages);
      }
    );
  });

  $('#send-message-button').click(function (e) {
    e.preventDefault();
    var recipientId = window.location.search.substring(1,9999).split("&").
    filter(function (param) {
      return param.split("=")[0] == "contact_id";
    })[0].split("=")[1];
    $.post('/customers/' + recipientId + '/messages',
      {
        recipient_id: recipientId,
        message_body: $('#message-text-area').val()
      },
      function (data) {
        if (data.notification) {
          var notificationDiv = $('<div class="modal absolute-center is-responsive" style="display:block"><p>' + data.notification + '</p></div>');
          $('body').append(notificationDiv);
          $('.modal').show();
          window.setTimeout(function () {
            $('.modal').hide()
          }, 3500);
        }
        else {
          loadMessages([data]);
        }
        $('#message-text-area').val("");
      }
    );
  });

  function loadMessages(messages) {
    messages.forEach(function (message) {
      var messageDiv = $('<div id="' + message.id + '" class="message' + (message.sender_id == message.customer_id ? " right" : "") + '"><p class="body">' + message.body + '</p><time class="sent timeago" datetime="' + message.created_at + '"></time></div>');
      $('#messages').append(messageDiv);
      var date = new Date(message.created_at);
      if ((Date.now() - date) / 1000 / 24 / 60 / 60 < 1) {
        $('.timeago').timeago();
      }
      else {
        $('.timeago').text(date.toTimeString().substring(0, 5) + " " + formatDate(date.toDateString(), false));
      }
    });
  }
});
