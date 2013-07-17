package proses;

public class ogrenci_no_hesapla 
{
	public static String ogrenci_no(String yil, int fakulte_id, int bolum_id, int ogrenci_sayisi)
	{
		String ogrenciID;

		if(fakulte_id < 10)
		{
			if(bolum_id < 10)
			{
				if(ogrenci_sayisi < 10)
					ogrenciID = yil+"0"+fakulte_id+"0"+bolum_id+"00"+ogrenci_sayisi;
				else if(ogrenci_sayisi >= 10 && ogrenci_sayisi < 100)
					ogrenciID = yil+"0"+fakulte_id+"0"+bolum_id+"0"+ogrenci_sayisi;
				else
					ogrenciID = yil+"0"+fakulte_id+"0"+bolum_id+""+ogrenci_sayisi;
			}
			else
			{
				if(ogrenci_sayisi < 10)
					ogrenciID = yil+"0"+fakulte_id+""+bolum_id+"00"+ogrenci_sayisi;
				else if(ogrenci_sayisi >= 10 && ogrenci_sayisi < 100)
					ogrenciID = yil+"0"+fakulte_id+""+bolum_id+"0"+ogrenci_sayisi;
				else
					ogrenciID = yil+"0"+fakulte_id+""+bolum_id+""+ogrenci_sayisi;
			}
		}
		else
		{
			if(bolum_id < 10)
			{
				if(ogrenci_sayisi  < 10)
					ogrenciID = yil+"0"+fakulte_id+"0"+bolum_id+"00"+ogrenci_sayisi ;
				else if(ogrenci_sayisi  >= 10 && ogrenci_sayisi  < 100)
					ogrenciID = yil+"0"+fakulte_id+"0"+bolum_id+"0"+ogrenci_sayisi ;
				else
					ogrenciID = yil+"0"+fakulte_id+"0"+bolum_id+""+ogrenci_sayisi ;
			}
			else
			{
				if(ogrenci_sayisi  < 10)
					ogrenciID = yil+"0"+fakulte_id+""+bolum_id+"00"+ogrenci_sayisi ;
				else if(ogrenci_sayisi  >= 10 && ogrenci_sayisi  < 100)
					ogrenciID = yil+"0"+fakulte_id+""+bolum_id+"0"+ogrenci_sayisi ;
				else
					ogrenciID = yil+"0"+fakulte_id+""+bolum_id+""+ogrenci_sayisi ;
			}
		}
		return ogrenciID;
	}

}
