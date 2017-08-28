package com.ean.utils;

import java.io.IOException;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 功能说明:支付属性配置工具类
 */
public class PayConfigUtil {
	private static final Logger log = LoggerFactory.getLogger(PayConfigUtil.class);
	private static Properties properties = new Properties();

	private PayConfigUtil() {
	}

	static {
		try {
			properties.load(PayConfigUtil.class.getClassLoader().getResourceAsStream("pay_config.properties"));
		} catch (IOException e) {
            log.error(e.getLocalizedMessage());
		}
	}

	public static String readConfig(String key) {
		return (String) properties.get(key);
	}
}
