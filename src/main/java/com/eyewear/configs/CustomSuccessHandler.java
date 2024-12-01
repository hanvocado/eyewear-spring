package com.eyewear.configs;

import com.eyewear.entities.User;
import com.eyewear.enums.Role;
import com.eyewear.repositories.UserRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import java.io.IOException;
import java.util.Optional;
import java.util.Set;

@Configuration
public class CustomSuccessHandler implements AuthenticationSuccessHandler {
	
	@Autowired
    private UserRepository userRepo;

	@Transactional
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {

		String email;
		if (authentication.getPrincipal() instanceof OAuth2User) {
			// Đăng nhập bằng Google
			OAuth2User oAuth2User = (OAuth2User) authentication.getPrincipal();
			email = oAuth2User.getAttribute("email");
			// Lấy user từ database hoặc tạo mới nếu chưa tồn tại
			User user = userRepo.findByEmail(email).orElseGet(() -> {
				User newUser = new User();
				newUser.setEmail(email);
				newUser.setFirstName(oAuth2User.getAttribute("given_name"));
				newUser.setLastName(oAuth2User.getAttribute("family_name"));
				newUser.setPicture(oAuth2User.getAttribute("picture"));
				newUser.setPhone(oAuth2User.getAttribute("phone"));
				newUser.setAddress(oAuth2User.getAttribute("address"));
				newUser.setRoles(Role.BUYER.name());
				userRepo.save(newUser);
				return newUser;
			});
			// Lưu user vào session
			HttpSession session = request.getSession();
			session.setAttribute("currentUser", user);
		} else {
			// Đăng nhập bằng email và mật khẩu
			CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
			email = userDetails.getUsername();
			// Lấy user từ database
			Optional<User> user = userRepo.findByEmail(email);
			// Lưu vào session
			HttpSession session = request.getSession();
			session.setAttribute("currentUser", user.orElseThrow(() ->
					new RuntimeException("User not found")));
		}

		request.getSession().setAttribute("email", email);
		request.getSession().setMaxInactiveInterval(30 * 60); // 30 phút
		
		Set<String> roles = AuthorityUtils.authorityListToSet(authentication.getAuthorities());

		if (roles.contains("ROLE_MANAGER")) {
			response.sendRedirect("/manager/");
		} else if (roles.contains("ROLE_BUYER")) {
			response.sendRedirect("/");
		} else if (roles.contains("ROLE_ADMIN")) {
			response.sendRedirect("/admin/");
		} else {
			response.sendRedirect("/access-denied");
		}

	}

}
