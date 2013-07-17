package beans;

public class tUser 
{
	private long ID;
	private String password;
	private int yetkiID;

	public tUser()
	{}
	public tUser(long ID, String password, int yetkiID)
	{
		this.ID = ID;
		this.password = password;
		this.yetkiID = yetkiID;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public long getID() {
		return ID;
	}
	public void setID(long iD) {
		ID = iD;
	}
	public int getYetkiID() {
		return yetkiID;
	}
	public void setYetkiID(int yetkiID) {
		this.yetkiID = yetkiID;
	}
}
