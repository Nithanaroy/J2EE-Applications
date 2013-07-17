package dCandan.form;

import java.util.Enumeration;
import java.util.Hashtable;

public class members 
{	
	static class member
	{
		private String name, surname, username, password;
		
		public member(String name, String surname, String username, String password)
		{
			this.name = name;
			this.surname = surname;
			this.username = username;
			this.password  = password;
		}
		
		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getSurname() {
			return surname;
		}

		public void setSurname(String surname) {
			this.surname = surname;
		}

		public String getUsername() {
			return username;
		}

		public void setUsername(String username) {
			this.username = username;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}
	}
	static Hashtable<String, member> uyeler = new Hashtable<>();
	
	public static void add(String name, String surname, String username, String password)
	{
		member member = new member(name, surname, username, password);
		uyeler.put(username, member);
	}
	
	public static void uyeler()
	{
		Enumeration<member> kullanicilar = uyeler.elements();
		while(kullanicilar.hasMoreElements())
		{
			member uye = kullanicilar.nextElement();
			System.out.println("ad : "+uye.getName()+"\nsoyad : "+uye.getSurname()+"\nkullanýcýAdý : "+uye.getUsername()+"\nparola : "+uye.getPassword());
		}
	}
	
	public static boolean uyeMi(String userName, String password)
	{
		Enumeration<member> kullanicilar = uyeler.elements();
		while(kullanicilar.hasMoreElements())
		{
			member uye = kullanicilar.nextElement();
			System.out.println("girilen : "+userName+" , "+password+"\nkayýttaki : "+uye.getUsername()+" , "+uye.getPassword());
			if (uye.getUsername().trim().equals(userName.trim()) && uye.getPassword().trim().equals(password.trim()))
			{
				return true;
			}
		}
		return false;
	}
}