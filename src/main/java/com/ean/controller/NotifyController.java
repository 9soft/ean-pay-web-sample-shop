package com.ean.controller;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

/**
 * Created with IntelliJ IDEA.
 * User: 402536196@qq.com
 * Time: 2017-04-27 16:26
 */
@Controller
@RequestMapping(value = "/message")
public class NotifyController {
	private static final Logger log = LoggerFactory.getLogger(NotifyController.class);

	@RequestMapping("/result")
	public String result(HttpServletRequest request, Model model) {
		model.addAttribute("subject", request.getParameter("subject"));
		model.addAttribute("body", request.getParameter("body"));
		model.addAttribute("amount", request.getParameter("amount"));
		model.addAttribute("data", JSONObject.toJSONString(request.getParameterMap()));
		return "result";
	}

	@RequestMapping("/notify")
	public void notify(HttpServletRequest request, HttpServletResponse response) {
		Map resMap = new HashMap<>();
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String paraName = (String) enu.nextElement();
			resMap.put(paraName, request.getParameter(paraName));
		}
		String res = JSON.toJSONString(resMap);
		log.info("接收到聚合支付平台异步通知信息：" + res);
		//返回信息给平台，告知平台已经接收到通知
		try {
			response.getWriter().print("success");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
