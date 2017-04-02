package util;

import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Crawling {
	public static void main(String[] args) throws IOException {
		String url = "http://www.lotte.co.kr/04_promote/";
		Document doc = Jsoup.connect(url + "bbs_list_news.jsp").get();
//		System.out.println(doc.toString());
		ArrayList<String> urls = new ArrayList<String>();
		ArrayList<String> names = new ArrayList<String>();;
		
		Elements elements = doc.select("table.board_list");
//		System.out.println(elements.toString());
		for(Element e : elements) {
			Elements td = e.getElementsByTag("td");
			Elements href = td.select("[href]");
			for(Element e2 : href ) {
				urls.add(e2.attr("abs:href"));
				names.add(e2.text());
//				System.out.println(e2.attr("abs:href"));	// url
//				System.out.println(e2.text());				// name
				
			}

		}
		
		
		for(int i=0; i<urls.size(); i++) {
			System.out.println(urls.get(i) + " : " + names.get(i));
		}

	}

}