package Mailer;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.mail.internet.MimeMessage;

public class EmailSend {

    public void sendMail(String email ,String password){
        try{
            String host ="smtp.gmail.com" ;
            String user = "nilay250@gmail.com";
            String pass = "kapaley.nilay0114cs161062";
            String to = email;
            String from = "nilay250@gmail.com";
            String subject = "Password Reset";
        String messageText = "Hi, "+email+". your password is "+password;
 

            boolean sessionDebug = false;

            Properties props = System.getProperties();

            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.required", "true");

            java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());//For Security
            Session mailSession = Session.getDefaultInstance(props, null);

            mailSession.setDebug(sessionDebug);

            Message msg = new MimeMessage(mailSession);
            msg.setFrom(new InternetAddress(from));

            InternetAddress[] address = {new InternetAddress(to)};
            msg.setRecipients(Message.RecipientType.TO, address);
            msg.setSubject(subject); msg.setSentDate(new Date());
            msg.setText(messageText);

           Transport transport=mailSession.getTransport("smtp");
           transport.connect(host, user, pass);
           transport.sendMessage(msg, msg.getAllRecipients());
           transport.close();
           System.out.println("message send successfully");
        }catch(Exception ex)
        {
            System.out.println(ex);
        }

    }
}
