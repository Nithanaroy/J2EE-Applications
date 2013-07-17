package beans;

public class tHoca 
{
	private String ID, ad, soyad, telefon;
	private int unvanID, idariGorevID;

	public tHoca()
	{}
	public tHoca(String hocaID, String ad, String soyad, String telefon, int unvanID, int idariGorevID)
	{
		this.setID(hocaID);
		this.setAd(ad);
		this.setSoyad(soyad);
		this.setTelefon(telefon);
		this.setUnvanID(unvanID);
		this.setIdariGorevID(idariGorevID);
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
	public int getIdariGorevID() {
		return idariGorevID;
	}
	public void setIdariGorevID(int idariGorevID) {
		this.idariGorevID = idariGorevID;
	}
	public int getUnvanID() {
		return unvanID;
	}
	public void setUnvanID(int unvanID) {
		this.unvanID = unvanID;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
}
