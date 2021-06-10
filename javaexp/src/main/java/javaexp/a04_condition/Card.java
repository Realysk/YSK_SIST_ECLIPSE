package javaexp.a04_condition;

public class Card {
	private String shape;
	private String number;
	public Card(String shape, String number) {
		super();
		this.shape = shape;
		this.number = number;
	}
	public String show() {
		return shape+number;
	}
	public String getShape() {
		return shape;
	}
	public void setShape(String shape) {
		this.shape = shape;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
}
