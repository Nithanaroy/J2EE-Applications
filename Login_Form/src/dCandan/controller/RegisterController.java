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
//Framework aracýlýðýyla yapýlan mapping iþleminde eriþilecek html sayfa belirleniyor
public class RegisterController {
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method = RequestMethod.GET)
	public String showForm(Map model) 
	{
		RegisterForm registerForm = new RegisterForm();
		/*
		 * Kayýtlanma yapacak olan kiþi ilk olarak bu blok aracýlýðýyla sorumlusu olduðu sýnýfa eriþir.
		 * Alt satýrda ise regisiterForm adýndaki form modelimize ekleniyor.Yine request, session mantýðý gibi.
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
		 * Kayýtlanan kullanýcýnýn verilerini okumak için 
		 * giriþ yapðtýgý registerForm nesnesi deðerleriyle birlikte modelden okunuyor.
		 */
		String name = registerForm.getName();
		String surname = registerForm.getSurname();
		String username = registerForm.getUserName();
		String password = registerForm.getPassword();
		/*
		 * registerForm ile birlikte okunan deðerler burada ayrýstýrýlarak anlamlý hale getiriliyor.
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
			 * Kayýtlanan kullanýcý boþ veya eksik veri girerse
			 * hata belirtmek amacýyla registererror sayfasýna yönlendiriliyor. 
			 */
			return "registererror";
		}
		else
		{
			/*
			 * registerFormadan okunan veriler members sýnýfýndaki bir hashTable'a kayýtlanýyor.
			 * Metotlarýn static olmasýnýn sebebi bu bloga geldiðinde yeni nesne üretilirse 
			 * hashtable'da yenileneceði için kayýtlý kullanýcýlar silinecek. Bu nedenle static
			 * metotlar kullanýldý.
			 */
			members.add(name, surname, username, password);
			//member.uyeler() metoduyla tüm uyeler goruntýulenebilir. 
			members.uyeler();
			
			LoginForm loginForm = new LoginForm();
			model.put("loginForm", loginForm);
			/*
			 * Sorunsuz þekilde kayýt olan kullanýcýnýn artýk giriþ yapmasý gerektiði için
			 * login sayfasýna yönlendiriliyor.oluþturuulan loginform'umuz ise modele ekleniyor. 
			 * Çünkü model aracýlýðýyla form nesnelerini kullanabiliyoruz. 
			 */
		}
		return "loginform";
	}
}