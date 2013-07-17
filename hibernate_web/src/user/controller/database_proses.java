package user.controller;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.cfg.Configuration;
import org.hibernate.SessionFactory;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import user.model.user_model;

public class database_proses {
	SessionFactory s_factory;

	public static void main(String [] args){
		new database_proses();
	}

	public void hibernate_settings()
	{
		Configuration conf = new Configuration();
		conf.configure();

		ServiceRegistry sr = new ServiceRegistryBuilder()
		.applySettings(conf.getProperties()).buildServiceRegistry();
		s_factory = conf.buildSessionFactory(sr);
	}

	public void insert(String user_model_name, String password){
		hibernate_settings();

		user_model kullanici = new user_model();
		kullanici.setUsername(user_model_name);
		kullanici.setPassword(password);

		Session session = s_factory.openSession();
		session.beginTransaction();

		session.save(kullanici);
		session.getTransaction().commit();
		session.close();
	}

	@SuppressWarnings("rawtypes")
	public boolean select(String user_model_name, String password){
		hibernate_settings();

		Session session = s_factory.openSession();
		session.beginTransaction();

		Query query = session.createQuery("from user");
		List result = query.list();
		Iterator iterator = result.iterator();

		while(iterator.hasNext()){
			user_model kullanici = (user_model)iterator.next();
			String user_modelName = kullanici.getUsername();
			String parola = kullanici.getPassword();
			if ((user_modelName.equals(user_model_name)) && (parola.equals(password)))
				return true;
		}
		return false;
	}
}
