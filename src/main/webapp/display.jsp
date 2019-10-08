<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/9/23
  Time: 18:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<html>
<head>
    <title>级联菜单哈哈</title>
    <script src="js/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
             $.ajax({
                 type:"post",
                 url:"AddrServlet?method=findAllProvince",
                 dataType:"json",
                 success:function (provinces) {
                      for (i =0; i<provinces.length;i++) {
                          var  p = provinces[i];
                          $("<option value='"+p.provinceId+"'>"+p.name+"</option>").appendTo("#province");
                      }

                 }
             });
            $("#province").change(function () {
                $.ajax({
                    type:"post",
                    url:"AddrServlet?method=findByProvince",
                    data:"provinceId="+$("#province").val(),
                    dataType:"json",
                    success:function (cities) {
                        $("#city").html("");
                        $("#country").html(""); 
                        $("<option value='-1' selected hidden></option>").appendTo("#city");
                        for (i =0; i<cities.length;i++) {
                            var  city = cities[i];
                            $("<option value='"+city.cityId+"'>"+city.name+"</option>").appendTo("#city");
                        }

                    }
                });
            });
            $("#city").change(function () {

                $.ajax({
                    type:"post",
                    url:"AddrServlet?method=findByCity",
                    data:"cityId="+$("#city").val(),
                    dataType:"json",
                    success:function (countries) {
                        $("#country").html("");
                        for (i =0; i<countries.length;i++) {
                            var  country = countries[i];
                            $("<option value='"+country.countryId+"'>"+country.name+"</option>").appendTo("#country");
                        }

                    }
                });
            });

        })
    </script>
    <style>
        .select{
            width: 200px;
        }
    </style>
</head>
<body>
   <select class="select" id="province" name="province">
       <option value="-1">----省----</option>
   </select>
   <select class="select" id="city" name="city">
       <option value="-1">----市----</option>
   </select>
   <select class="select" id="country" name="city">
       <option value="-1">----区----</option>
   </select>
</body>
</html>
