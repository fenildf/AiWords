package dict;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class DictReader {
    private Document document;

    public DictReader(String path) {
        try {
            SAXReader saxReader = new SAXReader();
            document = saxReader.read(path);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Map<String, String> getMap() {
        Map<String, String> map = new TreeMap<>();
        Element element = document.getRootElement();
        List lists = element.elements("W");
        for (Object objW : lists) {
            Element elementW = (Element) objW;
            Element elemenWord = elementW.element("word");
            StringBuilder sb = new StringBuilder();
            for (Object objC : elementW.elements("C")) {
                Element elementC = (Element) objC;
                sb.append(elementC.asXML());
            }
            map.put(elemenWord.getText(), sb.toString());
        }
        return map;
    }

}
