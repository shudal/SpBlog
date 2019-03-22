<#include "../public/main.ftl">
<@layout>
    <div style="padding: 100px 100px 10px;">

        <div class="form-group input-group-sm">
            <label for="username">用户名:</label>
            <input type="text" class="form-control" id="username" placeholder="输入用户名, 至少六位， 不含空格">
        </div>

        <div class="form-group input-group-sm">
            <label for="pwd" >密码</label>
            <input type="password" class="form-control" id="pwd" placeholder="输入密码， 至少六位， 不含空格">
        </div>

        <button  id="regis_submit" class="btn btn-primary">提交</button>

        <div id="dialog_inform">
            <p id="dialog_inform_text"></p>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $('#dialog_inform').dialog({
                autoOpen: false,
                width: 400,
                title: "提示",
                position: "center"
            });

            $('#main_page').click(function() {
                $('#dialog_inform').dialog("close");
            });

            $('#regis_submit').click(function () {
                console.log("clicked");
                try {
                    var username = $('#username').val();
                    var password = $('#pwd').val();

                    if (username == "" || password == "") {
                        $('#dialog_inform_text').text("用户名或密码不能为空");
                        $('#dialog_inform').dialog("open");
                    } else if (username.length < 6 || password.length < 6) {
                        $('#dialog_inform_text').text("用户名或密码过短");
                        $('#dialog_inform').dialog("open");
                    } else if (!(username.indexOf(" ") == -1 && password.indexOf(" ") == -1)) {
                        $('#dialog_inform_text').text("用户名或密码非法");
                        $('#dialog_inform').dialog("open");
                    } else {
                        var data = {
                            username: username,
                            password: password,
                        };
                        $.post("${base}/blog/login", data,
                            function (data, status) {
                                console.log(data);
                                if (data['code'] == -1) {
                                    if (data['msg'] == "username_not_exist") {
                                        $('#dialog_inform_text').text("用户名不存在");
                                    } else if(data['msg'] == "password_wrong") {
                                        $('#dialog_inform_text').text("密码错误");
                                    }else if (data['msg'] == 'login_already') {
                                        $("#dialog_inform_text").text("已经登录");
                                    }else {
                                        $('#dialog_inform_text').text("出现未知错误");
                                    }
                                } else {
                                    $('#dialog_inform_text').text("登录成功");
                                }
                                $('#dialog_inform').dialog("open");
                            }
                        );
                    }
                } catch (e) {
                    console.log(e.message);
                }
            });
        });
    </script>
</@layout>