package global.sesoc.project.ti.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;

import global.sesoc.project.ti.DAO.Travel_infoDAO;
import global.sesoc.project.ti.VO.CommonVO;
import global.sesoc.project.ti.VO.Travel_infoVO;
import global.sesoc.project.ti.VO.Travel_info_preVO;
import global.sesoc.project.ti.VO.Travel_intro_imgVO;
import global.sesoc.project.ti.VO.Trip_likeVO;





@Controller
public class Travel_intro {
	
	private static final Logger logger = LoggerFactory.getLogger(TI_HomeController.class);	
	
	@Autowired
	Travel_infoDAO dao;
	
	@RequestMapping(value = "Travel_intro1", method = RequestMethod.GET)
	public String Travel_intro1(String contentTypeId, Model model) {		
		logger.info("Travel_intro1 지나감");
		logger.debug("contentTypeId: {}", contentTypeId);
		model.addAttribute("contentTypeId", contentTypeId);
		
		return "ti/Travel_intro1";
	}
	
	@RequestMapping(value = "Travel_intro2", method = RequestMethod.GET)
    public String Travel_intro2(String areacode
    		, String contentTypeId
    		, Model model
    		, @RequestParam(value="arrange", defaultValue="B") String arrange
    		, @RequestParam(value="pageNo", defaultValue="1") String pageNo
    		) throws IOException {
		logger.debug("areacode: {}", areacode);
		logger.debug("contentTypeId: {}", contentTypeId);
        StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=UU6Gc%2BJyhRGhiUpPvxFFYsMn5xmOMo9lc9uzhJVClAfeUJ4mdBTmZjun1uuHfTs0LR28TrC89ZdnGURjrP3QFA%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("UU6Gc%2BJyhRGhiUpPvxFFYsMn5xmOMo9lc9uzhJVClAfeUJ4mdBTmZjun1uuHfTs0LR28TrC89ZdnGURjrP3QFA%3D%3D (URL- Encode)", "UTF-8")); /*공공데이터포털에서 발급받은 인증키*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(pageNo, "UTF-8")); /*현재 페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("6", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS (아이폰), AND (안드로이드),WIN (원도우폰), ETC*/
        urlBuilder.append("&" + URLEncoder.encode("arrange","UTF-8") + "=" + URLEncoder.encode(arrange, "UTF-8")); /*(A=제목순, B=조회순, C=수정일순, D=생성일순) , 대표이미지가 반드시 있는 정렬 (O=제목순, P=조회순, Q=수정일순, R=생성일순)*/
        urlBuilder.append("&" + URLEncoder.encode("cat1","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*대분류 코드*/
        urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + URLEncoder.encode(contentTypeId, "UTF-8")); /*관광타입(관광지, 숙박 등) ID*/
        urlBuilder.append("&" + URLEncoder.encode("areaCode","UTF-8") + "=" + URLEncoder.encode(areacode, "UTF-8")); /*지역코드*/
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
		
		ArrayList<Travel_infoVO> list2 = new ArrayList<>();
		
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
			
			//이미지
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
			
			//우편번호
			if(list.get(i).getZipcode() == null || list.get(i).getZipcode() == ""){
				vo.setZipcode("");
			}
			else{
				vo.setZipcode(list.get(i).getZipcode());
			}
			//logger.debug("contentid:{}", list.get(i).getContentid());
			
			// 서버에 저장 안하겠다
			//dao.insert(vo);		
			list2.add(vo);
		}	
		
		//ArrayList로 가져오기
		
		model.addAttribute("list", list);
		model.addAttribute("areacode", areacode);
		model.addAttribute("contentTypeId", contentTypeId);
		
		ArrayList<Travel_info_preVO> popular = popular();
		model.addAttribute("popular", popular);
		
		return "ti/Travel_intro2";
    }

