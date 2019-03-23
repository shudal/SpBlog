<#assign base=ctx.contextPath />
<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>管理 </title>

</head>

<script src="${base}/js/jquery.js"></script>
<link href="${base}/jquery-ui/jquery-ui.min.css" rel="stylesheet">
<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="${base}/jquery-ui/jquery-ui.min.js"></script>
<script src="${base}/js/vue.js"></script>

<body>
<div id="dialog_inform">
    <p id="dialog_inform_text"></p>
</div>
<div id="contentWrapper">
    <div class="container">
        <div class="row">
            <div class="span6">
                <ui class="nav nav-tabs">
                    <li id="admin_index_index" ><a href="javascript:void(0)">管理首页</a></li>
                    <li id="admin_index_blog" class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0)">文章管理</a>
                        <ul class="dropdown-menu">
                            <li><a id="admin_index_blog_add" href="javascript:void(0)">发表文章</a></li>
                            <li><a href="javascript:void(0)">所有文章</a></li>
                        </ul>
                    </li>
                </ui>
            </div>
        </div>
    </div>
    <div id="contentRight">
        this is admin page
    </div>

</div>
<script>
    $(document).ready(function() {
        $("#admin_index_blog_add").click(function() {
            $.get("${base}/blog/add/index", function(result) {
                $("#contentRight").html(result);
            })
        });

        $('#dialog_inform').dialog({
            autoOpen: false,
            width: 400,
            title: "提示",
            position: "center"
        });

        $('#main_page').click(function() {
            $('#dialog_inform').dialog("close");
        });
    });
</script>
</body>
</html>