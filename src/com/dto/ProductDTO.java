package com.dto;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("ProductDTO")			//NotSerializableException 때문에 추가함
public class ProductDTO implements Serializable{
		private int productId; 			//상품등록번호 1부터시작
		private String productName;		//상품이름
		private String shortDetail;			//간단설명
		private String productDetail;		//상품 상세설명
		private int productPrice;			//정상가
		private int productSalePer;		//할인율
		private int productSalePrice;		//할인적용된 가격
		private String productCategory; 	//종류별 구분될 상품종류
		private String productImg;			//이미지
		private String productDate; 		//등록시간
		private int productHit;				//상품조회수
		
		
		public int getProductId() {
			return productId;
		}
		public void setProductId(int productId) {
			this.productId = productId;
		}
		public String getProductName() {
			return productName;
		}
		public void setProductName(String productName) {
			this.productName = productName;
		}
		public String getShortDetail() {
			return shortDetail;
		}
		public void setShortDetail(String shortDetail) {
			this.shortDetail = shortDetail;
		}
		public String getProductDetail() {
			return productDetail;
		}
		public void setProductDetail(String productDetail) {
			this.productDetail = productDetail;
		}
		public int getProductPrice() {
			return productPrice;
		}
		public void setProductPrice(int productPrice) {
			this.productPrice = productPrice;
		}
		public int getProductSalePer() {
			return productSalePer;
		}
		public void setProductSalePer(int productSalePer) {
			this.productSalePer = productSalePer;
		}
		public int getProductSalePrice() {
			return productSalePrice;
		}
		public void setProductSalePrice(int productSalePrice) {
			this.productSalePrice = productSalePrice;
		}
		public String getProductImg() {
			return productImg;
		}
		public void setProductImg(String productImg) {
			this.productImg = productImg;
		}
		public String getProductDate() {
			return productDate;
		}
		public void setProductDate(String productDate) {
			this.productDate = productDate;
		}
		public String getProductCategory() {
			return productCategory;
		}
		public void setProductCategory(String productCategory) {
			this.productCategory = productCategory;
		}
		public int getProductHit() {
			return productHit;
		}
		public void setProductHit(int productHit) {
			this.productHit = productHit;
		}
		
		
		
		
		
}
