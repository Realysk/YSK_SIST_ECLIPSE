package diexp.vo;

public abstract class PartDevice {
	private String device;
	public PartDevice(String device) {
		super();
		this.device = device;
	}
	public void showDevice() {
		System.out.println("부품명:"+device);
	}
}
