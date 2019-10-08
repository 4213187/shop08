<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" type="text/css" href="css/default.css"/>
    <link rel="stylesheet" type="text/css" href="css/styles1.css"/>
    <!--[if IE]>
    <script src="js/html5shiv.min.js"></script>
    <![endif]-->
</head>
<body>
<article class="htmleaf-container">
    <header class="htmleaf-header">

        <div class="htmleaf-links">

        </div>
    </header>
    <div class="panel-lite">
        <div class="thumbur">
            <div class="icon-lock"></div>
        </div>
        <h4>解锁</h4>

        <div class="form-group">
            <form action="AdminServlet?method=unlock" method="post">

                <input type="text" value="${aname}" name="aname" hidden class="form-control"/>
                <input type="password" class="form-control" name="apwd"/> ${msg}
                <label class="form-label">密　码</label>
                <br>
                <br>
                <br>
                <br>
                <br>
                <button  type="submit" class="floating-btn"><i class="icon-arrow"></i></button>
            </form>
        </div>
    </div>


</article>
<div style="text-align:center;">

</div>
</body>
</html>