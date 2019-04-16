package global.sesoc.project.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MatchingController {

	private final static Logger logger = LoggerFactory.getLogger(MatchingController.class);

	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeMethod()
	{
		return "write";
	}

	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String writeMethod2()
	{
		return "write";
	}
}
