package com.zbt.yqjk.common;

import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class ExportWord {
	
	private Configuration configuration = null;

	public ExportWord() {
		configuration = new Configuration();
		configuration.setDefaultEncoding("utf-8");
	}

	public void exported(Map<String, String> map ,String xmlPath,String docName,HttpServletResponse response ) {
		/**
		 * 导出word
		 */
		try {
			configuration.setDirectoryForTemplateLoading(new File(xmlPath));
			Template t = configuration.getTemplate("temp.xml");
			Writer out = null;
			try {
				response.setCharacterEncoding("UTF-8");
				response.setContentType("application/msword");
				response.setHeader(
						"content-disposition",
						"attachment; filename="+URLEncoder.encode(docName, "UTF-8")+".doc");
				out = new BufferedWriter(new OutputStreamWriter(
						response.getOutputStream(), "UTF-8"), 10240);
			} catch (Exception e) {
				e.printStackTrace();
			}			
			try {
				t.process(map, out);
				System.out.println("转换成功");

			} catch (TemplateException e) {
				e.printStackTrace();
			}
			out.flush();
			out.close();

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
