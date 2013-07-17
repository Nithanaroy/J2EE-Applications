package proses;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class database_proses 
{

	/*private static String driver = "com.mysql.jdbc.Driver";
	private static String URL = "jdbc:mysql://localhost:3306/otomasyon?useUnicode=true&characterEncoding=ISO-8859-1";
	private static String username = "ismail";
	private static String password = "LanIsmailHaklimisin?YavrumBagdatlimisin?";
*/

	private static String driver = "com.mysql.jdbc.Driver";
	private static String URL = "jdbc:mysql://localhost/otomasyon?useUnicode=true&characterEncoding=ISO-8859-1";
	private static String username = "root";
	private static String password = "";
	 
	static Connection connection;
	static Statement statement;
	static ResultSet result;

	private static String ID;

	public static String getID() {
		return ID;
	}

	public static void setID(String id) {
		ID = id;
	}

	public static boolean Connect()
	{
		try
		{
			Class.forName(driver);
			connection = DriverManager.getConnection(URL,username,password);
			statement = connection.createStatement();
		}
		catch (ClassNotFoundException e) 
		{
			return false;
		}
		catch (SQLException e) 
		{
			return false;
		}
		return true;
	}

	public static int user_sorgula(String userID, String password)
	{
		if(Connect())
		{
			String sorgu = "select * from tUser";
			try 
			{
				result = statement.executeQuery(sorgu);
				while(result.next())
				{
					if ((result.getString(1).equals(userID)) && (result.getString(2).equals(password)))
					{
						int yetkiID = result.getInt(3);
						connection.close();
						statement.close();
						result.close();
						return yetkiID;
					}
				}
			}
			catch (SQLException e) 
			{
				System.out.println("Sorgulama i�lemi yap�lamad�.\nSorun : "+e.getMessage()+" Hata Kodu : "+e.getErrorCode());
			}
		}
		return -1;
	}

	public static String isim_getir(String userID, String tableName)
	{
		if(Connect())
		{
			String sorgu = "select * from "+tableName;
			try 
			{
				result = statement.executeQuery(sorgu);
				while(result.next())
				{
					if(result.getString(1).equals(userID))
					{
						String isim = result.getString(2)+" "+result.getString(3); 
						connection.close();
						statement.close();
						result.close();
						return isim;
					}
				}
			}
			catch (SQLException e) 
			{
				System.out.println("Sorun : "+e.getMessage());
				return null;
			}
		}
		return null;
	}

	public static boolean memur_ekle(String memurID, String ad, String soyad, String telefon, String password)
	{
		if(Connect())
		{
			String sorgu = "insert into tMemur(memurID,ad,soyad,telefon) values('"+memurID+"','"+ad+"','"+soyad+"','"+telefon+"')";
			try 
			{
				statement.executeUpdate(sorgu);
				connection.close();
				statement.close();
				user_ekle(memurID, password, 2);
			}
			catch (SQLException e) 
			{
				System.out.println("Sorun :"+e.getMessage());
				return false;
			}
		}
		return true;
	}

	public static boolean hoca_ekle(String hocaID, String ad, String soyad, String telefon, int unvanID, String password, int idariGorevID)
	{
		if(Connect())
		{
			String sorgu = "insert into tHoca(hocaID, ad, soyad, telefon," +
					"unvanID,idariGorevID) values('"+
					hocaID+"','"+ad+"','"+soyad+"','"+
					telefon+"',"+unvanID+","+idariGorevID+")";
			try 
			{
				statement.executeUpdate(sorgu);
				connection.close();
				statement.close();
				user_ekle(hocaID, password, 1);
			}
			catch (SQLException e) 
			{
				System.out.println("Sorun : "+e.getMessage());
				return false;
			}
		}
		return true;
	}

	public static boolean ogrenci_ekle(
			String ogrenciID, String tc, String ad, String soyad, String ana_ad, String baba_ad, 
			String dogum_yeri, String dogum_tarihi, String adres, String telefon, int fakulteID, 
			int bolumID, String password
			)
	{
		if(Connect())
		{
			SimpleDateFormat format = new SimpleDateFormat("dd.MM.yyyy");
			String kayıt_tarihi = format.format(new java.util.Date());
			String sorgu = "insert into tOgrenci(ogrenciID, tckimlik, ad, soyad," +
					"anaAd, babaAd, dogumyer, dogumtarih," +
					"adres, telefon, kayitTarih, fakulteID, bolumID) values(" +
					"'" +ogrenciID+"','"+tc+"','"+ad+"','"+soyad+"','"+
					ana_ad+"','"+baba_ad+"','"+dogum_yeri+"','"+dogum_tarihi+"','"+
					adres+"','"+telefon+"','"+kayıt_tarihi+"',"+fakulteID+","+bolumID+")";
			try 
			{
				statement.executeUpdate(sorgu);
				connection.close();
				statement.close();
				user_ekle(ogrenciID, password, 0);
			}
			catch (SQLException e) 
			{
				System.out.println("Sorun : "+e.getMessage());
				return false;
			}
			return true;
		}
		return false;
	}
	public static boolean on_kayit(String tc, String ad, String soyad, String ana_ad, String baba_ad, String dogum_yeri, 
			String dogum_tarihi, String adres, String telefon, int bolumID, int puan)
	{
		if (Connect())
		{
			SimpleDateFormat format = new SimpleDateFormat("dd.MM.yyyy");
			String kayıt_tarihi = format.format(new java.util.Date());
			String sorgu = "insert into on_kayit_ogrenci(tc, ad, soyad," +
					"ana_ad, baba_ad, dogum_tarih, dogum_yer," +
					"cep_tel, adres, bolumID, lisans_notu, kayit_tarihi) values(" +
					"'"+tc+"','"+ad+"','"+soyad+"','"+ana_ad+"','"+baba_ad+"','"+
					dogum_tarihi+"','"+dogum_yeri+"','"+telefon+"','"+adres+"',"+
					bolumID+","+puan+",'"+kayıt_tarihi+"')";
			try 
			{
				statement.executeUpdate(sorgu);
				connection.close();
				statement.close();
			}
			catch (SQLException e) 
			{
				System.out.println("Ön Kayıt Yapılamadı.\nSorun : "+e.getMessage());
				return false;
			}
			return true;
		}
		return false;
	}

	public static boolean user_ekle(String userID, String password, int yetkiID)
	{
		if(Connect())
		{
			String sorgu = "insert into tUser(userID,password,yetkiID) values('"+userID+"','"+password+"',"+yetkiID+")";
			try 
			{
				statement.executeUpdate(sorgu);
				connection.close();
				statement.close();
			}
			catch (SQLException e) 
			{
				System.out.println(e.getMessage());
				return false;
			}
			return true;
		}
		return false;
	}

	public static ArrayList<Object> veri_getir(String sorgu)
	{
		if(Connect())
		{
			ArrayList<Object> veriler = new ArrayList<>();
			try 
			{
				result = statement.executeQuery(sorgu);
				while(result.next())
				{
					veriler.add(result.getObject(1));
				}
				connection.close();
				statement.close();
				result.close();
			}
			catch (SQLException e) 
			{
				System.out.println(e.getMessage());
				return null;
			}
			return veriler;
		}
		return null;
	}

	public static int bolumun_ogrenci_sayisi(int bolumID)
	{
		if(Connect())
		{
			int ogrenci_sayisi = 1;
			String sorgu = "select * from tOgrenci where bolumID="+bolumID;
			try 
			{
				result = statement.executeQuery(sorgu);
				while(result.next())
				{
					ogrenci_sayisi++;
				}
				connection.close();
				statement.close();
				result.close();
			}
			catch (SQLException e) 
			{
				System.out.println("Uye sayisi sorgulama yap�lamad�.\nSorun : "+e.getMessage());
				return 0;
			}
			return  ogrenci_sayisi;
		}
		return 0;
	}

	public static String Ders_kod(int bolumID)
	{
		if(Connect())
		{
			String sorgu = "select * from tBolum";
			try 
			{
				result = statement.executeQuery(sorgu);
				while(result.next())
				{
					if(result.getInt(1) == bolumID)
					{
						String dersKod = result.getString(2).substring(0,3);
						connection.close();
						statement.close();
						result.close();
						return dersKod;
					}
				}
			}
			catch (SQLException e) 
			{
				System.out.println("Ders kod sorgulama yapılamadı.\nSorun : "+e.getMessage());
				return "";
			}
		}
		return "";
	}

	public static boolean ders_ekle(String dersKod, String dersAd, int teorik, int uygulama, int kredi, String yariyil, int bolumID, int fakulteID)
	{
		if(Connect())
		{
			String sorgu = "insert into tDers(dersKod,dersAd,teorik,uygulama,kredi,yariyil,bolumID,fakulteID)"+
					" values('"+dersKod+"','"+dersAd+"',"+teorik+","+uygulama+","+kredi+",'"+yariyil+"',"+bolumID+","+fakulteID+")";
			try {
				statement.executeUpdate(sorgu);
				connection.close();
				statement.close();
			} 
			catch (SQLException e) 
			{
				System.out.println("Hata :"+e.getMessage());
				return false;
			}
			return true;
		}
		return false;
	}
	//burada g�ncelleme yap�ld�
	public static boolean ders_sil(String dersKod)
	{
		if(Connect())
		{
			String sorgu = "delete from tDers where dersKod='"+dersKod+"'";
			try 
			{
				statement.executeUpdate(sorgu);
				sorgu = "delete from tdersHocasi where dersKod='"+dersKod+"'";
				statement.executeUpdate(sorgu);
				connection.close();
				statement.close();
			}
			catch (Exception e) 
			{
				System.out.println("Ders Silme Yapilamadi.\nSorun : "+e.getMessage());
				return false;
			}
			return true;
		}
		return false;
	}

	public static boolean ders_guncelle(String dersKod, String dersAd, int teorik, int uygulama, int kredi, String yariyil, int bolumID, int fakulteID)
	{
		if(Connect())
		{
			String sorgu = null;

			if(dersAd != null)
				sorgu = "update tDers set dersAd='"+dersAd+"',teorik='"+teorik+"',uygulama='"+uygulama+"',kredi='"+kredi+"',yariyil='"+yariyil+"',bolumID='"+bolumID+"',fakulteID='"+fakulteID+"' where dersKod='"+dersKod+"'";
			else
				sorgu = "update tDers set teorik='"+teorik+"',uygulama='"+uygulama+"',kredi='"+kredi+"',yariyil='"+yariyil+"',bolumID='"+bolumID+"',fakulteID='"+fakulteID+"' where dersKod='"+dersKod+"'";
			try 
			{
				statement.executeUpdate(sorgu);
				connection.close();
				statement.close();
			}
			catch (Exception e) 
			{
				return false;
			}
			return true;
		}
		return false;
	}

	public static int bolumun_ders_sayisi(int bolumID)
	{
		if(Connect())
		{
			int ders_sayisi = 1;
			String sorgu = "select * from tDers where bolumID="+bolumID;
			try 
			{
				result = statement.executeQuery(sorgu);
				while(result.next())
				{
					ders_sayisi++;
				}
				connection.close();
				statement.close();
				result.close();
			}
			catch (SQLException e) 
			{
				System.out.println("Ders sayisi sorgulanamad�.\nSorun : "+e.getMessage());
				return 0;
			}
			return ders_sayisi;
		}
		return 0;
	}
	public static boolean not_ekle(String ogrenciNo, String dersKod, int vize, int _final, int butunleme, int gecmeNotu, String harfNotu, String yil, String yariyil, String gecmeDurumu)
	{//not girildi�inde insert de�il u�date yap�lacak.
		if(Connect())
		{
			String sorgu="";
			//Ders Ekleme - 000
			if((vize == -1) && (_final == -1) && (butunleme == -1))
			{
				sorgu = "insert into tNot(ogrenciID,dersKod,yil,yariyil) values('"+ogrenciNo+"','"+dersKod+"','"+yil+"','"+yariyil+"')";
				try 
				{
					statement.executeUpdate(sorgu);
					connection.close();
					statement.close();
				}
				catch (SQLException e) 
				{
					System.out.println(e.getMessage());
					return false;
				}
				return true;
			}
			//001
			else if((vize == -1) && (_final == -1) && (butunleme != -1))
				sorgu = "update tNot set butunleme="+butunleme+",HBN="+gecmeNotu+",harfNotu='"+harfNotu+"',gecmeDurumu='"+gecmeDurumu+"' where ogrenciID='"+ogrenciNo+"' and dersKod='"+dersKod+"'";
			//010
			else if((vize == -1) && (_final != -1) && (butunleme == -1))
				sorgu = "update tNot set final="+_final+",HBN="+gecmeNotu+",harfNotu='"+harfNotu+"',gecmeDurumu='"+gecmeDurumu+"' where ogrenciID='"+ogrenciNo+"' and dersKod='"+dersKod+"'";
			//011
			else if((vize == -1) && (_final != -1) && (butunleme != -1))
				sorgu = "update tNot set final="+_final+",butunleme="+butunleme+",HBN="+gecmeNotu+",harfNotu='"+harfNotu+"',gecmeDurumu='"+gecmeDurumu+"' where ogrenciID='"+ogrenciNo+"' and dersKod='"+dersKod+"'";
			//100
			else if((vize != -1) && (_final == -1) && (butunleme == -1))
				sorgu = "update tNot set vize="+vize+" where ogrenciID='"+ogrenciNo+"' and dersKod='"+dersKod+"'";
			//101
			else if((vize != -1) && (_final == -1) && (butunleme != -1))
				sorgu = "update tNot set vize="+vize+",butunleme="+butunleme+",HBN="+gecmeNotu+",harfNotu='"+harfNotu+"',gecmeDurumu='"+gecmeDurumu+"' where ogrenciID='"+ogrenciNo+"' and dersKod='"+dersKod+"'";
			//110
			else if((vize != -1) && (_final != -1) && (butunleme == -1))
				sorgu = "update tNot set vize="+vize+",final="+_final+",HBN="+gecmeNotu+",harfNotu='"+harfNotu+"',gecmeDurumu='"+gecmeDurumu+"' where ogrenciID='"+ogrenciNo+"' and dersKod='"+dersKod+"'";
			//111
			else if((vize != -1) && (_final != -1) && (butunleme != -1))
				sorgu = "update tNot set vize="+vize+",final="+_final+",butunleme="+butunleme+",HBN="+gecmeNotu+",harfNotu='"+harfNotu+"',gecmeDurumu='"+gecmeDurumu+"' where ogrenciID='"+ogrenciNo+"' and dersKod='"+dersKod+"'";
			try
			{
				statement.executeUpdate(sorgu);
				connection.close();
				statement.close();
			}
			catch (SQLException e) 
			{
				System.out.println("Not G�ncellenemedi.\nSorun : "+e.getMessage());
				return false;
			}
			return true;
		}
		return false;
	}

	public static boolean not_sil(String vize, String _final, String butunleme, String dersKod, String ogrenciID)
	{
		if(Connect())
		{
			String sorgu = "";
			//001
			if ((vize == null) && (_final == null) && (butunleme != null))
				sorgu = "update tNot set butunleme="+null+",HBN="+null+
				",harfNotu="+null+",gecmeDurumu="+null+
				" where ogrenciID='"+ogrenciID+"' and dersKod='"+dersKod+"'";
			//010
			if ((vize == null) && (_final != null) && (butunleme == null))
				sorgu = "update tNot set final="+null+",HBN="+null+
				",harfNotu="+null+",gecmeDurumu="+null+
				" where ogrenciID='"+ogrenciID+"' and dersKod='"+dersKod+"'";
			//011
			if ((vize == null) && (_final != null) && (butunleme != null))
				sorgu = "update tNot set butunleme="+null+",final="+null+
				",HBN="+null+",harfNotu="+null+",gecmeDurumu="+null+
				" where ogrenciID='"+ogrenciID+"' and dersKod='"+dersKod+"'";
			//100
			if ((vize != null) && (_final == null) && (butunleme == null))
				sorgu = "update tNot set vize="+null+" where ogrenciID='"+ogrenciID+
				"' and dersKod='"+dersKod+"'";
			//101
			if ((vize != null) && (_final == null) && (butunleme != null))
				sorgu = "update tNot set vize="+null+",butunleme="+null+
				",HBN="+null+",harfNotu="+null+",gecmeDurumu="+null+
				" where ogrenciID='"+ogrenciID+"' and dersKod='"+dersKod+"'";
			//110
			if ((vize != null) && (_final != null) && (butunleme == null))
				sorgu = "update tNot set vize="+null+",final="+null+",HBN="+null+
				",harfNotu="+null+",gecmeDurumu="+null+
				" where ogrenciID='"+ogrenciID+"' and dersKod='"+dersKod+"'";
			//111
			if ((vize != null) && (_final != null) && (butunleme != null))
				sorgu = "update tNot set vize="+null+",final="+null+",butunleme="+null+
				",HBN="+null+",harfNotu="+null+",gecmeDurumu="+null+
				" where ogrenciID='"+ogrenciID+"' and dersKod='"+dersKod+"'";
			try 
			{
				statement.executeUpdate(sorgu);
				statement.close();
				connection.close();
			}
			catch (Exception e) 
			{
				System.out.println("Not Silme Yap�lamad�.\nSorun : "+e.getMessage());
				return false;
			}
			return true;
		}
		return false;
	}

	public static boolean hocaya_ders_ekle(String hocaID, String dersKod, String yil, String yariyil)
	{
		if(Connect())
		{
			String sorgu = "insert into tdersHocasi(hocaID,dersKod,yil,yariyil) values('"+hocaID+"','"+dersKod+"','"+yil+"','"+yariyil+"')";
			try 
			{
				statement.executeUpdate(sorgu);
				statement.close();
				connection.close();
			}
			catch (SQLException e) 
			{
				System.out.println("Hocaya ders eklenemedi.\nSorun : "+e.getMessage());
				return false;
			}
			return true;
		}
		return false;
	}
	//bu yeni bir metod
	public static boolean hoca_sil(String hocaID)
	{
		if (Connect())
		{
			String sorgu = "delete from tHoca where hocaID='"+hocaID+"'";

			try 
			{
				//	Hoca tablosundan hocay� sil.
				statement.executeUpdate(sorgu);
				//	Ders Hocas� tablosoundan hocay� sil
				sorgu = "delete from tdersHocasi where hocaID='"+hocaID+"'";
				statement.executeUpdate(sorgu);
				//	User tablosundanda hocay� sil
				sorgu = "delete from tUser where userID='"+hocaID+"'";
				statement.executeUpdate(sorgu);
				statement.close();
				connection.close();
			}
			catch (SQLException e) 
			{
				System.out.println("Hoca Silinemiyor.\nSorun : "+e.getMessage());
				return false;
			}
			return true;
		}
		return false;
	}
	// bu yeni bir metod
	public static boolean ogrenci_sil(String ogrenciID)
	{
		if (Connect())
		{
			String sorgu = "delete from tOgrenci where ogrenciID='"+ogrenciID+"'";

			try 
			{
				//	Hoca tablosundan hocay� sil.
				statement.executeUpdate(sorgu);
				//	Ders Hocas� tablosoundan hocay� sil
				sorgu = "delete from tnot where ogrenciID='"+ogrenciID+"'";
				statement.executeUpdate(sorgu);
				//	User tablosundanda ��renciyi siliyoruz
				sorgu = "delete from tUser where userID='"+ogrenciID+"'";
				statement.executeUpdate(sorgu);
				statement.close();
				connection.close();
			}
			catch (SQLException e) 
			{
				System.out.println("��renci Silinemiyor.\nSorun : "+e.getMessage());
				return false;
			}
			return true;
		}
		return false;
	}

	public static boolean memur_sil(String memurID)
	{
		if (Connect())
		{
			String sorgu = "delete from tMemur where memurID='"+memurID+"'";

			try 
			{
				statement.executeUpdate(sorgu);
				sorgu = "delete from tUser where userID='"+memurID+"'";
				statement.executeUpdate(sorgu);
				statement.close();
				connection.close();
			}
			catch (SQLException e) 
			{
				System.out.println("Memur Silinemiyor.\nSorun : "+e.getMessage());
				return false;
			}
			return true;
		}
		return false;
	}

	public static boolean dersten_hoca_sil (String hocaID, String dersKod)
	{
		if (Connect())
		{
			String sorgu = "delete from tdersHocasi where dersKod='"+dersKod+"' and hocaID='"+hocaID+"'";
			try 
			{
				statement.executeUpdate(sorgu);
				statement.close();
				connection.close();
			}
			catch (SQLException e) 
			{
				System.out.println("Dersten Hoca silinemedi : \nSorun : "+e.getMessage());
				return false;
			}
			return true;
		}
		return false;
	}

	public static boolean dersten_ogrenci_sil (String ogrenciID, String dersKod)
	{
		if (Connect())
		{
			String sorgu = "delete from tNot where dersKod='"+dersKod+"' and ogrenciID='"+ogrenciID+"'";
			try 
			{
				statement.executeUpdate(sorgu);
				statement.close();
				connection.close();
			}
			catch (SQLException e) 
			{
				System.out.println("Dersten Hoca silinemedi : \nSorun : "+e.getMessage());
				return false;
			}
			return true;
		}
		return false;
	}

	public static int durum_say(String durum, String dersKod)
	{
		String sorgu = "";
		int kisi_sayisi=0;
		if (Connect())
		{
			if (durum.equals("Gecenler"))
			{
				sorgu = "select gecmeDurumu from tNot where (gecmeDurumu='Sartli Gecti' or gecmeDurumu='Gecti') and (dersKod='"+dersKod+"')";
				try 
				{
					result = statement.executeQuery(sorgu);
					while(result.next())
					{
						kisi_sayisi++;
					}
					return kisi_sayisi;
				}
				catch (SQLException e) 
				{
					System.out.println("Gecen Sayisi Sorgulanamadi.\nSorun : "+e.getMessage());
				}
			}
			else if (durum.equals("Kalanlar"))
			{
				sorgu = "select gecmeDurumu from tNot where gecmeDurumu='Kaldi' and dersKod='"+dersKod+"'";
				try 
				{
					result = statement.executeQuery(sorgu);
					while(result.next())
					{
						kisi_sayisi++;
					}
					return kisi_sayisi;
				}
				catch (SQLException e) 
				{
					System.out.println("Kalan Sayisi Sorgulanamadi.\nSorun : "+e.getMessage());
				}
			}
		}
		return kisi_sayisi;
	}

	public static ArrayList<String> ogrenci_liste = new ArrayList<String>();

	public static void veriler(ArrayList<String>liste, String veri)
	{
		liste.add(veri);
	}
}