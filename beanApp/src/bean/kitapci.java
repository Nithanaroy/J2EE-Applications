package bean;

public class kitapci
{
	private String kitap_adi;
	private String kitap_yazari;
	private int kitap_fiyati;
	
	public kitapci()
	{}
	
	public kitapci(String kitap_adi , String kitap_yazari , int kitap_fiyati)
	{
		this.kitap_adi = kitap_adi;
		this.kitap_yazari = kitap_yazari;
		this.setKitap_fiyati(kitap_fiyati);
	}

	public String getKitap_adi() {
		return kitap_adi;
	}

	public void setKitap_adi(String kitap_adi) {
		this.kitap_adi = kitap_adi;
	}

	public String getKitap_yazari() {
		return kitap_yazari;
	}

	public void setKitap_yazari(String kitap_yazari) {
		this.kitap_yazari = kitap_yazari;
	}

	public int getKitap_fiyati() {
		return kitap_fiyati;
	}

	public void setKitap_fiyati(int kitap_fiyati) {
		this.kitap_fiyati = kitap_fiyati;
	}
}
