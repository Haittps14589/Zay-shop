package utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.persistence.EntityManager;

import dao.CallProcedure;
import dao.CartDAO;
import dao.ProductDAO;
import model.Cart;
import model.CartDetail;
import model.Product;
import model.ReportProduct;
import model.User;

public class tesst {
	
	public static void main(String[] args) throws AddressException, MessagingException {
		Product p = new ProductDAO().selectById("sp01");
		CartDetail c = new CartDetail(1, p, 0);
		System.out.println(c.toString());
	}
	
}
