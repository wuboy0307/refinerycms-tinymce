Deface::Override.new(:virtual_path => %q{refinery/admin/pages/_page_part_field},
                     :name => %q{add_wysiwyg_editor},
                     :replace => %q{erb[loud]:contains('text_area_tag "page[parts_attributes][#{part_index}][body]"')},
                     :text => %q{
<div class="clearfix wysiwyg-editor-wrapper">
    <%= f.text_area :body, rows: 20, cols: 120, class: 'wysiwyg-editor widest' %>
</div>

<script>
    submit_and_continue = function(e, redirect_to) {
        if ($(this).hasClass('wymupdate')) {
            tinymce.triggerSave();
        }

        $('#continue_editing').val(true);
        $('#flash').fadeOut(250);

        $('.fieldWithErrors').removeClass('fieldWithErrors').addClass('field');
        $('#flash_container .errorExplanation').remove();

        $.post(
                $('#continue_editing').get(0).form.action
                , $($('#continue_editing').get(0).form).serialize()
                , function(data) {
                    if (($flash_container = $('#flash_container')).length > 0) {
                        $flash_container.html(data);

                        $('#flash').css({'width': 'auto', 'visibility': null}).fadeIn(550);

                        $('.errorExplanation').not($('#flash_container .errorExplanation')).remove();

                        if ((error_fields = $('#fieldsWithErrors').val()) != null) {
                            $.each(error_fields.split(','), function() {
                                $("#" + this).wrap("<div class='fieldWithErrors' />");
                            });
                        } else if (redirect_to) {
                            window.location = redirect_to;
                        }

                        $('.fieldWithErrors:first :input:first').focus();

                        $('#continue_editing').val(false);

                        init_flash_messages();

                        //updates the form action with new URL
                        $('form').attr('action', $('#new_action').attr('value'));
                    }
                }, 'html'
        );

        e.preventDefault();
    };
</script>
                          })


#news
Deface::Override.new(:virtual_path => %q{refinery/news/admin/items/_form},
                     :name => %q{add_wysiwyg_editor},
                     :replace => %q{erb[loud]:contains('f.text_area :body')},
                     :text => %q{
<div class="clearfix wysiwyg-editor-wrapper">
    <%= f.text_area :body, rows: 20, cols: 120, class: 'wysiwyg-editor widest' %>
</div>

<script>
    submit_and_continue = function(e, redirect_to) {
        if ($(this).hasClass('wymupdate')) {
            tinymce.triggerSave();
        }

        $('#continue_editing').val(true);
        $('#flash').fadeOut(250);

        $('.fieldWithErrors').removeClass('fieldWithErrors').addClass('field');
        $('#flash_container .errorExplanation').remove();

        $.post(
                $('#continue_editing').get(0).form.action
                , $($('#continue_editing').get(0).form).serialize()
                , function(data) {
                    if (($flash_container = $('#flash_container')).length > 0) {
                        $flash_container.html(data);

                        $('#flash').css({'width': 'auto', 'visibility': null}).fadeIn(550);

                        $('.errorExplanation').not($('#flash_container .errorExplanation')).remove();

                        if ((error_fields = $('#fieldsWithErrors').val()) != null) {
                            $.each(error_fields.split(','), function() {
                                $("#" + this).wrap("<div class='fieldWithErrors' />");
                            });
                        } else if (redirect_to) {
                            window.location = redirect_to;
                        }

                        $('.fieldWithErrors:first :input:first').focus();

                        $('#continue_editing').val(false);

                        init_flash_messages();

                        //updates the form action with new URL
                        $('form').attr('action', $('#new_action').attr('value'));
                    }
                }, 'html'
        );

        e.preventDefault();
    };
</script>
                          })