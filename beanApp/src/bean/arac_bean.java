package bean;

public class arac_bean 
{
	private String plaka;
	private int h�z_s�n�r� = 100;
	private int arac_h�z�;
	
	public  arac_bean() 
	{}
	
	public arac_bean(String plaka , int arac_h�z�)
	{
		this.setPlaka(plaka);
		this.setArac_h�z�(arac_h�z�);
	}

	public int getArac_h�z�() {
		return arac_h�z�;
	}

	public void setArac_h�z�(int arac_h�z�) {
		this.arac_h�z� = arac_h�z�;
	}

	public int getH�z_s�n�r�() {
		return h�z_s�n�r�;
	}

	public void setH�z_s�n�r�(int h�z_s�n�r�) {
		this.h�z_s�n�r� = h�z_s�n�r�;
	}

	public String getPlaka() {
		return plaka;
	}

	public void setPlaka(String plaka) {
		this.plaka = plaka;
	}

}
