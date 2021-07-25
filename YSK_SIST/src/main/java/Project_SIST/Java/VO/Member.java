package Project_SIST.Java.VO;

public class Member {
    private String ID;
    private String PW;
    private String Name;
    private String hp;
    private String email;
    private String address;
    private String tel;
    
   public Member(String iD, String pW, String name, String hp, 
   		String email, String address, String tel) {
      super();
      this.ID = iD;
      this.PW = pW;
      this.Name = name;
      this.hp = hp;
      this.email = email;
      this.address = address;
      this.tel = tel;
   }
    
   public String getHp() {
      return hp;
   }

   public void setHp(String hp) {
      this.hp = hp;
   }

   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public String getAddress() {
      return address;
   }

   public void setAddress(String address) {
      this.address = address;
   }

   public String getTel() {
      return tel;
   }

   public void setTel(String tel) {
      this.tel = tel;
   }

   public String getID() {
        return ID;
    }
 
    public String getPW() {
        return PW;
    }
 
    public String getName() {
        return Name;
    }
 
    public void setID(String iD) {
        ID = iD;
    }
 
    public void setPW(String pW) {
        PW = pW;
    }
 
    public void setName(String name) {
        Name = name;
    }
 
    @Override
    public String toString() {
        return " ID : " + ID + " PW : " + PW + " Name : " + Name + " H.P : " 
       		 + hp + " Email : " + email + " Address : " + address + " Tel " + tel;
    }
}