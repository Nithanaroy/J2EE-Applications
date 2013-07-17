package com.dcandan.gui;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;

import com.dcandan.controller.orm_proses;

public class login_main 
{
	JFrame frame = new JFrame("Login Form");
	JLabel user_name, password;
	JTextField userName, parola;
	JButton onayla,kayýt_ol;

	listener_class listener = new listener_class();
	orm_proses database_proses = new orm_proses();

	public login_main()
	{
		user_name = new JLabel("UserName : ");
		password = new JLabel("Password : ");
		userName = new JTextField();
		parola = new JTextField();
		onayla = new JButton("Tamam");
		kayýt_ol = new JButton("Kayýt Ol");

		frame.setLayout(null);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		onayla.addActionListener(listener);
		kayýt_ol.addActionListener(listener);

		user_name.setBounds(10, 10, 70, 25);	userName.setBounds(90, 10, 200, 25);
		password.setBounds(10, 40, 70, 25);		parola.setBounds(90, 40, 200, 25);
		onayla.setBounds(90, 70, 95, 25);		kayýt_ol.setBounds(190, 70, 100, 25);

		frame.add(user_name);
		frame.add(userName);
		frame.add(password);
		frame.add(parola);
		frame.add(onayla);
		frame.add(kayýt_ol);

		frame.setBounds(450, 200, 350, 150);
		frame.setVisible(true);
	}
	class listener_class implements ActionListener
	{
		public void actionPerformed(ActionEvent e) {
			if (e.getSource() == onayla)
			{
				String user_name = userName.getText();
				String sifre = parola.getText();
				if (user_name.isEmpty() | sifre.isEmpty())
					JOptionPane.showMessageDialog(null, "Kullanýcý Adý veya Parolayý Boþ Býrakamazsýnýz.");
				else
				{
					if (database_proses.select(user_name, sifre))
					{
						JOptionPane.showMessageDialog(null, "Baþarýlý Þekilde Giriþ Yaptýnýz.");
						userName.setText("");
						parola.setText("");
					}
					else
						JOptionPane.showMessageDialog(null, "Kullanýcý Adý veya Þifreniz Yanlýþtýr.");
				}
			}
			if (e.getSource() == kayýt_ol)
			{
				String user_name = userName.getText();
				String sifre = parola.getText();
				if (user_name.isEmpty() | sifre.isEmpty())
					JOptionPane.showMessageDialog(null, "Kullanýcý Adý veya Parolayý Boþ Býrakamazsýnýz.");
				else
				{
					database_proses.insert(user_name, sifre);
					JOptionPane.showMessageDialog(null, 
							"Kaydýnýz Baþarýlý Þekilde Gerçekleþtirilmiþtir." +
									"\nKullanýcý Adý : "+user_name+"\nParola : "+sifre);
					userName.setText("");
					parola.setText("");
				}
			}
		}
	}

	public static void main(String[] args) 
	{
		new login_main();
	}
}
