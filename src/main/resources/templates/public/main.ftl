<#macro layout>
<#assign base=ctx.contextPath />
    <!DOCTYPE html>
    <html>
        <head lang="en">
            <meta charset="UTF-8">
            <title>
                ${title}
            </title>
        </head>
        <body>
            <script src="${base}/js/jquery.js"></script>
            <link href="${base}/jquery-ui/jquery-ui.min.css" rel="stylesheet">
            <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
            <script src="${base}/jquery-ui/jquery-ui.min.js"></script>
            <script src="${base}/js/vue.js"></script>
         <div class="header_menu">
            <nav class="navbar navbar-default" role="navigation">
                <div class="container-fluid">
                      <div class="navbar-header">
                      <a class="navbar-brand" href="#">博客</a>
                      </div>
                      <div>
                      <ul class="nav navbar-nav">
                           <li><a href="${base}/">首页</a></li>
                            <li ><a href="${base}/blog/comp">计科</a></li>
                           <li><a href="${base}/blog/play">玩耍</a></li>
                         <li><a href="${base}/blog/about/index">关于</a></li>
                      </ul>
                      </div>
                </div>
            </nav>

         <div class="main_page">
            <#nested/>
            </div>

            <div class="main_footer">
            </div>
        </body>
    </html>
</#macro>