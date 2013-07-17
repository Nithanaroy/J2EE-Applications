package beans;

public class tdersHocasi 
{
	private long hocaID;
	private String dersKod;

	public tdersHocasi()
	{}
	public tdersHocasi(long hocaID, String dersKod)
	{
		this.setHocaID(hocaID);
		this.setDersKod(dersKod);
	}

	public String getDersKod() {
		return dersKod;
	}
	public void setDersKod(String dersKod) {
		this.dersKod = dersKod;
	}
	public long getHocaID() {
		return hocaID;
	}
	public void setHocaID(long hocaID) {
		this.hocaID = hocaID;
	}
}
