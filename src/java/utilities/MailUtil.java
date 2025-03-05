/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utilities;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.Multipart;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeBodyPart;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.internet.MimeMultipart;
import java.util.Properties;

/**
 *
 * @author zeryus
 */
public class MailUtil {
    private final String username;
    private final String password;
    private final Properties props;
    
    public MailUtil(String smtpHost, String smtpPort, String username, String password) {
        this.username = username;
        this.password = password;
        
        props = new Properties();
        props.put("mail.smtp.host", smtpHost);
        props.put("mail.smtp.port", smtpPort);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true"); // Enable TLS
        props.put("mail.smtp.auth", "true");
	
		

	
    }
    
    public void sendEmail(String to, String subject, String messageBody) throws MessagingException {
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(username));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
        message.setSubject(subject);
        
        MimeBodyPart  bodyPart = new MimeBodyPart();
        Multipart multipart = new MimeMultipart();
        
        bodyPart.setContent(messageBody,"text/html");
        multipart.addBodyPart(bodyPart);
        
        message.setContent(multipart);
        
        

        Transport.send(message);
    }
}
