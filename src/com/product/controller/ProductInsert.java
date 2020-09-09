package com.product.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.product.ProductDAO;
import com.product.ProductDTO;


//multipart 어노테이션
@MultipartConfig(
		//location="/product", 일반적인 경로는 설정을 안하는경우가 많음
		fileSizeThreshold = 1024*1024, //1메가
		maxFileSize = 1024*1024*50, //50메가
		maxRequestSize = 1024*1024*50*5 //250메가
		)

@WebServlet("/ProductInsert")
public class ProductInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//이미지 파일을 제외한 나머지부분
		String productName=request.getParameter("productName");
		String shortDetail=request.getParameter("shortDetail");
		int productPrice=Integer.parseInt(request.getParameter("productPrice"));
		String productCategory=request.getParameter("productCategory");
		int productSalePer=Integer.parseInt(request.getParameter("productSalePer"));
		int productSalePrice=Integer.parseInt(request.getParameter("productSalePrice"));
		String productDetail=request.getParameter("productDetail");

		Part filePart = request.getPart("productImg");
		//전송된 파일의 실제이름을 가져옴
		String fileName = filePart.getSubmittedFileName();
		InputStream fis = filePart.getInputStream();
		
		//product에 저장할예정
		String realPath = request.getServletContext().getRealPath("/product");
		System.out.println(realPath);
		
		//해당방법은 window에서만 가능해서 밑에방법으로 사용해야한다!
		//String filePath = realPath +"\\" +fileName;
		String filePath = realPath + File.separator +fileName;
		FileOutputStream fos =  new FileOutputStream(filePath);
		/* 해당방식은 시간을 엄청나게 소모함 
		int b;
		//read가 마지막인경우 -1을 리턴함 (기존은 바이너리데이터)
		while((b=fis.read()) != -1) {
			fos.write(b);
		}*/
		
		byte[] buf =new byte[1024];
		int size=0;
		//read가 마지막인경우 -1을 리턴함 (기존은 바이너리데이터)
		while((size=fis.read(buf)) != -1) {
			fos.write(buf,0,size);
		}
		fos.close();
		fis.close();
		
		
		ProductDTO product =new ProductDTO();
		product.setProductName(productName);
		product.setShortDetail(shortDetail);
		product.setProductPrice(productPrice);
		product.setProductCategory(productCategory);
		product.setProductSalePer(productSalePer);
		product.setProductSalePrice(productSalePrice);
		product.setProductDetail(productDetail);
		product.setProductImg(fileName);

		ProductDAO productDAO = ProductDAO.getInstance();
		int result = productDAO.InsertProduct(product);
		if(result==1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('가입성공')");
			script.println("location.href='./view/index.jsp'");
			script.println("</script>");
		}else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('등록실패')");
			script.println("history.back()");
			script.println("</script>");
		}
	}

}
