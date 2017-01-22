// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function () {
  $(function () {
    $.get('conversations.json',
      function (data) {
        data.conversations.forEach(function (conversation) {
          var messages = conversation.messages
          // var conversationDiv = $('<div id="conversation-with-' + conversation.contact.id + '"' + (messages[messages.length - 1].read ? "" : " class=\"unread\"") + '><a href="' + window.location.pathname.replace("conversations", "messages") + '"><h3>Conversation with ' + conversation.contact.username + '</h3><span class="message-preview">' + messages[messages.length - 1].body.substr(0, 50) + '</span></a><button id="delete-conversation-with-' + conversation.contact.id + '">DELETE</button></div>');
          // $('#conversations').append(conversationDiv);

          $('#conversation-with-' + conversation.contact.id + ' a').click(function (e) {
            e.preventDefault();
            var form = $('<form id="pass-id" action="' + window.location.pathname.replace("conversations", "messages") + '" method="GET"><input type="hidden" name="contact_id" value="' + conversation.contact.id + '" /></form>');
            $('#conversation-with-' + conversation.contact.id).append(form);
            $('#pass-id').submit();
          });

          $('#delete-conversation-with-' + conversation.contact.id).click(function () {
            $.ajax({
              type: 'delete',
              url: window.location.pathname.replace("conversations", "messages") + '/' + messages[messages.length - 1].id,
              data: {
                contact_id: conversation.contact.id
              }
            }).done(function (data) {
              $('#conversation-with-' + conversation.contact.id).remove();
            });
          });
        });
      }
    );
  });
});
