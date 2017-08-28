package com.ean.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ean.pay.client.svr.entity.Charge;
import com.ean.pay.client.svr.utils.DateUtils;
import com.ean.pay.client.svr.utils.HttpClientUtil;
import com.ean.pay.client.svr.utils.MerchantApiUtil;
import com.ean.utils.IdWorker;
import com.ean.utils.PayConfigUtil;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.net.InetAddress;
import java.net.URLDecoder;
import java.net.UnknownHostException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 功能说明:聚合支付控制类
 * User: 402536196@qq.com
 * Time: 2017-05-27 15:26
 */
@Controller
@RequestMapping(value = "/payment")
public class PaymentController {
	private static final Logger log = LoggerFactory.getLogger(PaymentController.class);
	public static String CREATE_PAY_URL = PayConfigUtil.readConfig("payUrl") + "/charge/create_pay";
	public static String CREATE_REFUND_URL = PayConfigUtil.readConfig("payUrl") + "/refund/create_refund";

	private IdWorker idWorker = new IdWorker(1);

	/**
	 * 用户-->商户网页-->商户后台-->商户网页-->平台后台-->平台网页-->三方支付网关页面
	 * @param model
	 * @return
	 */
	@RequestMapping("/gateway")
	public String demoPay(HttpServletRequest request, Model model) {
		String buildRequest = MerchantApiUtil.buildRequest(getParaMap(request), "get", "确定", PayConfigUtil.readConfig("gateWayUrl"));
		model.addAttribute("payMessage", buildRequest);
		return "toPay";
	}

	/**
	 * 用户-->商户网页-->商户后台-->平台后台-->商户后台-->商户网页-->三方支付网关页面
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/api")
	public String apiPay(HttpServletRequest request, Model model) throws Exception {
		Map<String, Object> paramMap = getParaMap(request);
		String jsonStr = HttpClientUtil.sendPostRequest(CREATE_PAY_URL, paramMap);
		Charge charge = JSONObject.parseObject(jsonStr, Charge.class);
		model.addAttribute("payMessage", charge.getCredential());
		return "toPay";
	}

	@RequestMapping("/api_payment")
	@CrossOrigin(origins = "*", maxAge = 3600)
	@ResponseBody
	public JSONObject api_payment(HttpServletRequest request) throws Exception {
		Map<String, Object> paramMap = getParaMap(request);
		String jsonStr = HttpClientUtil.sendPostRequest(CREATE_PAY_URL, paramMap);
		return JSON.parseObject(jsonStr);
	}

	/**
	 * 退款
	 * @param request
	 * @return
	 */
	@RequestMapping("/refund")
	@ResponseBody
	public JSONObject refund(HttpServletRequest request) {
		String app_id = getString_UrlDecode_UTF8(request, "app_id");
		String charge_id = getString_UrlDecode_UTF8(request, "charge_id");
		String amount = getString_UrlDecode_UTF8(request, "amount");
		String extra = getString_UrlDecode_UTF8(request, "extra");
		String metadata = getString_UrlDecode_UTF8(request, "metadata");
		String remark = getString_UrlDecode_UTF8(request, "metadata");
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("timestamp", new Date().getTime());
		paramMap.put("sign_type", "MD5");
		paramMap.put("charset", "UTF-8");
		paramMap.put("app_id", app_id);
		paramMap.put("charge_id", charge_id);
		//		paramMap.put("extra", null);
		//		paramMap.put("metadata", null);
		paramMap.put("amount", amount);
		paramMap.put("remark", remark);
		String sign_info = MerchantApiUtil.getSign(paramMap, PayConfigUtil.readConfig("md5Key"));
		paramMap.put("sign_info", sign_info);
		String jsonStr = HttpClientUtil.sendPostRequest(CREATE_REFUND_URL, paramMap);
		return JSON.parseObject(jsonStr);
	}

