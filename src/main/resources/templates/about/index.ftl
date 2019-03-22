 <#include "../public/main.ftl">
 <@layout>
     <div class="to_login">
         <input type="button" id="about_to_login" value="登录" class="btn">
         <input type="button" id="about_to_regis" value="注册" class="btn">
         <input type="button" id="about_to_admin" value="后台管理" class="btn">
     </div>

     <script>
         $(document).ready(function() {
             $("#about_to_regis").click(function() {
                 window.location.href="${base}/blog/regis/index";
             });

             $("#about_to_login").click(function() {
                 window.location.href="${base}/blog/login/index";
             });

             $("#about_to_admin").click(function() {
                 window.location.href="${base}/blog/admin/index"
             });
         });
     </script>

 </@layout>