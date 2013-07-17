package beans;

public class tDers 
{
	private int dersID, teorik, uygulama, kredi, bolumID, fakulteID;
	private String dersKod, dersAd, yariyil;

	public tDers()
	{}
	public tDers(int dersID, String dersKod, String dersAd, int teorik, int uygulama, int kredi, String yariyil, int bolumID, int fakulteID)
	{
		this.dersID = dersID;
		this.dersKod = dersKod;
		this.dersAd = dersAd;
		this.teorik = teorik;
		this.uygulama = uygulama;
		this.kredi = kredi;
		this.yariyil = yariyil;
		this.bolumID = bolumID;
		this.fakulteID = fakulteID;
	}
	public int getDersID() {
		return dersID;
	}
	public void setDersID(int dersID) {
		this.dersID = dersID;
	}
	public int getTeorik() {
		return teorik;
	}
	public void setTeorik(int teorik) {
		this.teorik = teorik;
	}
	public int getUygulama() {
		return uygulama;
	}
	public void setUygulama(int uygulama) {
		this.uygulama = uygulama;
	}
	public int getKredi() {
		return kredi;
	}
	public void setKredi(int kredi) {
		this.kredi = kredi;
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
	public String getYariyil() {
		return yariyil;
	}
	public void setYariyil(String yariyil) {
		this.yariyil = yariyil;
	}
	public String getDersAd() {
		return dersAd;
	}
	public void setDersAd(String dersAd) {
		this.dersAd = dersAd;
	}
	public String getDersKod() {
		return dersKod;
	}
	public void setDersKod(String dersKod) {
		this.dersKod = dersKod;
	}
}
