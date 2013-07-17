package proses;

import java.util.ArrayList;

public class gecme_notu_hesapla 
{
	public static int gecmeNotu(int not1, int not2)
	{
		int gecme_notu = 0;
		gecme_notu = (int)(not1 * 0.4 + not2 * 0.6);
		return gecme_notu;
	}
	public static String harfNotu(int gecmeNotu)
	{
		String harfNot = null;
		if (gecmeNotu < 40)
			harfNot = "FF";
		else if ((gecmeNotu >= 40) && (gecmeNotu <= 49))
			harfNot = "FD";
		else if ((gecmeNotu >= 50) && (gecmeNotu <= 54))
			harfNot = "DD";
		else if ((gecmeNotu >= 55) && (gecmeNotu <= 59))
			harfNot = "DC";
		else if ((gecmeNotu >= 60) && (gecmeNotu <= 64))
			harfNot = "CC";
		else if ((gecmeNotu >= 65) && (gecmeNotu <= 69))
			harfNot = "CB";
		else if ((gecmeNotu >= 70) && (gecmeNotu <= 84))
			harfNot = "BB";
		else if ((gecmeNotu >= 85) && (gecmeNotu <= 89))
			harfNot = "BA";
		else if ((gecmeNotu >= 90) && (gecmeNotu <= 100))
			harfNot = "AA";
		return harfNot;
	}

	public static float ortalama_hesapla(ArrayList<Object>notlar, ArrayList<Object> krediler)
	{
		float ortalama = 0;
		int not_toplam=0, kredi_toplam=0;
		for(int i = 0 ; i < notlar.size() ; i++)
		{
			not_toplam = not_toplam + Integer.parseInt(notlar.get(i)+"") * Integer.parseInt(krediler.get(i)+"");
			kredi_toplam = kredi_toplam + Integer.parseInt(krediler.get(i)+"");
		}
		ortalama = not_toplam / (float) kredi_toplam;
		return ortalama;
	}
}
