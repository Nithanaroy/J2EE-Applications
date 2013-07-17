package beans;

public class tYetki 
{
	private int yetkiID;
	private String yetkiAd;

	public tYetki()
	{}

	public tYetki(int yetkiID, String yetkiAd)
	{
		this.yetkiID = yetkiID;
		this.yetkiAd = yetkiAd;
	}

	public int getYetkiID() {
		return yetkiID;
	}

	public void setYetkiID(int yetkiID) {
		this.yetkiID = yetkiID;
	}

	public String getYetkiAd() {
		return yetkiAd;
	}

	public void setYetkiAd(String yetkiAd) {
		this.yetkiAd = yetkiAd;
	}
}
