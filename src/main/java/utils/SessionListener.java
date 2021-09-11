package utils;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionContext;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import model.Cart;
import model.CartDetail;

@WebListener
public class SessionListener implements HttpSessionListener {
//	List<>
	@Override
	public void sessionCreated(HttpSessionEvent se) {
//		int cart_id = Integer.parseInt(new SimpleDateFormat("hhmmss").format(new Date()));
//		Cart cart = new Cart();
//		cart.setId(cart_id);
		List<CartDetail> cartDetails = new ArrayList<>();
		se.getSession().setAttribute("cartDetails", cartDetails);
		
		System.out.println("SESSION: đã có cart");
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		System.out.println("SESSION: destroy");
	}
	
}