	private Map<String, Object> getParaMap(HttpServletRequest request) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
//		String orderNo = String.valueOf(System.currentTimeMillis()); // 订单编号
        String orderNo = idWorker.nextId()+"";
		paramMap.put("order_no", orderNo);

		String amount = getString_UrlDecode_UTF8(request, "amount"); // 订单金额 , 单位:元
		paramMap.put("amount", amount);

		String subject = getString_UrlDecode_UTF8(request, "subject"); // 商品名称
		paramMap.put("subject", subject);

		String body = getString_UrlDecode_UTF8(request, "body"); // 商品描述
		paramMap.put("body", body);

		String channel = getString_UrlDecode_UTF8(request, "channel"); // 支付方式编码 支付宝: ALIPAY  微信:WEIXIN
		paramMap.put("channel", channel);

		paramMap.put("app_id", PayConfigUtil.readConfig("appId"));

		String client_ip = this.getIpAddr(request);//用户IP
		paramMap.put("client_ip", client_ip);

		String orderPeriod = PayConfigUtil.readConfig("orderPeriod"); // 订单失效时间
		paramMap.put("time_expire", DateUtils.addMinute(new Date(), Integer.valueOf(orderPeriod)).getTime());

		Map<String, String> extra = new HashMap<>();
		String returnUrl = PayConfigUtil.readConfig("returnUrl"); // 页面通知返回url
		String notifyUrl = PayConfigUtil.readConfig("notifyUrl"); // 后台消息通知Url
		extra.put("result_url", returnUrl);
		extra.put("notify_url", notifyUrl);
		extra.put("payType", getString_UrlDecode_UTF8(request, "payType"));
		extra.put("issuerId", getString_UrlDecode_UTF8(request, "issuerId"));
		extra.put("orderDatetime", String.valueOf(new Date().getTime()));
		extra.put("sub_channel", getString_UrlDecode_UTF8(request, "sub_channel"));
		paramMap.put("extra", extra);

		String remark = getString_UrlDecode_UTF8(request, "remark"); // 支付备注
		paramMap.put("remark", remark);

		paramMap.put("currency", "cny");
		paramMap.put("timestamp", new Date().getTime());
		paramMap.put("sign_type", "MD5");
		paramMap.put("charset", "UTF-8");

		////////////扩展字段,选填,原值返回///////////
		//		paramMap.put("metadata", new HashMap());

		/////签名及生成请求API的方法///
		String sign_info = MerchantApiUtil.getSign(paramMap, PayConfigUtil.readConfig("md5Key"));
		paramMap.put("sign_info", sign_info);
		return paramMap;
	}

	public String getString_UrlDecode_UTF8(HttpServletRequest request, String key) {
		String resultStr = request.getParameter(key);
		if (StringUtils.isBlank(resultStr) || "undefined".equals(resultStr)) {
			return "";
		}
		try {
			return URLDecoder.decode(resultStr, "UTF-8");
		} catch (Exception e) {
			return "";
		}
	}

	/**
	 * 获取客户端的IP地址
	 * @return
	 */
	public String getIpAddr(HttpServletRequest request) {
		String ipAddress = null;
		ipAddress = request.getHeader("x-forwarded-for");
		if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = request.getHeader("Proxy-Client-IP");
		}
		if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = request.getRemoteAddr();
			if (ipAddress.equals("127.0.0.1") || ipAddress.equals("0:0:0:0:0:0:0:1")) {
				// 根据网卡取本机配置的IP
				InetAddress inet = null;
				try {
					inet = InetAddress.getLocalHost();
				} catch (UnknownHostException e) {
					log.error("未知主机", e);
				}
				if (inet != null) {
					ipAddress = inet.getHostAddress();
				}
			}
		}
		// 对于通过多个代理的情况，第一个IP为客户端真实IP,多个IP按照','分割
		if (ipAddress != null && ipAddress.length() > 15 && ipAddress.indexOf(",") > 0) {
			ipAddress = ipAddress.substring(0, ipAddress.indexOf(","));
		}
		return ipAddress;
	}
}
