package bean;

public class arac_bean 
{
	private String plaka;
	private int hýz_sýnýrý = 100;
	private int arac_hýzý;
	
	public  arac_bean() 
	{}
	
	public arac_bean(String plaka , int arac_hýzý)
	{
		this.setPlaka(plaka);
		this.setArac_hýzý(arac_hýzý);
	}

	public int getArac_hýzý() {
		return arac_hýzý;
	}

	public void setArac_hýzý(int arac_hýzý) {
		this.arac_hýzý = arac_hýzý;
	}

	public int getHýz_sýnýrý() {
		return hýz_sýnýrý;
	}

	public void setHýz_sýnýrý(int hýz_sýnýrý) {
		this.hýz_sýnýrý = hýz_sýnýrý;
	}

	public String getPlaka() {
		return plaka;
	}

	public void setPlaka(String plaka) {
		this.plaka = plaka;
	}

}
