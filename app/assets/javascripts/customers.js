// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function () {
  var recipientId;
  $('#open-message-modal-button').click(function (e) {
    e.preventDefault();
    $('#message-modal').show();
  });
  $('#send-message-button').click(function (e) {
    e.preventDefault();
    recipientId = $('#user-id').attr('data-id');
    $.post('/customers/' + recipientId + '/messages',
      {
        recipient_id: recipientId,
        message_body: $('#modal-message-text-area').val()
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
        $('#modal-message-text-area').val("");
        $('#message-modal').hide();
      }
    );
  });
  $('#customer_profile_attributes_imperial').bind("keyup change", function(e) {
    var imperial_num = parseFloat($('#customer_profile_attributes_imperial').val());
    metric_num = imperialToMetric(imperial_num);
    $('#customer_profile_attributes_metric').val(metric_num.toFixed(0))
  });
  $('#customer_profile_attributes_metric').bind("keyup change", function (e) {
    var metric_num = parseFloat($('#customer_profile_attributes_metric').val());
    imperial_num = metricToImperial(metric_num);
    $('#customer_profile_attributes_imperial').val(imperial_num.toFixed(0))
  });
  function imperialToMetric(num) {
    metric_conversion = num / 2.2;
    return metric_conversion;
  }
  function metricToImperial(num) {
    imperial_conversion = num * 2.2;
    return imperial_conversion;
  }

  $('.avatar.selectable input[checked=checked]').parent().css('border-width', '5px');
  // AVATAR RADIO SELECT
  $('.avatar.selectable img').click(function () {
    $(this).parent().css('border-width', '5px');
    $(this).parent().siblings().css('border-width', '3px');
    $('.avatar .selectable').siblings('input').attr('checked', null);
    $($(this).siblings('input')[0]).attr('checked', "checked");
  });

  // JCROP
  var ImageCropper,
  bind = function(fn, me){ return function(){ return fn.apply(me,arguments); }; };

  jQuery(function() {
    return new ImageCropper();
  });

  ImageCropper = (function() {
    function ImageCropper() {
      this.updatePreview = bind(this.updatePreview, this);
      this.update = bind(this.update, this);
      $('#cropbox').Jcrop({
        aspectRatio: 1,
        setSelect: [0, 0, 600, 600],
        onSelect: this.update,
        onChange: this.update
      });
    }

    ImageCropper.prototype.update = function(coords) {
      $('#customer_crop_x').val(coords.x);
      $('#customer_crop_y').val(coords.y);
      $('#customer_crop_w').val(coords.w);
      $('#customer_crop_h').val(coords.h);
      return this.updatePreview(coords);
    };

    ImageCropper.prototype.updatePreview = function(coords) {
      return $('#preview').css({
        width: Math.round(100 / coords.w * $('#cropbox').width()) + 'px',
        height: Math.round(100 / coords.h * $('#cropbox').height()) + 'px',
        marginLeft: '-' + Math.round(100 / coords.w * coords.x) + 'px',
        marginTop: '-' + Math.round(100 / coords.h * coords.y) + 'px'
      });
    };

     return ImageCropper;

  })();


  // EDIT IN PLACE
  $('.edit-button').click(function () {
    var height = $(this).siblings('p').css('height');
    $(this).siblings('input, p, textarea, button').toggleClass('hidden');
    $(this).siblings('input, textarea').val($(this).siblings('p').html());
    $(this).siblings('input, textarea').css('height', height);
    var _this = $(this)
    $($(this).siblings('button')[0]).click(function (e) {
      e.preventDefault();
      var newValue = $('#biography').val();
      $.ajax({
        type: 'patch',
        url: window.location.pathname,
        data: {
          customer: {
            profile_attributes: {
              biography: newValue
            }
          }
        }
      }).done(function (data) {
        _this.siblings('p').html(newValue);
        _this.siblings('input, p, textarea, button').toggleClass('hidden');
      });
    });
  });

});
