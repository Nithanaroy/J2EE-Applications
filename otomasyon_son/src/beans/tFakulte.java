package beans;

public class tFakulte 
{
	private int fakulteID;
	private String fakulteAd;

	public tFakulte()
	{}

	public tFakulte(int fakulteID, String fakulteAd)
	{
		this.fakulteID = fakulteID;
		this.fakulteAd = fakulteAd;
	}

	public String getFakulteAd() {
		return fakulteAd;
	}

	public void setFakulteAd(String fakulteAd) {
		this.fakulteAd = fakulteAd;
	}

	public int getFakulteID() {
		return fakulteID;
	}

	public void setFakulteID(int fakulteID) {
		this.fakulteID = fakulteID;
	}

}
