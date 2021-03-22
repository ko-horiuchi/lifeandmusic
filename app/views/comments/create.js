// $('#comments_area').html("<%= j(render 'comments/index', comments: @comment.music.comments) %>")
$("#comments_area").html("<%= j(render 'comments/index', locals: { comments: @comment.music.comments }) %> ");
$("textarea").val('');