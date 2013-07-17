package beans;

public class tMemur 
{
	private String ID, ad, soyad, telefon;

	public tMemur()
	{}
	public tMemur(String memurID, String ad, String soyad, String telefon)
	{
		this.ID = memurID;
		this.ad = ad;
		this.soyad = soyad;
		this.telefon = telefon;
	}
	public String getTelefon() {
		return telefon;
	}
	public void setTelefon(String telefon) {
		this.telefon = telefon;
	}
	public String getSoyad() {
		return soyad;
	}
	public void setSoyad(String soyad) {
		this.soyad = soyad;
	}
	public String getAd() {
		return ad;
	}
	public void setAd(String ad) {
		this.ad = ad;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		this.ID = iD;
	}
}
