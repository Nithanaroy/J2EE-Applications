package com.dcandan.controller;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import com.dcandan.model.user;

public class orm_proses {
	SessionFactory s_factory;
	public static void main(String [] args){
		new orm_proses();
	}

	public orm_proses() 
	{}

	public void hibernate_settings()
	{
		Configuration conf = new Configuration();
		conf.configure();

		ServiceRegistry sr = new ServiceRegistryBuilder()
		.applySettings(conf.getProperties()).buildServiceRegistry();
		s_factory = conf.buildSessionFactory(sr);
	}

	public void insert(String user_name, String password){
		hibernate_settings();

		user kullanici = new user();
		kullanici.setUserName(user_name);
		kullanici.setPassword(password);

		Session session = s_factory.openSession();
		session.beginTransaction();

		session.save(kullanici);
		session.getTransaction().commit();
		session.close();
	}

	@SuppressWarnings("rawtypes")
	public boolean select(String user_name, String password){
		hibernate_settings();

		Session session = s_factory.openSession();
		session.beginTransaction();

		Query query = session.createQuery("from user");
		List result = query.list();
		Iterator iterator = result.iterator();

		while(iterator.hasNext()){
			user kullanici = (user)iterator.next();
			String userName = kullanici.getUserName();
			String parola = kullanici.getPassword();
			if ((userName.equals(user_name)) && (parola.equals(password)))
				return true;
		}
		return false;
	}
}
