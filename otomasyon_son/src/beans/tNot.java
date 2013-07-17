package beans;

public class tNot 
{
	private int  vize, _final, butunleme, gecmeNotu;
	private String ID, dersKod, harfNotu, yil, yariyil, gecmeDurumu;

	public tNot()
	{}
	public tNot(String ID, String dersKod, int vize, int _final, int butunleme, int gecmeNotu, String harfNotu, String yil, String yariyil, String gecmeDurumu)
	{
		this.setID(ID);
		this.dersKod = dersKod;
		this.vize = vize;
		this._final = _final;
		this.butunleme = butunleme;
		this.gecmeNotu = gecmeNotu;
		this.harfNotu = harfNotu;
		this.setYil(yil);
		this.yariyil = yariyil;
		this.gecmeDurumu = gecmeDurumu;
	}

	public int get_final() {
		return _final;
	}
	public void set_final(int _final) {
		this._final = _final;
	}
	public int getVize() {
		return vize;
	}
	public void setVize(int vize) {
		this.vize = vize;
	}
	public String getDersKod() {
		return dersKod;
	}
	public void setDersKod(String dersKod) {
		this.dersKod = dersKod;
	}
	public int getGecmeNotu() {
		return gecmeNotu;
	}
	public void setGecmeNotu(int gecmeNotu) {
		this.gecmeNotu = gecmeNotu;
	}
	public String getYariyil() {
		return yariyil;
	}
	public void setYariyil(String yariyil) {
		this.yariyil = yariyil;
	}
	public String getHarfNotu() {
		return harfNotu;
	}
	public void setHarfNotu(String harfNotu) {
		this.harfNotu = harfNotu;
	}
	public int getButunleme() {
		return butunleme;
	}
	public void setButunleme(int butunleme) {
		this.butunleme = butunleme;
	}
	public String getGecmeDurumu() {
		return gecmeDurumu;
	}
	public void setGecmeDurumu(String gecmeDurumu) {
		this.gecmeDurumu = gecmeDurumu;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getYil() {
		return yil;
	}
	public void setYil(String yil) {
		this.yil = yil;
	}
}
