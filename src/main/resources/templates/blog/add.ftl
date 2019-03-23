<#assign base=ctx.contextPath />
<div class="blog_add_page">
    <div style="padding:100px 100px 10px">
            <div class="input-group">
                <input id="blog_add_title" type="text" class="form-control" placeholder="标题">
            </div>

            <div class="form-group">
                <textarea id="blog_add_content" class="form-control" row="3" placeholder="内容"></textarea>
            </div>

            <button id="blog_add_submit" class="btn btn-primary">发表</button>
    </div>
</div>

<script>
    $(document).ready(function () {
        $("#blog_add_submit").click(function() {
            console.log("clicked");
            var title =  $("#blog_add_title").val();
            var content = $("#blog_add_content").val();

            if (title=="" || content=="") {
                $("#dialog_inform_text").text("标题或内容不能为空");
                $("#dialog_inform").dialog("open");
            } else {
                var data = {
                  title : title,
                  content : content
                };

                $.post("${base}/blog/add", data, function(data, status) {
                    console.log(data);
                    if (data['code']== -1) {
                        if (data['msg'] == "can_not_null") {
                            $("#dialog_inform_text").text("标题或内容不能为空");
                        } else {
                            $("#dialog_inform_text").text("新增失败");
                        }

                    } else if (data['code']==1) {
                        $("#dialog_inform_text").text("新增成功");
                        $("#blog_add_title").val("");
                        $("#blog_add_content").val("");
                    } else {
                        $("#dialog_inform_text").text("新增失败， 出现未知错误");
                    }

                    $("#dialog_inform").dialog("open");
                });
            }
        })
        });
</script>