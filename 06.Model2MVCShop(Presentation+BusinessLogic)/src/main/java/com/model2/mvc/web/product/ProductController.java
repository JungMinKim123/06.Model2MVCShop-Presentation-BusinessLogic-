package com.model2.mvc.web.product;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;


@Controller
public class ProductController {

	//Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	public ProductController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping("/addProduct.do")
	public String addProduct(@ModelAttribute("ProdVO") Product product) throws Exception{
		
		System.out.println("/addProduct.do");
		productService.addProduct(product);
		
		return "forward:/product/readProductView.jsp";
	}
	
	@RequestMapping("/getProduct.do")
	public String getProduct(@ModelAttribute("prodNo") int prodNo, HttpServletRequest request, Cookie cookie, Model model) throws Exception{
		
		System.out.println("/getProduct.do");
		Product prod = productService.getProduct(prodNo);
		model.addAttribute("prod",prod);
		
		String history = "";
		Cookie[] cookies = request.getCookies();
		if(cookies != null && cookies.length > 0) {
			for(int i=0; i<cookies.length; i++) {
				cookie = cookies[i];
				if(cookie.getName().equals("history")) {
					history = URLDecoder.decode(","+cookie.getValue());
				}
			}
		}
		
		cookie = new Cookie("history", URLEncoder.encode(prodNo+history));
		
		return "forward:/product/updateProductView.jsp";
	}
	
	@RequestMapping("/updateProduct.do")
	public String updateProduct(@ModelAttribute("update") Product prod) throws Exception{
		
		System.out.println("/updateProduct.do");
		productService.updateProduct(prod);
		
		return "forward:/product/updateReadProduct.jsp";
	}
	
	@RequestMapping("/updateProductView.do")
	public String updateProductView(@ModelAttribute("no") int prodNo, Model model) throws Exception{
		
		System.out.println("/updateProductView.do");
		Product prod = productService.getProduct(prodNo);
		model.addAttribute("UpdateProdVO", prod);
		
		return "forward:/product/updateProduct.jsp";
	}
	
	@RequestMapping("/listProduct.do")
	public String listProduct(@ModelAttribute("Search") Search search, Model model, @RequestParam("menu") String menu) throws Exception{
		
		System.out.println("/listProduct.do");
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		
		Map<String, Object> map = productService.getProductList(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue() , pageUnit, pageSize);
		System.out.println(resultPage);
		
		
		model.addAttribute("menu",menu);
		model.addAttribute("list",map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		
		
		return "forward:/product/productList.jsp";
	}
}
