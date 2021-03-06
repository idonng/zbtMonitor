package com.zbt.yqjk.common;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintStream;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.zbt.yqjk.pojo.TemplateInfo;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

/**
 * 类名: ExportWord 
 * 功能: freemark导出word
 * 作者: vivira
 * 日期: 2016/12/6
 */
public class ExportWord {
	
	private static final Logger logger = Logger.getLogger(ExportWord.class);
	
	private Configuration configuration = null;


	public ExportWord() {
		configuration = new Configuration();
		configuration.setDefaultEncoding("utf-8");
	}

	/**
	 * 功能: 删除模板文件时删除flt文件
	 * 参数: flt路径 path
	 * 参数: flt名称 fltName   
	 * 返回值类型: void
	 * 时间:  2016/12/6 16:35
	 */
	public void deleteFlt(String path, String fltName) {
		File file = new File(path+fltName+".flt");
		if(file.exists()){
			file.delete();
			logger.info(fltName + "-模板flt文件删除成功！");
		}
	}
	
    /**
     * 功能: 生成模板flt文件
     * 参数: xml路径  xmlpath
     * 参数: 模板内容 temp
     * @throws UnsupportedEncodingException   
     * 返回值类型: void
     * 时间:  2016/12/6 11:35
     */
    public void writerFltFile(String xmlpath,TemplateInfo temp) throws UnsupportedEncodingException{  
    	PrintStream ps = null;
		FileOutputStream fout;
		try {
			String path = xmlpath + temp.getTempName()+".flt";
			fout = new FileOutputStream(new File(path));
			String encoding = "utf-8"; // 指定文件写入时采用的字符集(Windows默认是GBK)
			try {
				ps = new PrintStream(fout, true, encoding);
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				logger.error(temp.getTempName() + "-模板flt文件生成失败！", e);
			}
			ps.print(temp.getTempBody());
			ps.close();
			try {
				fout.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				logger.error(temp.getTempName() + "-模板flt文件生成失败！", e);
			}
			logger.info(temp.getTempName() + "-模板flt文件生成！");
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			logger.error(temp.getTempName() + "-模板flt文件生成失败！", e1);
		}

    }  
    
	/**
	 * 功能: 导出word
	 * 参数: word内容 map
	 * 参数: flt路径 xmlPath
	 * 参数: word名称 docName
	 * 参数: flt名称 fltName
	 * 参数: response   
	 * 返回值类型: void
	 * 时间:  2016/12/6 13:35
	 */
	public void exported(Map<String,Object> map ,String xmlPath,String docName,String fltName,HttpServletResponse response ) {
		/**
		 * 导出word
		 */
		try {
			configuration.setDirectoryForTemplateLoading(new File(xmlPath));
			Template t = configuration.getTemplate(fltName+".flt");
			Writer out = null;
			try {
				//设置自选路径
				response.setCharacterEncoding("UTF-8");
				response.setContentType("application/msword");
				response.setHeader(
						"content-disposition",
						"attachment; filename="+URLEncoder.encode(docName, "UTF-8")+".doc");
				out = new BufferedWriter(new OutputStreamWriter(
						response.getOutputStream(), "UTF-8"), 10240);
				logger.info(docName+"-自选路径设置成功！");
			} catch (Exception e) {
				e.printStackTrace();
				logger.error("-自选路径设置失败");
			}			
			try {
				t.process(map, out);
				out.flush();
				out.close();
				logger.info("freemark导出word-"+docName+"成功！");
			} catch (TemplateException e) {
				e.printStackTrace();
			}

		} catch (IOException e) {
			e.printStackTrace();
			logger.error("freemark导出word-"+docName+"失败！",e);
		}
	}
}
