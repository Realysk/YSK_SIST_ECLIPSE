package javaexp.a00_exp;

	public class Movie {
		
		public String name;
		public int rank;
		public String loc;
		
		public Movie(){
			System.out.println("생성자 호출!!");
		}
		public Movie (String name, int rank, String loc) {
			this.name = name;
			this.rank = rank;
			this.loc = loc;			
		}
		public String call() {
			System.out.println("기능 메서드 호출..");
			return "문자열 리턴";
		}
	}