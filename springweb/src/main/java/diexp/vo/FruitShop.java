package diexp.vo;

import java.util.Properties;
import java.util.Set;

public class FruitShop {
	private Set<String> fruit;
	private Properties frInfo;

	public Set<String> getFruit() {
		return fruit;
	}
	public void setFruit(Set<String> fruit) {
		this.fruit = fruit;
	}
	public Properties getFrInfo() {
		return frInfo;
	}
	public void setFrInfo(Properties frInfo) {
		this.frInfo = frInfo;
	}
	public String toString() {
		return "FruitShop [fruit=" + fruit + ", frInfo=" + frInfo + "]";
	}
	public void show() {
		System.out.println("#판매정보#");
		//  해당 key와 연결되어 있는 값을 가져올 수 있다.
		for(String key: fruit) {
			System.out.println(  key+":"+frInfo.get(key)  );
		}
	}
}
