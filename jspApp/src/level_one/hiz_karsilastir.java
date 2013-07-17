package level_one;

public class hiz_karsilastir 
{
	private static final int hız_sınırı = 100;
	
	public static boolean hiz_sınırlıMı(int arac_hızı)
	{
		return (arac_hızı <= hız_sınırı) ? true : false;
	}
}
