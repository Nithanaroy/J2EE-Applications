package dCandan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.validation.BindingResult;

import dCandan.form.LoginForm;
import dCandan.form.members;

import java.util.Map;
import javax.validation.Valid;

@Controller
@RequestMapping("loginform.html")
public class LoginController 
{
	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.GET)
	public String showForm(@SuppressWarnings("rawtypes") Map model) 
	{
		LoginForm loginForm = new LoginForm();
		//Giriþte kullanýlacak olan formumuz oluþturuluyor.
		model.put("loginForm", loginForm);
		//Oluþturulan form burada modelimize ekleniyor ve ileride nuradan çekilerek kullanýlacak.
		return "loginform";
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method = RequestMethod.POST)
	public String processForm(@Valid LoginForm loginForm, BindingResult result, Map model) 
	{
		loginForm = (LoginForm) model.get("loginForm");
		//modele ekli olan loginform'umuz burada J2EE mantýgýndaký request, session mantýgý gibi elde ediliyor.
		String userName = loginForm.getUserName();
		String password = loginForm.getPassword();
		//J2EE'deki request.getParameter(""); gibi loginForm ile oluþtuulan nesnelerin deðerleri okunuyor. 
		/*if (result.hasErrors()) 
		{
			return "loginform";
		}*/
		
		if (!members.uyeMi(userName, password)) 
		{
			//eðerki giriþ yapýlan userName ve password uyumlu deðilse uye olmadýgý belirlenip giriþe izin verilmez.
			return "loginerror";
		}
		/*
		 * En son olarak loginForm adýndaki formumuzu modelimize tekrardan ekliyoruz.
		 * Form ile oluþturulan tüm nesneler güncel deðerleriyle birlikte modelimize tekrardan ekleniyor.
		 */
		model.put("loginForm", loginForm);
		return "loginsuccess";
	}
}