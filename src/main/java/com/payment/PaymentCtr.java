package com.payment;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.contents.ContentsVO;
import com.member.MemberVO;

@Controller
public class PaymentCtr<Payment> {
	
	@Autowired
	PaymentSvc service;
	
	@RequestMapping(value = "payment_page")
	public String Payment_page(HttpServletResponse response, HttpServletRequest request, HttpSession session, ModelMap modelMap) throws IOException {
		
		String id = (String) session.getAttribute("id");
		
		MemberVO mv = service.getMember(id);
		
		String contents_idx = request.getParameter("contents_idx");
		
		ContentsVO cv = service.getContents(contents_idx);
		
		String[] price = cv.getPrice().split(",");
		
		modelMap.addAttribute("contents_idx", contents_idx);
		modelMap.addAttribute("price", price);
		modelMap.addAttribute("mv", mv);
		modelMap.addAttribute("cv", cv);
		
		SimpleDateFormat date = new SimpleDateFormat("yyyyMMddHHmmss");
		Calendar calendar = Calendar.getInstance();
		String today = date.format(calendar.getTime());
		String num = "";
		for (int i = 0; i < 7; i++) {
			Random random = new Random();
			int r = random.nextInt(10);
			num = num + Integer.toString(r);
		}

		String merchant_uid = contents_idx + today + "-" + num;
		modelMap.addAttribute("merchant_uid", merchant_uid);
		
		return "view/payment";
	}
	
	@RequestMapping(value = "payment_check", method = RequestMethod.POST)
	public @ResponseBody String payment_check(HttpSession session, HttpServletResponse response) {
		
		int check = 1;
		
		String id = (String) session.getAttribute("id");
		
		if(id == null) {
			check = 0;
		}
		
		return String.valueOf(check);
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "payment")
	public String Payment(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap,
			@RequestParam(value = "imp_uid", defaultValue = "") String imp_uid,
			@RequestParam(value = "imp_amount", defaultValue = "") String imp_amount,
			@RequestParam(value = "contents_idx", defaultValue = "") String contents_idx,
			@RequestParam(value = "contents_idx", defaultValue = "") String entry_date)
			throws UnsupportedEncodingException {
	
		String imp_key = "7195209932919254";
		String imp_secret = "0GhmJpErAB0NBUJ07E84TDyyHcZsDngE3x1NWFfxgfkSa3ShH1mBFUam79OKx4pACqoy5D5mTqe3t7lb";
		String apiURL = "https://api.iamport.kr/users/getToken";

		JSONObject imp = new JSONObject();

		imp.put("imp_key", imp_key);
		imp.put("imp_secret", imp_secret);

		String access_token = "";
		String amount = "";

		try {
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Content-Type", "application/json");
			
			con.setDoOutput(true);
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(con.getOutputStream()));
			bw.write(imp.toString());
			bw.flush();
			bw.close();
			
			int responseCode = con.getResponseCode();
			BufferedReader br;
			System.out.print("responseCode=" + responseCode);
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			
			String inputLine;
			StringBuffer res = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
			br.close();
			if (responseCode == 200) {
				System.out.println(res.toString());
				JSONParser parsing = new JSONParser();
				Object obj = parsing.parse(res.toString());

				JSONObject jsonObj = (JSONObject) obj;
				JSONObject responses = (JSONObject) jsonObj.get("response");

				access_token = (String) responses.get("access_token");

				amount = Payment_info(access_token, imp_uid, contents_idx, entry_date);

			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return "redirect:detail?contents_idx=" + contents_idx;
	}

	public String Payment_info(String access_token, String imp_uid, String contents_idx, String entry_date) {

		SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd");
		Date time = new Date();
		String time1 = format.format(time);
		
		String apiURL = "https://api.iamport.kr/payments/" + imp_uid;

		String amount = "";
		String consumer = "";
		String status = "";
		String title = service.getTitle(contents_idx);
		String business_num = service.getBusiness_num(contents_idx);
		
		try {
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", access_token);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			System.out.print("responseCode=" + responseCode);
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer res = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
			br.close();

			if (responseCode == 200) {
				System.out.println(res.toString());
				JSONParser parsing = new JSONParser();
				Object obj = parsing.parse(res.toString());

				JSONObject jsonObj = (JSONObject) obj;
				JSONObject responses = (JSONObject) jsonObj.get("response");

				amount = String.valueOf(responses.get("amount"));
				consumer = String.valueOf(responses.get("buyer_name"));
				status = String.valueOf(responses.get("status"));
				
				PaymentVO payment = new PaymentVO(business_num, contents_idx, imp_uid, title, amount, consumer, time1, entry_date, status);
				service.insertPayment(payment);
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return amount;
	}
}
