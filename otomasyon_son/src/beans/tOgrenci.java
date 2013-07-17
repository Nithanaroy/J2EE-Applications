package beans;

public class tOgrenci 
{
	private int ID, fakulteID, bolumID;
	private String ad, soyad, adres, telefon;

	public tOgrenci()
	{}
	public tOgrenci(int ID, String ad, String soyad, String adres, String telefon, int fakulteID, int bolumID)
	{
		this.ID = ID;
		this.ad = ad;
		this.soyad = soyad;
		this.adres = adres;
		this.telefon = telefon;
		this.fakulteID = fakulteID;
		this.bolumID = bolumID;
	}
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getSoyad() {
		return soyad;
	}
	public void setSoyad(String soyad) {
		this.soyad = soyad;
	}
	public String getTelefon() {
		return telefon;
	}
	public void setTelefon(String telefon) {
		this.telefon = telefon;
	}
	public int getBolumID() {
		return bolumID;
	}
	public void setBolumID(int bolumID) {
		this.bolumID = bolumID;
	}
	public int getFakulteID() {
		return fakulteID;
	}
	public void setFakulteID(int fakulteID) {
		this.fakulteID = fakulteID;
	}
	public String getAdres() {
		return adres;
	}
	public void setAdres(String adres) {
		this.adres = adres;
	}
	public String getAd() {
		return ad;
	}
	public void setAd(String ad) {
		this.ad = ad;
	}

}
