package bean;

public class employe_bean 
{
	private name_bean name;
	private company_bean company;
	
	public employe_bean(name_bean name, company_bean company) 
	{
		setName(name);
		setCompany(company);
	}
	
	public name_bean getName() 
	{
		return(name); 
	}
	
	public void setName(name_bean newName) 
	{
		name = newName;
	}
	
	public company_bean getCompany() 
	{
		return(company); 
	}
	
	public void setCompany(company_bean newCompany) 
	{
		company = newCompany;
	}

}
