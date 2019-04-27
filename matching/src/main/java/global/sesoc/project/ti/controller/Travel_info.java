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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;

import global.sesoc.project.ti.DAO.Travel_infoDAO;
import global.sesoc.project.ti.VO.Travel_infoVO;
import global.sesoc.project.ti.VO.Travel_info_preVO;





@Controller
public class Travel_info {
	
	private static final Logger logger = LoggerFactory.getLogger(TI_HomeController.class);	

	
	@Autowired
	Travel_infoDAO dao;
	
	@RequestMapping(value = "Travel_info", method = RequestMethod.GET)
    public void Travel() throws IOException {
        StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=UU6Gc%2BJyhRGhiUpPvxFFYsMn5xmOMo9lc9uzhJVClAfeUJ4mdBTmZjun1uuHfTs0LR28TrC89ZdnGURjrP3QFA%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("UU6Gc%2BJyhRGhiUpPvxFFYsMn5xmOMo9lc9uzhJVClAfeUJ4mdBTmZjun1uuHfTs0LR28TrC89ZdnGURjrP3QFA%3D%3D (URL- Encode)", "UTF-8")); /*공공데이터포털에서 발급받은 인증키*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS (아이폰), AND (안드로이드),WIN (원도우폰), ETC*/
        urlBuilder.append("&" + URLEncoder.encode("arrange","UTF-8") + "=" + URLEncoder.encode("B", "UTF-8")); /*(A=제목순, B=조회순, C=수정일순, D=생성일순) , 대표이미지가 반드시 있는 정렬 (O=제목순, P=조회순, Q=수정일순, R=생성일순)*/
        urlBuilder.append("&" + URLEncoder.encode("cat1","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*대분류 코드*/
        urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + URLEncoder.encode("15", "UTF-8")); /*관광타입(관광지, 숙박 등) ID*/
        urlBuilder.append("&" + URLEncoder.encode("areaCode","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*지역코드*/
        urlBuilder.append("&" + URLEncoder.encode("sigunguCode","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*시군구코드(areaCode 필수)*/
        urlBuilder.append("&" + URLEncoder.encode("cat2","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*중분류 코드(cat1필수)*/
        urlBuilder.append("&" + URLEncoder.encode("cat3","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*소분류 코드(cat1,cat2필수)*/
        urlBuilder.append("&" + URLEncoder.encode("listYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*목록 구분 (Y=목록, N=개수)*/
        urlBuilder.append("&_type=json");
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
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
        logger.debug("{}", sb.toString());
     
        String area = sb.toString();
        Gson gson = new Gson();
        //결과적으로 요청한 값이 Json으로 오고 이것을 String으로 바꾼것을 parser로 다시 Json으로 바꿔주고 있다.		
		JsonParser parser = new JsonParser();
		//파서는 String을 Json으로 바꿔주는 기능을 수행한다
		//Json 배열 객체 생성
		JsonObject jo1 = (JsonObject) parser.parse(area);  
		
		JsonObject jo2 = (JsonObject) jo1.get("response");  
		JsonObject jo3 = (JsonObject) jo2.get("body");  
		logger.debug("{}", jo3);
		
		JsonObject jo4 = (JsonObject) jo3.get("items");  		
		logger.debug("{}", jo4);
		
		JsonArray ja = (JsonArray) jo4.get("item");
		logger.debug("{}", ja);
		
		ArrayList<Travel_info_preVO> list = gson.fromJson(ja, new TypeToken<List<Travel_info_preVO>>(){}.getType());		
		logger.debug("{}", list);
		
		
		for(int i=0 ; i < list.size() ; i++){
			Travel_infoVO vo = new Travel_infoVO();		
			
			if(list.get(i).getAddr1() == null || list.get(i).getAddr1() == ""){
				vo.setTravelPlace("");
			}
			else{

				if(list.get(i).getAddr1().substring(0, 5).contains("서울")){
					vo.setTravelPlace("서울");
				}
				else if(list.get(i).getAddr1().substring(0, 5).contains("부산")){
					vo.setTravelPlace("부산");
				}
				else if(list.get(i).getAddr1().substring(0, 5).contains("대구")){
					vo.setTravelPlace("대구");
				}
				else if(list.get(i).getAddr1().substring(0, 5).contains("인천")){
					vo.setTravelPlace("인천");
				}
				else if(list.get(i).getAddr1().substring(0, 5).contains("광주")){
					vo.setTravelPlace("광주");
				}
				else if(list.get(i).getAddr1().substring(0, 5).contains("대전")){
					vo.setTravelPlace("대전");
				}
				else if(list.get(i).getAddr1().substring(0, 5).contains("울산")){
					vo.setTravelPlace("울산");
				}
				else if(list.get(i).getAddr1().substring(0, 5).contains("세종")){
					vo.setTravelPlace("세종");
				}
				else if(list.get(i).getAddr1().substring(0, 5).contains("경기도")){
					vo.setTravelPlace("경기도");
				}
				else if(list.get(i).getAddr1().substring(0, 5).contains("강원도")){
					vo.setTravelPlace("강원도");
				}
				else if(list.get(i).getAddr1().substring(0, 5).contains("충청북도")){
					vo.setTravelPlace("충청북도");
				}
				else if(list.get(i).getAddr1().substring(0, 5).contains("충청남도")){
					vo.setTravelPlace("충청남도");
				}
				else if(list.get(i).getAddr1().substring(0, 5).contains("전라북도")){
					vo.setTravelPlace("전라북도");
				}
				else if(list.get(i).getAddr1().substring(0, 5).contains("전라북도")){
					vo.setTravelPlace("전라북도");
				}
				else if(list.get(i).getAddr1().substring(0, 5).contains("경상북도")){
					vo.setTravelPlace("경상북도");
				}
				else if(list.get(i).getAddr1().substring(0, 5).contains("경상남도")){
					vo.setTravelPlace("경상남도");
				}
				else if(list.get(i).getAddr1().substring(0, 5).contains("제주도")){
					vo.setTravelPlace("제주도");
				}
				else{
					vo.setTravelPlace("");
				}
			}

	
			vo.setId(list.get(i).getTitle());			
			vo.setViews(list.get(i).getReadcount());
			vo.setMapx(list.get(i).getMapx());
			vo.setMapy(list.get(i).getMapy());
			vo.setSigungucode(list.get(i).getSigungucode());
			vo.setAddress(list.get(i).getAddr1());
			vo.setZipcode(list.get(i).getZipcode());
			vo.setTel(list.get(i).getTel());
			
			if(list.get(i).getFirstimage() == null || list.get(i).getFirstimage() == ""){
				vo.setFirstimage("");
			}
			else{
				vo.setFirstimage(list.get(i).getFirstimage());
			}
			if(list.get(i).getFirstimage2() == null || list.get(i).getFirstimage2() == ""){
				vo.setFirstimage2("");
			}
			else{
				vo.setFirstimage2(list.get(i).getFirstimage2());
			}						
			
			//dao.insert(vo);			
		}	
    }

	
	
}















