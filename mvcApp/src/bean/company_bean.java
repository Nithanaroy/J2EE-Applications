package bean;

public class company_bean 
{
	private String companyName;
	private String business;

	public company_bean(String companyName, String business) 
	{
		setCompanyName(companyName);
		setBusiness(business);
	}
	
	public String getCompanyName() 
	{
		return(companyName); 
	}
		
	public void setCompanyName(String newCompanyName) 
	{
		companyName = newCompanyName;
	}
		
	public String getBusiness() 
	{
		return(business); 
	}
	
	public void setBusiness(String newBusiness) 
	{
		business = newBusiness;
	}
}
