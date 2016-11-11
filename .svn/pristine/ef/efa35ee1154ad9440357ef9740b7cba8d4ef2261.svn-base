package com.zbt.yqjk.common;

import java.util.Calendar;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {
	@SuppressWarnings("static-access")
	public static void sendMessage(String to,String messageText) throws MessagingException {
		String smtpHost =  "smtp.163.com";
		String from = "zbtmonitor@163.com";
		String fromPassword = "passw0rd";
		String subject = "舆情监测数据";
		String messageType = "text/html;charset=utf-8";
		// 第一步：配置javax.mail.Session对象
		
		Properties props = new Properties();
		props.put("mail.smtp.host", smtpHost);
		props.put("mail.smtp.starttls.enable", "true");// 使用 STARTTLS安全连接
		props.put("mail.smtp.auth", "true"); // 使用验证
		Session mailSession = Session.getInstance(props, new MyAuthenticator(
				from, fromPassword));

		// 第二步：编写消息
		InternetAddress fromAddress = new InternetAddress(from);
		InternetAddress toAddress = new InternetAddress(to);

		MimeMessage message = new MimeMessage(mailSession);

		message.setFrom(fromAddress);
		message.addRecipient(RecipientType.TO, toAddress);

		message.setSentDate(Calendar.getInstance().getTime());
		message.setSubject(subject);
		message.setContent(messageText, messageType);

		// 第三步：发送消息
		Transport transport = mailSession.getTransport("smtp");
		transport.connect(smtpHost,from, fromPassword);
		transport.send(message, message.getRecipients(RecipientType.TO));
	}

	public static void main(String[] args) {
		try {
			SendMail.sendMessage("1534992006@qq.com",
					"飒飒sasa事<br>主体：<font color='red'>sdsd</font>"
					);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

class MyAuthenticator extends Authenticator {
	String userName = "";
	String password = "";

	public MyAuthenticator() {

	}

	public MyAuthenticator(String userName, String password) {
		this.userName = userName;
		this.password = password;
	}

	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(userName, password);
	}
}