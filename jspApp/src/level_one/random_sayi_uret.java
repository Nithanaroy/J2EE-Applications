package level_one;

import java.util.ArrayList;


public class random_sayi_uret
{
	public static ArrayList<String> sayi_uret(int sayi_adet , int basamak_sayisi)
	{	
		ArrayList<String> sayilar = new ArrayList<>();
		String sayi="";
		
		for(int i = 0 ; i < sayi_adet ; i++)
		{
			for(int j = 0 ; j < basamak_sayisi ; j++)
				sayi = sayi + (int)(Math.random()*10);
			sayilar.add(sayi);
			sayi = "";
		}
		return sayilar;
	}
}
