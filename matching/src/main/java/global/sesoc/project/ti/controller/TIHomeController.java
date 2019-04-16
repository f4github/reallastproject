package global.sesoc.project.ti.controller;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;

import global.sesoc.project.ti.VO.Travel_info_preVO;




@Controller
public class TIHomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(TIHomeController.class);
	
	@RequestMapping(value = "/tihome", method = RequestMethod.GET)
	public String home(Model model			
			, @RequestParam(value="pageNo", defaultValue="1") String pageNo
			, @RequestParam(value="keyword", defaultValue="광주") String keyword
			) throws IOException {
		logger.info("홈 지나감");
		
		
        StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=UU6Gc%2BJyhRGhiUpPvxFFYsMn5xmOMo9lc9uzhJVClAfeUJ4mdBTmZjun1uuHfTs0LR28TrC89ZdnGURjrP3QFA%3D%3D"); /*Service Key*/
		urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("UU6Gc%2BJyhRGhiUpPvxFFYsMn5xmOMo9lc9uzhJVClAfeUJ4mdBTmZjun1uuHfTs0LR28TrC89ZdnGURjrP3QFA%3D%3D (URL- Encode)", "UTF-8")); /*공공데이터포털에서 발급받은 인증키*/
        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS (아이폰), AND(안드로이드), ETC*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(pageNo, "UTF-8")); /*현재 페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("12", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("listYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*목록 구분 (Y=목록, N=개수)*/
        urlBuilder.append("&" + URLEncoder.encode("arrange","UTF-8") + "=" + URLEncoder.encode("A", "UTF-8")); /*(A=제목순, B=조회순, C=수정일순, D=생성일순) 대표이미지가 반드시 있는 정렬(O=제목순, P=조회순, Q=수정일순, R=생성일순)*/
        urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + URLEncoder.encode("12", "UTF-8")); /*관광타입(관광지, 숙박 등) ID*/
        urlBuilder.append("&" + URLEncoder.encode("areaCode","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*지역코드*/
        urlBuilder.append("&" + URLEncoder.encode("sigunguCode","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*시군구코드(areaCode 필수)*/
        urlBuilder.append("&" + URLEncoder.encode("cat1","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*대분류 코드*/
        urlBuilder.append("&" + URLEncoder.encode("cat2","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*중분류 코드(cat1필수)*/
        urlBuilder.append("&" + URLEncoder.encode("cat3","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*소분류 코드(cat1,cat2필수)*/
        urlBuilder.append("&" + URLEncoder.encode("keyword","UTF-8") + "=" + URLEncoder.encode(keyword, "UTF-8")); /*검색 요청할 키워드 (국문=인코딩 필요)*/
        urlBuilder.append("&_type=json");
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        logger.debug("키워드 Response code:{}", conn.getResponseCode());
        logger.debug("keyword:{}", keyword);
        
        
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
		logger.debug("sb.toString: {}", sb.toString());
		
		try{
        String img = sb.toString();
        Gson gson = new Gson();
		JsonParser parser = new JsonParser();
		JsonObject jo1 = (JsonObject) parser.parse(img);  			
		JsonObject jo2 = (JsonObject) jo1.get("response");  
		JsonObject jo3 = (JsonObject) jo2.get("body");  
		logger.debug("jo3:{}", jo3);
		
		JsonObject jo4 = (JsonObject) jo3.get("items");  		
		logger.debug("jo4:{}", jo4);
		
		JsonArray ja = (JsonArray) jo4.get("item");
		logger.debug("{}", ja);

		ArrayList<Travel_info_preVO> list = gson.fromJson(ja, new TypeToken<List<Travel_info_preVO>>(){}.getType());		
		logger.debug("{}", list);
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("list", list);
		model.addAttribute("x", 0);
		//try catch
		}
		catch (Exception e) {
			e.printStackTrace();
		}
				
		return "ti/home";
	}
	

	
	
	
	
}



