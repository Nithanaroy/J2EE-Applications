package islemler;

public class kitap_bilgi_sifrele 
{
	public static String sifreli_veri(String veri)
	{
		String sifreli_data = "";
		for(int i = 0 ; i < veri.length() ; i++)
			sifreli_data = sifreli_data+veri.charAt(i)+'*';
		return sifreli_data;
	}
}
