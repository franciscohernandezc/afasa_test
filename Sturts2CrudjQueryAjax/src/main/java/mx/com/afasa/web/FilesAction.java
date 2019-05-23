package mx.com.afasa.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;


public class FilesAction extends ActionSupport {

	/**********************************************************************************************************/
	/***************************************************ATTRIBUTES*********************************************/
	/**********************************************************************************************************/
	private static final long serialVersionUID = 1L;

	private String fileName;
	private InputStream fileInputStream;
	private String archivo;
	private String content = "application/octet-stream";
	private static final 	String 	RAIZ_SERVER = "";
	
	/**********************************************************************************************************/
	/*****************************************************METHODS***********************************************/
	/**********************************************************************************************************/	
	public String execute(){
		try {
			if(archivo.endsWith(".jpg") || archivo.endsWith(".JPG") || archivo.endsWith(".jpeg") || archivo.endsWith(".JPEG") ||
				archivo.endsWith(".png") || archivo.endsWith(".PNG") || archivo.endsWith(".gif") || archivo.endsWith(".GIF") ||
				archivo.endsWith(".pdf") || archivo.endsWith(".PDF") || archivo.endsWith(".mp4") || archivo.endsWith(".MP4") ){
					File file = new File(RAIZ_SERVER + "/" + archivo);
					fileInputStream = new FileInputStream( file );
					fileName = file.getName();
					if (archivo.endsWith(".jpg") || archivo.endsWith(".JPG") ||
						archivo.endsWith(".jpeg") || archivo.endsWith(".JPEG") )
						content = "image/jpeg";
					else if (archivo.endsWith(".png") || archivo.endsWith(".PNG"))
						content = "image/png";
					else if (archivo.endsWith(".gif") || archivo.endsWith(".GIF"))
						content = "image/gif";
					else if (archivo.endsWith(".pdf") || archivo.endsWith("PDF"))
						content = "application/pdf";
					else if (archivo.endsWith(".mp4") || archivo.endsWith(".MP4"))
						content = "video/mp4";
			}else{
				return "invalido";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "invalido";
		}
		return SUCCESS;
	}
	
	/**********************************************************************************************************/
	/******************************************GETTERS AND SETTERS*********************************************/
	/**********************************************************************************************************/

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public InputStream getFileInputStream() {
		return fileInputStream;
	}

	public void setFileInputStream(InputStream fileInputStream) {
		this.fileInputStream = fileInputStream;
	}

	public String getArchivo() {
		return archivo;
	}

	public void setArchivo(String archivo) {
		this.archivo = archivo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
}