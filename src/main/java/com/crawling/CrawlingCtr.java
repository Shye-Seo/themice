package com.crawling;

import java.awt.image.BufferedImage;
import java.io.FileOutputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.net.ssl.HttpsURLConnection;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

@Controller
@Component
public class CrawlingCtr {

	@Autowired
	CrawlingSvc service;

	@Scheduled(cron = "0 0 23 * * ?")
	public void Crolling() {

		boolean play = true;

		String title = "";
		String business = "";
		String start_day = "";
		String end_day = "";
		String time = "";
		String address = "";
		String tel = "";
		String fax = "";
		String web_address = "";
		String price = "";
		String content = "";
		String img_path = "";
		String img_name = "";		

//		BexcoVO vo = service.getidx();
		int idx = 9500;
//		int safe = idx + 1000;

		while (play) {
			
			List<Bexco_InsertVO> list = new ArrayList<Bexco_InsertVO>();
			
			try {
				String URL = "https://www.bexco.co.kr/kor/EventSchedule/view.do?idx=" + idx
						+ "&mode=view&mCode=MN0085&sch_event_gb=001";

				Document document = Jsoup.connect(URL).get();

				Elements strong = document.getElementsByClass("view_wrap");

				Elements strong1 = document.getElementsByClass("txt");

				Elements strong2 = document.getElementsByClass("detail_sec");

				Elements e = document.select(".img > a > img");

				String src = "https://www.bexco.co.kr" + e.get(0).attr("src");

				URL url = new URL(src);
				HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();

				conn.setRequestProperty("Referer", src);
				BufferedImage img = ImageIO.read(conn.getInputStream());
				
				img_path = "C:\\workspace\\img\\crawiling\\crawling" + idx + ".jpg";
				img_name = "crawling" + idx + ".jpg";
				FileOutputStream out = new FileOutputStream(img_path);
				ImageIO.write(img, "jpg", out);

				for (Element st : strong) {
					String data = st.getElementsByTag("h3").text();
					title = data;
				}

				for (Element st : strong1) {
					String data = st.getElementsByTag("dl").text();
					String[] split = data.split("주최/주관|기간|~|시간|장소|전화|팩스|홈페이지|관람료");

					for (int i = 0; i < split.length - 1; i++) {
						business = split[1];
						business = business.trim();
						start_day = split[2];
						start_day = start_day.trim();
						start_day = start_day.replace(".", "-");
						end_day = split[3];
						end_day = end_day.trim();
						end_day = end_day.replace(".", "-");
						time = split[4] + " ~ " + split[5];
						time = time.trim();
						address = split[6];
						address = address.trim();
						tel = split[7];
						tel = tel.trim();
						fax = split[8];
						fax = fax.trim();
						web_address = split[9];
						web_address = web_address.trim();
						price = split[10];
						price = price.trim();
					}
				}

				for (Element st : strong2) {
					String data = st.getElementsByTag("div").text();
					content = data;
				}

			} catch (Exception e) {
				e.printStackTrace();
			}

			System.out.println("title : " + title);
			Bexco_InsertVO bvo = new Bexco_InsertVO(title, business, start_day, end_day, time, address, tel, fax, web_address,
					price, content, img_name);
			list.add(bvo);
			service.setCrawling(list);
			idx++;

			if (idx == 10400) {
				play = false;
			}
		}
		service.overlap_delete();
		service.move_data();
	}
}