package beans;

public class tidariGorev {
	private int idariGorevID;
	private String idariGorevAd;

	public tidariGorev()
	{}

	public tidariGorev(int idariGorevID, String idariGorevAd)
	{
		this.idariGorevID = idariGorevID;
		this.idariGorevAd = idariGorevAd;
	}

	public int getIdariGorevID() {
		return idariGorevID;
	}

	public void setIdariGorevID(int idariGorevID) {
		this.idariGorevID = idariGorevID;
	}

	public String getIdariGorevAd() {
		return idariGorevAd;
	}

	public void setIdariGorevAd(String idariGorevAd) {
		this.idariGorevAd = idariGorevAd;
	}
}
