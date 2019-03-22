<#assign base=ctx.contextPath />
<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>管理 </title>
    <link rel="stylesheet" type="text/css" href="${base}/css/default.css">

    <link href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" rel="stylesheet">
    <link href="${base}/css/app.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="contentWrapper">

    <div id="contentLeft">

        <ul id="leftNavigation">

            <li class="active">
                <a href="#"><i class="fa fa-coffee leftNavIcon"></i> 仪表盘 </a>
                <ul>
                    <li>
                        <a href="#"><i class="fa fa-angle-right leftNavIcon"></i> 统计信息 </a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-angle-right leftNavIcon"></i> 站点信息 </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#"><i class="fa fa-flask leftNavIcon"></i> 文章管理 </a>
                <ul>
                    <li>
                        <a href="#" id="admin_index_add"><i class="fa fa-angle-right leftNavIcon"></i>  新增 </a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-angle-right leftNavIcon"></i>  所有 </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#"><i class="fa fa-flask leftNavIcon"></i> 用户管理 </a>
                <ul>
                    <li>
                        <a href="#"><i class="fa fa-angle-right leftNavIcon"></i> 所有用户 </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#"><i class="fa fa-truck leftNavIcon"></i> 分类管理</a>
                <ul>
                    <li>
                        <a href="#"><i class="fa fa-angle-right leftNavIcon"></i> 新增分类 </a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-angle-right leftNavIcon"></i> 所有分类 </a>
                    </li>
                </ul>
            </li>
            <!---注释掉
            <li class="clickable">
                <a href="#"><i class="fa fa-envelope-o leftNavIcon"></i> 说明 </a>
            </li>
            注释掉--->

        </ul>

    </div>

    <div id="contentRight">
        this is admin page
    </div>

</div>

<script src="${base}/js/jquery.js"></script>
<script src="${base}/js/jquery.ssd-vertical-navigation.min.js"></script>
<script src="${base}/js/app.js"></script>
<script>
    $("#admin_index_add").click(function() {
        $('#contentRight').load("${base}/blog/add");
    });
</script>
</body>
</html>