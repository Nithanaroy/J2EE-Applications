package dCandan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.validation.BindingResult;

import dCandan.form.LoginForm;
import dCandan.form.RegisterForm;
import dCandan.form.members;

import java.util.Map;

import javax.validation.Valid;

@Controller
@RequestMapping("registerform.html") 
//Framework arac�l���yla yap�lan mapping i�leminde eri�ilecek html sayfa belirleniyor
public class RegisterController {
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method = RequestMethod.GET)
	public String showForm(Map model) 
	{
		RegisterForm registerForm = new RegisterForm();
		/*
		 * Kay�tlanma yapacak olan ki�i ilk olarak bu blok arac�l���yla sorumlusu oldu�u s�n�fa eri�ir.
		 * Alt sat�rda ise regisiterForm ad�ndaki form modelimize ekleniyor.Yine request, session mant��� gibi.
		 */
		model.put("registerForm", registerForm);
		return "registerform";
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method = RequestMethod.POST)
	public String processForm(@Valid RegisterForm registerForm, BindingResult result, Map model)
	{
		registerForm = (RegisterForm) model.get("registerForm");
		/*
		 * Kay�tlanan kullan�c�n�n verilerini okumak i�in 
		 * giri� yap�t�g� registerForm nesnesi de�erleriyle birlikte modelden okunuyor.
		 */
		String name = registerForm.getName();
		String surname = registerForm.getSurname();
		String username = registerForm.getUserName();
		String password = registerForm.getPassword();
		/*
		 * registerForm ile birlikte okunan de�erler burada ayr�st�r�larak anlaml� hale getiriliyor.
		 */
		if (result.hasErrors())
		{
			return "registerform";
		}
		
		model.put("registerForm", registerForm);
		
		if (name.trim().equals("") 
				| surname.trim().equals("") 
				| username.trim().equals("") 
				| password.trim().equals(""))
		{
			/*
			 * Kay�tlanan kullan�c� bo� veya eksik veri girerse
			 * hata belirtmek amac�yla registererror sayfas�na y�nlendiriliyor. 
			 */
			return "registererror";
		}
		else
		{
			/*
			 * registerFormadan okunan veriler members s�n�f�ndaki bir hashTable'a kay�tlan�yor.
			 * Metotlar�n static olmas�n�n sebebi bu bloga geldi�inde yeni nesne �retilirse 
			 * hashtable'da yenilenece�i i�in kay�tl� kullan�c�lar silinecek. Bu nedenle static
			 * metotlar kullan�ld�.
			 */
			members.add(name, surname, username, password);
			//member.uyeler() metoduyla t�m uyeler gorunt�ulenebilir. 
			members.uyeler();
			
			LoginForm loginForm = new LoginForm();
			model.put("loginForm", loginForm);
			/*
			 * Sorunsuz �ekilde kay�t olan kullan�c�n�n art�k giri� yapmas� gerekti�i i�in
			 * login sayfas�na y�nlendiriliyor.olu�turuulan loginform'umuz ise modele ekleniyor. 
			 * ��nk� model arac�l���yla form nesnelerini kullanabiliyoruz. 
			 */
		}
		return "loginform";
	}
}