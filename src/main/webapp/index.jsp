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
                <li><a href="#section-1"><span>网关支付</span></a></li>
                <li><a href="#section-2"><span>H5支付</span></a></li>
                <li><a href="#section-3"><span>APP支付</span></a></li>
                <li><a href="#section-4"><span>QR扫码</span></a></li>
                <li><a href="#section-5"><span>微信公众号</span></a></li>
            </ul>
        </nav>
        <div class="content">
            <section id="section-1">
                <%--<div class="mediabox">--%>
                <ul class="payment">
                    <li><img src="${path}/images/nochannelpay.gif" alt="平台网关支付"/>
                        <form action="${path}/payment/gateway" method="post">
                            <input type="hidden" name="subject" value="商品名称"/>
                            <input type="hidden" name="amount" value="8888"/>
                            <input type="hidden" name="currency" value="cny">
                            <input type="hidden" name="body" value="商品信息描述"/>
                            <input type="hidden" name="remark" value="支付备注信息"/>
                            <p class="pay_btn">
                                <input type="submit" value="88.88元支付体验"/>
                            </p>
                        </form>
                    </li>
                    <li><img src="${path}/images/channel/ali.gif" alt="支付宝网关（扫码）支付"/>
                        <form action="${path}/payment/gateway" method="post">
                            <input type="hidden" name="subject" value="商品名称"/>
                            <input type="hidden" name="amount" value="8888"/>
                            <%--ALI_SCAN--%>
                            <input type="hidden" name="channel" value="ALI_WEB">
                            <input type="hidden" name="currency" value="cny">
                            <input type="hidden" name="body" value="商品信息描述"/>
                            <input type="hidden" name="remark" value="支付备注信息"/>
                            <p class="pay_btn">
                                <input type="submit" value="88.88元支付体验"/>
                            </p>
                        </form>
                    </li>
                    <li><img src="${path}/images/channel/allinpay.gif" alt="通联网关支付"/>
                        <form action="${path}/payment/gateway" method="post">
                            <input type="hidden" name="subject" value="通联网关支付产品测试"/>
                            <input type="hidden" name="amount" value="8888"/>
                            <input type="hidden" name="channel" value="ALLIN_WEB">
                            <input type="hidden" name="currency" value="cny">
                            <input type="hidden" name="body" value="通联网关支付产品信息描述"/>
                            <input type="hidden" name="remark" value="通联网关支付备注信息"/>
                            <p class="pay_btn">
                                <input type="submit" value="88.88元支付体验"/>
                            </p>
                        </form>
                    </li>
                    <li><img src="${path}/images/channel/demobank.gif" alt="银行DEMO网关支付"/>
                        <form action="${path}/payment/gateway" method="post">
                            <input type="hidden" name="subject" value="商品名称"/>
                            <input type="hidden" name="amount" value="8888"/>
                            <input type="hidden" name="channel" value="BDEMO_WEB">
                            <input type="hidden" name="currency" value="cny">
                            <input type="hidden" name="body" value="商品信息描述"/>
                            <input type="hidden" name="remark" value="商品备注信息"/>
                            <input type="hidden" name="payType" value="1"/>
                            <input type="hidden" name="issuerId" value="BDEMO"/>
                            <p class="pay_btn">
                                <input type="submit" value="88.88元支付体验"/>
                            </p>
                        </form>
                    </li>
                    <li><img src="${path}/images/channel/cmb.gif" alt="招商银行网关支付"/>
                        <form action="${path}/payment/gateway" method="post">
                            <input type="hidden" name="subject" value="商品名称"/>
                            <input type="hidden" name="amount" value="8888"/>
                            <input type="hidden" name="channel" value="BCMB_WEB">
                            <input type="hidden" name="currency" value="cny">
                            <input type="hidden" name="body" value="商品信息描述"/>
                            <input type="hidden" name="remark" value="商品备注信息"/>
                            <p class="pay_btn">
                                <input type="submit" value="88.88元支付体验"/>
                            </p>
                        </form>
                    </li>
                    <li><img src="${path}/images/channel/icbc.gif" alt="工商银行网关支付"/>
                        <form action="${path}/payment/gateway" method="post">
                            <input type="hidden" name="subject" value="商品名称"/>
                            <input type="hidden" name="amount" value="8888"/>
                            <input type="hidden" name="channel" value="BICBC_WEB">
                            <input type="hidden" name="currency" value="cny">
                            <input type="hidden" name="body" value="商品信息描述"/>
                            <input type="hidden" name="remark" value="商品备注信息"/>
                            <p class="pay_btn">
                                <input type="submit" value="88.88元支付体验"/>
                            </p>
                        </form>
                    </li>
                    <li><img src="${path}/images/channel/ccb.gif" alt="建设银行网关支付"/>
                        <form action="${path}/payment/gateway" method="post">
                            <input type="hidden" name="subject" value="商品名称"/>
                            <input type="hidden" name="amount" value="8888"/>
                            <input type="hidden" name="channel" value="BCCB_WEB">
                            <input type="hidden" name="currency" value="cny">
                            <input type="hidden" name="body" value="商品信息描述"/>
                            <input type="hidden" name="remark" value="商品备注信息"/>
                            <p class="pay_btn">
                                <input type="submit" value="88.88元支付体验"/>
                            </p>
                        </form>
                    </li>
                    <li><img src="${path}/images/channel/abc.gif" alt="农业银行网关支付"/>
                        <form action="${path}/payment/gateway" method="post">
                            <input type="hidden" name="subject" value="商品名称"/>
                            <input type="hidden" name="amount" value="8888"/>
                            <input type="hidden" name="channel" value="BABC_WEB">
                            <input type="hidden" name="currency" value="cny">
                            <input type="hidden" name="body" value="商品信息描述"/>
                            <input type="hidden" name="remark" value="商品备注信息"/>
                            <p class="pay_btn">
                                <input type="submit" value="88.88元支付体验"/>
                            </p>
                        </form>
                    </li>
                    <li><img src="${path}/images/channel/cmbc.gif" alt="民生银行网关支付"/>
                        <form action="${path}/payment/gateway" method="post">
                            <input type="hidden" name="subject" value="商品名称"/>
                            <input type="hidden" name="amount" value="8888"/>
                            <input type="hidden" name="channel" value="BCMBC_WEB">
                            <input type="hidden" name="currency" value="cny">
                            <input type="hidden" name="body" value="商品信息描述"/>
                            <input type="hidden" name="remark" value="商品备注信息"/>
                            <p class="pay_btn">
                                <input type="submit" value="88.88元支付体验"/>
                            </p>
                        </form>
                    </li>
                    <li><img src="${path}/images/channel/spdb.gif" alt="浦发银行网关支付"/>
                        <form action="${path}/payment/gateway" method="post">
                            <input type="hidden" name="subject" value="商品名称"/>
                            <input type="hidden" name="amount" value="8888"/>
                            <input type="hidden" name="channel" value="BSPDB_WEB">
                            <input type="hidden" name="currency" value="cny">
                            <input type="hidden" name="body" value="商品信息描述"/>
                            <input type="hidden" name="remark" value="商品备注信息"/>
                            <p class="pay_btn">
                                <input type="submit" value="88.88元支付体验"/>
                            </p>
                        </form>
                    </li>
                    <li><img src="${path}/images/channel/hxb.gif" alt="华夏银行网关支付"/>
                        <form action="${path}/payment/gateway" method="post">
                            <input type="hidden" name="subject" value="商品名称"/>
                            <input type="hidden" name="amount" value="8888"/>
                            <input type="hidden" name="channel" value="BHXB_WEB">
                            <input type="hidden" name="currency" value="cny">
                            <input type="hidden" name="body" value="商品信息描述"/>
                            <input type="hidden" name="remark" value="商品备注信息"/>
                            <p class="pay_btn">
                                <input type="submit" value="88.88元支付体验"/>
                            </p>
                        </form>
                    </li>
                    <li><img src="${path}/images/channel/cgb.gif" alt="广发银行网关支付"/>
                        <form action="${path}/payment/gateway" method="post">
                            <input type="hidden" name="subject" value="商品名称"/>
                            <input type="hidden" name="amount" value="8888"/>
                            <input type="hidden" name="channel" value="BCGB_WEB">
                            <input type="hidden" name="currency" value="cny">
                            <input type="hidden" name="body" value="商品信息描述"/>
                            <input type="hidden" name="remark" value="商品备注信息"/>
                            <p class="pay_btn">
                                <input type="submit" value="88.88元支付体验"/>
                            </p>
                        </form>
                    </li>
                    <li><img src="${path}/images/channel/cib.gif" alt="兴业银行网关支付"/>
                        <form action="${path}/payment/gateway" method="post">
                            <input type="hidden" name="subject" value="商品名称"/>
                            <input type="hidden" name="amount" value="8888"/>
                            <input type="hidden" name="channel" value="BCIB_WEB">
                            <input type="hidden" name="currency" value="cny">
                            <input type="hidden" name="body" value="商品信息描述"/>
                            <input type="hidden" name="remark" value="商品备注信息"/>
                            <p class="pay_btn">
                                <input type="submit" value="88.88元支付体验"/>
                            </p>
                        </form>
                    </li>
                    <li><img src="${path}/images/channel/ceb.gif" alt="光大银行网关支付"/>
                        <form action="${path}/payment/gateway" method="post">
                            <input type="hidden" name="subject" value="商品名称"/>
                            <input type="hidden" name="amount" value="8888"/>
                            <input type="hidden" name="channel" value="BCEB_WEB">
                            <input type="hidden" name="currency" value="cny">
                            <input type="hidden" name="body" value="商品信息描述"/>
                            <input type="hidden" name="remark" value="商品备注信息"/>
                            <p class="pay_btn">
                                <input type="submit" value="88.88元支付体验"/>
                            </p>
                        </form>
                    </li>
                    <li><img src="${path}/images/channel/comm.gif" alt="交通银行网关支付"/>
                        <form action="${path}/payment/gateway" method="post">
                            <input type="hidden" name="subject" value="商品名称"/>
                            <input type="hidden" name="amount" value="8888"/>
                            <input type="hidden" name="channel" value="BCOMM_WEB">
                            <input type="hidden" name="currency" value="cny">
                            <input type="hidden" name="body" value="商品信息描述"/>
                            <input type="hidden" name="remark" value="商品备注信息"/>
                            <p class="pay_btn">
                                <input type="submit" value="88.88元支付体验"/>
                            </p>
                        </form>
                    </li>
                    <li><img src="${path}/images/channel/boc.gif" alt="中国银行网关支付"/>
                        <form action="${path}/payment/gateway" method="post">
                            <input type="hidden" name="subject" value="商品名称"/>
                            <input type="hidden" name="amount" value="8888"/>
                            <input type="hidden" name="channel" value="BBOC_WEB">
                            <input type="hidden" name="currency" value="cny">
                            <input type="hidden" name="body" value="商品信息描述"/>
                            <input type="hidden" name="remark" value="商品备注信息"/>
                            <p class="pay_btn">
                                <input type="submit" value="88.88元支付体验"/>
                            </p>
                        </form>
                    </li>
                    <li><img src="${path}/images/channel/citic.gif" alt="中信银行网关支付"/>
                        <form action="${path}/payment/gateway" method="post">
                            <input type="hidden" name="subject" value="商品名称"/>
                            <input type="hidden" name="amount" value="8888"/>
                            <input type="hidden" name="channel" value="BCITIC_WEB">
                            <input type="hidden" name="currency" value="cny">
                            <input type="hidden" name="body" value="商品信息描述"/>
                            <input type="hidden" name="remark" value="商品备注信息"/>
                            <p class="pay_btn">
                                <input type="submit" value="88.88元支付体验"/>
                            </p>
                        </form>
                    </li>
                    <li><img src="${path}/images/channel/bos.gif" alt="上海银行网关支付"/>
                        <form action="${path}/payment/gateway" method="post">
                            <input type="hidden" name="subject" value="商品名称"/>
                            <input type="hidden" name="amount" value="8888"/>
                            <input type="hidden" name="channel" value="BBOS_WEB">
                            <input type="hidden" name="currency" value="cny">
                            <input type="hidden" name="body" value="商品信息描述"/>
                            <input type="hidden" name="remark" value="商品备注信息"/>
                            <p class="pay_btn">
                                <input type="submit" value="88.88元支付体验"/>
                            </p>
                        </form>
                    </li>
                    <li><img src="${path}/images/channel/pingan.gif" alt="平安银行网关支付"/>
                        <form action="${path}/payment/gateway" method="post">
                            <input type="hidden" name="subject" value="商品名称"/>
                            <input type="hidden" name="amount" value="8888"/>
                            <input type="hidden" name="channel" value="BPAB_WEB">
                            <input type="hidden" name="currency" value="cny">
                            <input type="hidden" name="body" value="商品信息描述"/>
                            <input type="hidden" name="remark" value="商品备注信息"/>
                            <p class="pay_btn">
                                <input type="submit" value="88.88元支付体验"/>
                            </p>
                        </form>
                    </li>
                    <li><img src="${path}/images/channel/psbc.gif" alt="邮政银行网关支付"/>
                        <form action="${path}/payment/gateway" method="post">
                            <input type="hidden" name="subject" value="商品名称"/>
                            <input type="hidden" name="amount" value="8888"/>
                            <input type="hidden" name="channel" value="BPSBC_WEB">
                            <input type="hidden" name="currency" value="cny">
                            <input type="hidden" name="body" value="商品信息描述"/>
                            <input type="hidden" name="remark" value="商品备注信息"/>
                            <p class="pay_btn">
                                <input type="submit" value="88.88元支付体验"/>
                            </p>
                        </form>
                    </li>
                </ul>
            </section>
            <section id="section-2">
                <ul class="payment">
                    <li><img src="${path}/images/channel/ali.gif" alt="支付宝H5支付"/>
                        <form action="${path}/payment/api_payment" method="post">
                            <input type="hidden" name="subject" value="商品名称"/>
                            <input type="hidden" name="amount" value="8888"/>
                            <%--ALI_WAP--%>
                            <input type="hidden" name="channel" value="WX_APP">
                            <input type="hidden" name="currency" value="cny">
                            <input type="hidden" name="body" value="商品信息描述"/>
                            <input type="hidden" name="remark" value="支付备注信息"/>
                            <p class="pay_btn">
                                <input type="submit" value="88.88元支付体验"/>
                            </p>
                        </form>
                    </li>
                </ul>
            </section>
            <section id="section-3">
                <div style="text-align: center">
                    <h1>敬请期待</h1>
                </div>
<%--                <div class="mediabox">
                    <h3>Leek Wasabi</h3>
                    <p>Sushi gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette tatsoi pea sprouts fava bean collard greens dandelion
                        okra wakame tomato.</p>
                </div>
                <div class="mediabox">
                    <h3>Green Tofu Wrap</h3>
                    <p>Pea horseradish azuki bean lettuce avocado asparagus okra. Kohlrabi radish okra azuki bean corn fava bean mustard tigernut wasabi tofu
                        broccoli mixture soup.</p>
                </div>--%>
            </section>
            <section id="section-4">
                <div style="text-align: center">
                    <h1>敬请期待</h1>
                </div>
            </section>
            <section id="section-5">
                <div style="text-align: center">
                    <h1>敬请期待</h1>
                </div>
            </section>
        </div><!-- /content -->
    </div><!-- /tabs -->
</div>

</body>
<script>
    new CBPFWTabs(document.getElementById('tabs'));
</script>
</html>
