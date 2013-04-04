package org.openmrs.module.rwandaprimarycare;

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OperationsController {

	protected static final Log log = LogFactory
			.getLog(MyPropertiesController.class);

	@RequestMapping("/module/rwandaprimarycare/buy")
	public String showBuy(ModelMap model, HttpSession session)
			throws PrimaryCareException {
		return "/module/rwandaprimarycare/buyPage";
	}
	
	@RequestMapping("/module/rwandaprimarycare/sell")
	public String showSell(ModelMap model, HttpSession session)
			throws PrimaryCareException {
		return "/module/rwandaprimarycare/sellPage";
	}
}
