SELECT * FROM SHOP_PRODUCT sp;

/*
 1row => VO객체에 할당 class Product{}
 다중의 row => ArrayList<VO>	ArrayList<Product> 객체를 만들어 결국 리스트형 데이터를
 Dao 객체를 통해서 입력값과 함계 리턴할 객체를 리턴하는 메서드를 정의해주면 된다.
 
 class Product {
 	private int pid;
 	private String pname;
 	private int price;
 	private int stock;
 	// 필요한 생성자, set/get메서드 생성.
 }
 */