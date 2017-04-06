package util;

import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import model.domain.NewEvent;

public class Crawling {
	public static ArrayList<NewEvent> NewEvent() throws IOException {
		String url = "http://www.lotte.co.kr/04_promote/";
		Document doc = Jsoup.connect(url + "bbs_list_news.jsp").get();
		ArrayList<NewEvent> info = new ArrayList<NewEvent>();
		
		
		Elements elements = doc.select("table.board_list");
		for(Element e : elements) {
			Elements td = e.getElementsByTag("td");
			Elements href = td.select("[href]");
			for(Element e2 : href ) {
				info.add(new NewEvent(e2.attr("abs:href"), e2.text()));	// url, name
				System.out.println(e2.attr("abs:href"));	// url
				System.out.println(e2.text());				// name
				
			}

		}
		
		
		return info;

	}

}