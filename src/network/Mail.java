/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package network;

/**
 *
 * @author java3
 */
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.annotation.WebServlet;

/**
 *
 * @author java4
 */
@WebServlet("/Mail")
public class Mail {

	public static boolean secretMail(String msg, String name, String email) {
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");

		Session session = Session.getDefaultInstance(props,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {

						return new PasswordAuthentication(
								"biradar.sham318@gmail.com", "biradarsham@@123");
					}
				});

		System.out.println("Message   " + msg);
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(name));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(email));
			message.setSubject("CLOUD SERVER");
			message.setText(" Key : " + msg);

			Transport.send(message);

			System.out.println("Done");
			return true;

		} catch (MessagingException e) {
			System.out.println(e);
			e.printStackTrace();
			return false;
			// throw new RuntimeException(e);
		}
	}

}