//클릭했을 때 상세 정보 출력 (공통정보 출력)
		@RequestMapping(value = "Travel_intro3", method = RequestMethod.GET)
	    public String Travel_intro3(String contentid, String contenttypeid, Model model) throws IOException {
	        StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=UU6Gc%2BJyhRGhiUpPvxFFYsMn5xmOMo9lc9uzhJVClAfeUJ4mdBTmZjun1uuHfTs0LR28TrC89ZdnGURjrP3QFA%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("UU6Gc%2BJyhRGhiUpPvxFFYsMn5xmOMo9lc9uzhJVClAfeUJ4mdBTmZjun1uuHfTs0LR28TrC89ZdnGURjrP3QFA%3D%3D (URL- Encode)", "UTF-8")); /*공공데이터포털에서 발급받은 인증키*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지 번호*/
	        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS(아이폰),AND(안드로이드),WIN(원도우폰),ETC*/
	        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
	        urlBuilder.append("&" + URLEncoder.encode("contentId","UTF-8") + "=" + URLEncoder.encode(contentid, "UTF-8")); /*콘텐츠ID*/
	        urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + URLEncoder.encode(contenttypeid, "UTF-8")); /*관광타입(관광지, 숙박 등) ID*/
	        urlBuilder.append("&" + URLEncoder.encode("defaultYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*기본정보 조회여부*/
	        urlBuilder.append("&" + URLEncoder.encode("firstImageYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*원본, 썸네일 대표이미지 조회여부*/
	        urlBuilder.append("&" + URLEncoder.encode("areacodeYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*지역코드, 시군구코드 조회여부*/
	        urlBuilder.append("&" + URLEncoder.encode("catcodeYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*대,중,소분류코드 조회여부*/
	        urlBuilder.append("&" + URLEncoder.encode("addrinfoYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*주소, 상세주소 조회여부*/
	        urlBuilder.append("&" + URLEncoder.encode("mapinfoYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*좌표 X,Y 조회여부*/
	        urlBuilder.append("&" + URLEncoder.encode("overviewYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*콘텐츠 개요 조회여부*/
	        urlBuilder.append("&_type=json");
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        logger.debug("Response code:{}", conn.getResponseCode());
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
			logger.debug("jo3:{}", jo3);
			
			JsonObject jo4 = (JsonObject) jo3.get("items");  		
			logger.debug("jo4:{}", jo4);
			
			JsonObject jo5 = (JsonObject) jo4.get("item");  		
			logger.debug("jo5:{}", jo5);

			CommonVO vo = gson.fromJson(jo5, CommonVO.class);
			logger.debug("vo:{}", vo);
		
			model.addAttribute("vo", vo);
			
			if(vo.getFirstimage() == null || vo.getFirstimage() == ""){
				
			}
			else{
				ArrayList<Travel_intro_imgVO> list2 = Travel_intro_img(contentid);			
				logger.debug("list2: {}", list2);

				
				model.addAttribute("check", "ok");
				model.addAttribute("list2", list2);							
			}
			model.addAttribute("contentid", contentid);
			
			return "ti/Travel_intro3";
	    }
		
		
		//이미지
		
		public ArrayList<Travel_intro_imgVO> Travel_intro_img(String contentid) throws IOException {
			
			
			StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage"); /*URL*/
			urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=UU6Gc%2BJyhRGhiUpPvxFFYsMn5xmOMo9lc9uzhJVClAfeUJ4mdBTmZjun1uuHfTs0LR28TrC89ZdnGURjrP3QFA%3D%3D"); /*Service Key*/
			urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("UU6Gc%2BJyhRGhiUpPvxFFYsMn5xmOMo9lc9uzhJVClAfeUJ4mdBTmZjun1uuHfTs0LR28TrC89ZdnGURjrP3QFA%3D%3D (URL- Encode)", "UTF-8")); /*공공데이터포털에서 발급받은 인증키*/
			urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
			urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지 번호*/
			urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS(아이폰),AND(안드로이드),WIN(원도우폰),ETC*/
			urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
			urlBuilder.append("&" + URLEncoder.encode("contentId","UTF-8") + "=" + URLEncoder.encode(contentid, "UTF-8")); /*콘텐츠 ID*/
			urlBuilder.append("&" + URLEncoder.encode("imageYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*Y=콘텐츠 이미지 조회, N='음식점'타입의 음식메뉴 이미지*/
			urlBuilder.append("&" + URLEncoder.encode("subImageYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*Y=원본,썸네일 이미지 조회 N=Null*/
			urlBuilder.append("&_type=json");
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			logger.debug("이미지 Response code:{}", conn.getResponseCode());	        
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
			

			
	        String img = sb.toString();	//StringBuilder를 String으로 바꿈
	        logger.debug("img: {}", img);
	        Gson gson = new Gson();
	        //결과적으로 요청한 값이 Json으로 오고 이것을 String으로 바꾼것을 parser로 다시 Json으로 바꿔주고 있다.		
			JsonParser parser = new JsonParser();
			//파서는 String을 Json으로 바꿔주는 기능을 수행한다
			//Json 배열 객체 생성
			JsonObject jo1 = (JsonObject) parser.parse(img);  
			
			JsonObject jo2 = (JsonObject) jo1.get("response");  
			JsonObject jo3 = (JsonObject) jo2.get("body");  
			logger.debug("jo3:{}", jo3);
//
			JsonElement tot = jo3.get("totalCount");
			int toc = tot.getAsInt();
			logger.debug("숫자 발견:{}", toc);
//			
			
			ArrayList<Travel_intro_imgVO> list = new ArrayList<>();
			try{
			if(toc == 1){	
				JsonObject jo4 = (JsonObject) jo3.get("items");  		
				logger.debug("jo4:{}", jo4);
				
				
				JsonObject jo5 = (JsonObject) jo4.get("item");
				logger.debug("jo5:{}", jo5);

				Travel_intro_imgVO vo = gson.fromJson(jo5, Travel_intro_imgVO.class);
				logger.debug("vo:{}", vo);
				
				list.add(vo);				
			}
/*			
			else if(toc == 0){
							
				Travel_intro_imgVO vo = new Travel_intro_imgVO();
				logger.debug("null값일때: {}", vo);
				list.add(vo);
			}
	*/		
			else{
				JsonObject jo4 = (JsonObject) jo3.get("items");  		
				logger.debug("jo4:{}", jo4);
								
				JsonArray ja = (JsonArray) jo4.get("item");
				logger.debug("ja: {}", ja);
						
				list = gson.fromJson(ja, new TypeToken<List<Travel_intro_imgVO>>(){}.getType());
				logger.debug("list: {}", list);	
			}
			//try catch
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			
			return list;
		}
			
//popular
		
		public ArrayList<Travel_info_preVO> popular() throws IOException {
	        StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=UU6Gc%2BJyhRGhiUpPvxFFYsMn5xmOMo9lc9uzhJVClAfeUJ4mdBTmZjun1uuHfTs0LR28TrC89ZdnGURjrP3QFA%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("UU6Gc%2BJyhRGhiUpPvxFFYsMn5xmOMo9lc9uzhJVClAfeUJ4mdBTmZjun1uuHfTs0LR28TrC89ZdnGURjrP3QFA%3D%3D (URL- Encode)", "UTF-8")); /*공공데이터포털에서 발급받은 인증키*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지 번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("5", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
	        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS (아이폰), AND (안드로이드),WIN (원도우폰), ETC*/
	        urlBuilder.append("&" + URLEncoder.encode("arrange","UTF-8") + "=" + URLEncoder.encode("B", "UTF-8")); /*(A=제목순, B=조회순, C=수정일순, D=생성일순) , 대표이미지가 반드시 있는 정렬 (O=제목순, P=조회순, Q=수정일순, R=생성일순)*/
	        urlBuilder.append("&" + URLEncoder.encode("cat1","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*대분류 코드*/
	        urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + URLEncoder.encode("12", "UTF-8")); /*관광타입(관광지, 숙박 등) ID*/
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
						
			return list;
	    }
		
		@ResponseBody
		@RequestMapping(value="trip_like", method=RequestMethod.GET)
		public String trip_like(String title, String contentid, String contenttypeid, HttpSession session){
			String id = (String) session.getAttribute("loginId");
			Trip_likeVO vo = new Trip_likeVO();
			vo.setId(id);
			vo.setTitle(title);
			vo.setContentid(contentid);
			vo.setContenttypeid(contenttypeid);
			
			logger.debug("넘어오는 vo: {}", vo);
			
			Trip_likeVO check = null;
			check = dao.trip_like_chek(vo);
			if(check != null){				
				return "f";
			}
			else{
				dao.trip_like(vo);
				return "t";
			}						
		}
		
	
		
		@RequestMapping(value="trip_like_del", method=RequestMethod.GET)
		public String trip_like_del(int likenum){
			logger.debug("{}", likenum);
			dao.likeDel(likenum);
			
			return "redirect:mypage";
		}
		
		
		
		
}












