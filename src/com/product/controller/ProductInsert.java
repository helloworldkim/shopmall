package com.product.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.product.ProductDAO;
import com.product.ProductDTO;


////multipart 어노테이션
//@MultipartConfig(
//		//location="/product", 일반적인 경로는 설정을 안하는경우가 많음
//		fileSizeThreshold = 1024*1024, //1메가
//		maxFileSize = 1024*1024*50, //50메가
//		maxRequestSize = 1024*1024*50*5 //250메가
//		)
@WebServlet("/ProductInsert")
public class ProductInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String savePath = "product";  //파일저장경로지정
		int uploadFileSizeLimit = 50*1024*1024;  //지정크기 50mb이하
		String encType = "UTF-8";  //인코딩 타입 미지정시 upload안됨!
		ServletContext context = getServletContext(); //application객체
		String uploadFilePath = context.getRealPath(savePath); //실제경로 구하기
		System.out.println("실제경로:"+uploadFilePath);
		
		MultipartRequest  multi = new MultipartRequest(
				request, 
				uploadFilePath, 
				uploadFileSizeLimit ,
				encType,
				//rename부분
				new  DefaultFileRenamePolicy()
		);
		//system에 저장되는 실제이름
		String fileName = multi.getFilesystemName("productImg");
		System.out.println("파일이름 : "+fileName);
		
		//모든 request부분은 multipart에서 받아오기로 함!
		String productName=multi.getParameter("productName");
		String shortDetail=multi.getParameter("shortDetail");
		int productPrice=Integer.parseInt(multi.getParameter("productPrice"));
		String productCategory=multi.getParameter("productCategory");
		int productSalePer=Integer.parseInt(multi.getParameter("productSalePer"));
		int productSalePrice=Integer.parseInt(multi.getParameter("productSalePrice"));
		String productDetail=multi.getParameter("productDetail");
		
		
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
			script.println("alert('등록성공')");
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
