package global.sesoc.project.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MenuController {

	private final static Logger logger = LoggerFactory.getLogger(MenuController.class);

		@RequestMapping(value = "/about-us", method = RequestMethod.GET)
		public String Menu1()
		{
			return "about-us";
		}
		@RequestMapping(value = "/blog", method = RequestMethod.GET)
		public String Menu2()
		{
			return "blog";
		}
		@RequestMapping(value = "/trash", method = RequestMethod.GET)
		public String Menu3()
		{
			return "trash";
		}
		@RequestMapping(value = "/services", method = RequestMethod.GET)
		public String Menu4()
		{
			return "services";
		}
		@RequestMapping(value = "/contact", method = RequestMethod.GET)
		public String Menu5()
		{
			return "contact";
		}
		
		@RequestMapping(value = "/mall", method = RequestMethod.GET)
		public String mall(){
			return "mall";
		}

}
