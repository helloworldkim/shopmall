package com.product.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.dto.ProductDTO;
import com.mybatis.config.MybatisManager;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String savePath = "product"; // 파일저장경로지정
		int uploadFileSizeLimit = 50 * 1024 * 1024; // 지정크기 50mb이하
		String encType = "UTF-8"; // 인코딩 타입 미지정시 upload안됨!
		ServletContext context = getServletContext(); // application객체
		String uploadFilePath = context.getRealPath(savePath); // 실제경로 구하기
		System.out.println("실제경로:" + uploadFilePath);

		MultipartRequest multi = new MultipartRequest(
				request,
				uploadFilePath,
				uploadFileSizeLimit,
				encType,
				// rename부분
				new DefaultFileRenamePolicy());



		// 모든 request부분은 multipart에서 받아오기로 함!
		String productName = multi.getParameter("productName");
		String shortDetail = multi.getParameter("shortDetail");
		int productPrice = Integer.parseInt(multi.getParameter("productPrice"));
		String productCategory = multi.getParameter("productCategory");
		int productSalePer = Integer.parseInt(multi.getParameter("productSalePer"));
		int productSalePrice = Integer.parseInt(multi.getParameter("productSalePrice"));
		String productDetail = multi.getParameter("productDetail");
		//단일파일 등록시
		String fileName = multi.getFilesystemName("productImg");
		System.out.println("실제파일이름:"+fileName);
		
		
		 ProductDTO product =new ProductDTO(); 
		 product.setProductName(productName);
		 product.setShortDetail(shortDetail); 
		 product.setProductPrice(productPrice);
		 product.setProductCategory(productCategory);
		 product.setProductSalePer(productSalePer);
		 product.setProductSalePrice(productSalePrice);
		 product.setProductDetail(productDetail); 
		 //단일파일
		 product.setProductImg(fileName);
		 
		
		//다중파일업로드
		 /*
		ArrayList<String> nameList = new ArrayList<String>();
		Enumeration<String> files = multi.getFileNames(); // 파일명정보를 배열로 만들다(files에 name들이 담겨있다)
		while (files.hasMoreElements()) {
			String name = (String) files.nextElement(); // 각각의 파일 name을 String name에 담는다.
			System.out.println("name:"+name);
			//일단 파일이름을 받아옴
			String filename = multi.getFilesystemName(name);
			System.out.println("filename:"+filename);
			if(!(filename==null)) {//null이 아닌경우에만 추가x
				nameList.add(filename);
			}			
		}
		product.setProductImg(nameList.toString().replace("[", "").replace("]", ""));
		System.out.println("리스트:"+product.getProductImg());
		*/
		 SqlSessionFactory sqlSessionFactory = MybatisManager.getSqlSessionFactory();
		 SqlSession sqlsession = sqlSessionFactory.openSession();

		 int result = sqlsession.insert("InsertProduct",product); 
		 sqlsession.commit();
		 sqlsession.close();
		 
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
