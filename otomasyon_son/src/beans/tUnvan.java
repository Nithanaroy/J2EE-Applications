package beans;

public class tUnvan
{
	private int unvanID;
	private String unvanAd;

	public tUnvan()
	{}

	public tUnvan(int unvanID, String unvanAd)
	{
		this.unvanID = unvanID;
		this.unvanAd = unvanAd;
	}

	public String getUnvanAd() {
		return unvanAd;
	}

	public void setUnvanAd(String unvanAd) {
		this.unvanAd = unvanAd;
	}

	public int getUnvanID() {
		return unvanID;
	}

	public void setUnvanID(int unvanID) {
		this.unvanID = unvanID;
	}
}
