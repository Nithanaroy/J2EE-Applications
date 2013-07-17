package beans;

public class tBolum 
{
	private int bolumID;
	private String bolumAd;

	public tBolum()
	{}

	public tBolum(int bolumID, String bolumAd)
	{
		this.bolumID = bolumID;
		this.bolumAd = bolumAd;
	}

	public int getBolumID() {
		return bolumID;
	}

	public void setBolumID(int bolumID) {
		this.bolumID = bolumID;
	}

	public String getBolumAd() {
		return bolumAd;
	}

	public void setBolumAd(String bolumAd) {
		this.bolumAd = bolumAd;
	}

}
