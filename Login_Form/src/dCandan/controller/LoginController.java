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
		//Giri�te kullan�lacak olan formumuz olu�turuluyor.
		model.put("loginForm", loginForm);
		//Olu�turulan form burada modelimize ekleniyor ve ileride nuradan �ekilerek kullan�lacak.
		return "loginform";
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method = RequestMethod.POST)
	public String processForm(@Valid LoginForm loginForm, BindingResult result, Map model) 
	{
		loginForm = (LoginForm) model.get("loginForm");
		//modele ekli olan loginform'umuz burada J2EE mant�g�ndak� request, session mant�g� gibi elde ediliyor.
		String userName = loginForm.getUserName();
		String password = loginForm.getPassword();
		//J2EE'deki request.getParameter(""); gibi loginForm ile olu�tuulan nesnelerin de�erleri okunuyor. 
		/*if (result.hasErrors()) 
		{
			return "loginform";
		}*/
		
		if (!members.uyeMi(userName, password)) 
		{
			//e�erki giri� yap�lan userName ve password uyumlu de�ilse uye olmad�g� belirlenip giri�e izin verilmez.
			return "loginerror";
		}
		/*
		 * En son olarak loginForm ad�ndaki formumuzu modelimize tekrardan ekliyoruz.
		 * Form ile olu�turulan t�m nesneler g�ncel de�erleriyle birlikte modelimize tekrardan ekleniyor.
		 */
		model.put("loginForm", loginForm);
		return "loginsuccess";
	}
}