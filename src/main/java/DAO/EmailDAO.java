package DAO;
import java.io.UnsupportedEncodingException;
import java.util.Date;
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
import javax.mail.internet.MimeUtility;

public class EmailDAO {
    public static void sendEmail(String host, String port,
                                 final String userName, final String password, String toAddress,
                                 String subject, String message) throws AddressException,
            MessagingException, UnsupportedEncodingException {

        // sets SMTP server properties
        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.setProperty("mail.smtp.allow8bitmime", "true");
        properties.setProperty("mail.smtps.allow8bitmime", "true");
        properties.put("mail.smtp.ssl.protocols", "TLSv1.2");

        // creates a new session with an authenticator
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(userName, password);
            }
        };

        Session session = Session.getInstance(properties, auth);

        // creates a new e-mail message
        Message msg = new MimeMessage(session);

        //from
        msg.setFrom(new InternetAddress(userName));

        //to
        InternetAddress[] toAddresses = { new InternetAddress(toAddress) };
        msg.setRecipients(Message.RecipientType.TO, toAddresses);

        // set date of sending
        msg.setSentDate(new Date());

        //set subject for mail;
        String fullSubject = MimeUtility.encodeText(subject, "UTF-8", null);
        msg.setSubject(fullSubject);

        //set content for mail
        msg.setContent(message,"text/html; charset=utf-8");

        // sends the e-mail
        Transport.send(msg);
    }
}
