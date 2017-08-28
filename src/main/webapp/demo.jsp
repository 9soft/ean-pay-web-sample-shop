<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% session.setAttribute("path", request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath()); %>
<html>
<head>
    <title>商品支付</title>
    <script type="text/javascript" src="${path}/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${path}/js/cbpFWTabs.js"></script>
    <link rel="stylesheet" type="text/css" href="${path}/css/tab_demo.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/css/tab_component.css"/>
    <link href="${path}/pay_files/pay.css" rel="stylesheet" type="text/css">
    <style>
        .mediabox {
            float: left;
            width: 600px;
            padding: 0 25px;
        }

        .mediabox input {
            width: 300px;
            height: 32px;
            margin-bottom: 5px;
        }

        .queryFrom input{
            width: 300px;
            margin-top: 10px;
            margin-right: 15px;
            height: 32px;
        }
    </style>
</head>
<body>
<div class="wrap_header">
    <div class="header clearfix">
        <div class="logo_panel clearfix">
            <div class="logo fl"><img src="${path}/pay_files/logo.png" alt="logo"></div>
            <div class="lg_txt">| 商城体验平台</div>
        </div>
        <div class="fr tip_panel">
            <div class="txt">欢迎使用聚合支付付款</div>
            <a href="">常见问题</a>
        </div>
    </div>
</div>

<div class="cashier_desk pay_ment">


    <div id="tabs" class="tabs">
        <nav>
            <ul>
                <li><a href="#section-1"><span>退款demo</span></a></li>
                <li><a href="#section-2"><span>订单查询demo</span></a></li>
                <li><a href="#section-3"><span>企业付款demo</span></a></li>
            </ul>
        </nav>
        <div class="content">
            <section id="section-1">
                <div class="mediabox">
                    <form action="${path}/demo/refund" method="post">
                        <p><span> APP_ID&nbsp;&nbsp;：</span><input type="text" name="app_id" value="ee6071d6b9a74e7fb6d5f2492e9e722b"/></p>
                        <p><span>订单编号：</span><input type="text" name="charge_id" value=""/></p>
                        <p><span>退款金额：</span><input type="text" name="amount" value="800"></p>
                        <p><span>退款附加：</span><input type="text" name="extra" value=""></p>
                        <p><span>退款附加：</span><input type="text" name="metadata" value="退款描述"/></p>
                        <p><span>退款备注：</span><input type="text" name="remark" value="退款备注信息"/></p>
                        <p class="pay_btn">
                            <input type="submit" value="快点我"/>
                        </p>
                    </form>
                </div>
            </section>
            <section id="section-2">
                <div class="queryFrom">
                    <form action="${path}/demo/refund" method="post">
                        <span> APP_ID&nbsp;&nbsp;：</span><input type="text" name="app_id" value="ee6071d6b9a74e7fb6d5f2492e9e722b"/>
                        <span>订单编号：</span><input type="text" name="charge_id" value=""/>
                        <span class="pay_btn"> <input type="submit" value="快点我"/> </span>
                    </form>
                </div>
            </section>
            <section id="section-3">
            </section>
        </div><!-- /content -->
    </div><!-- /tabs -->
</div>

</body>
<script>
    new CBPFWTabs(document.getElementById('tabs'));
</script>
</html>
