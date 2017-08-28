<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getScheme() + "://" + request.getServerName()
            + ":" + request.getServerPort() + request.getContextPath()
            + "/";
    session.setAttribute("path", path);
%>
<html>
<head>
    <title>商品支付</title>
    <script type="text/javascript" src="${path}js/jquery-1.7.2.min.js"></script>
    <link href="${path}pay_files/pay.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="wrap_header">
    <div class="header clearfix">
        <div class="logo_panel clearfix">
            <div class="logo fl"><img src="${path}pay_files/logo.png" alt="logo"></div>
            <div class="lg_txt">| 商城体验平台</div>
        </div>
        <div class="fr tip_panel">
            <div class="txt">欢迎使用商城体验平台</div>
        </div>
    </div>
</div>

<div class="cashier_desk pay_ment">
    <h2>商户支付结果页</h2>
    <p>返回结果数据：<br>${data}</p>
</div>

</body>

</html>
