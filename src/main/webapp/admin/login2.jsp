<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>小新电商后台管理系统</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!--图标-->
    <link rel="stylesheet" type="text/css" href="css2/font-awesome.min.css">

    <!--布局框架-->
    <link rel="stylesheet" type="text/css" href="css2/util.css">

    <!--主要样式-->
    <link rel="stylesheet" type="text/css" href="css2/main.css">
    <script src="https://ssl.captcha.qq.com/TCaptcha.js"></script>
    <script src="js/jquery.min.js"></script>
    <script>

        var check =false;
        window.callback = function(res){
            console.log(res)
            // res（用户主动关闭验证码）= {ret: 2, ticket: null}
            // res（验证成功） = {ret: 0, ticket: "String", randstr: "String"}
            if(res.ret === 0){

                $.ajax({
                    type:"post",
                    url:"CodeServlet",
                    data:"ticket="+res.ticket+"&randstr="+res.randstr,
                    success:function (message) {
                        if (message.trim()=="ok"){
                            check =true;
                        }else{
                           $("#msg").html("验证失败");
                        }

                    }
                });



            }
        }
        function loginSubmit() {
            $("#msg").html("");
            if (check){
                $("#form").submit();

            }else{
                $("#msg").html("请进行验证");
            }
        }

    </script>
    <style>
        .example { padding: 20px; border: 1px solid #ccc; margin: 10px -20px 20px; }
    </style>
</head>

<body>

<div class="login">
    <div class="container-login100">
        <div class="wrap-login100">
            <div class="login100-pic js-tilt" data-tilt>
                <img src="img2/img-01.png" alt="IMG">
            </div>

            <form action="AdminServlet?method=login&index=2" method="post" class="login100-form validate-form" id="form">
				<span class="login100-form-title">
					管理员登陆
				</span>

                <div class="wrap-input100 validate-input">
                    <input class="input100" type="text" name="aname" placeholder="用户名">
                    <span class="focus-input100"></span>
                    <span class="symbol-input100">
						<i class="fa fa-envelope" aria-hidden="true"></i>
					</span>
                </div>

                <div class="wrap-input100 validate-input">
                    <input class="input100" type="password" name="apwd" placeholder="密码">

                    <span class="focus-input100"></span>
                    <span class="symbol-input100">
						<i class="fa fa-lock" aria-hidden="true"></i>
					</span>

                </div>
                <div class="wrap-input100 validate-input">
                    <span   id="TencentCaptcha" data-appid="2027858143" data-cbfn="callback"class="login100-form-btn">点我验证</span>
                </div>${msg}
                <span id="msg"></span>



                <div class="container-login100-form-btn">
                    <button class="login100-form-btn" onclick="loginSubmit()" type="button" >登陆</button>


                </div>


            </form>
        </div>
    </div>
</div>

</body>
</html>