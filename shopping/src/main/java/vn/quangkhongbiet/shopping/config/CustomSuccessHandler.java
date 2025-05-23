package vn.quangkhongbiet.shopping.config;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.quangkhongbiet.shopping.domain.Role;
import vn.quangkhongbiet.shopping.domain.User;
import vn.quangkhongbiet.shopping.service.RoleService;
import vn.quangkhongbiet.shopping.service.UserService;

@Configuration
@EnableWebSecurity
public class CustomSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private PasswordEncoder passwordEncoder;

    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
            HttpServletResponse response, Authentication authentication)
            throws IOException {

        String targetUrl = determineTargetUrl(authentication);

        if (response.isCommitted()) {
            return;
        }

        redirectStrategy.sendRedirect(request, response, targetUrl);

        clearAuthenticationAttributes(request, authentication);
    }

    protected String determineTargetUrl(final Authentication authentication) {

        Map<String, String> roleTargetUrlMap = new HashMap<>();
        roleTargetUrlMap.put("ROLE_USER", "/");
        roleTargetUrlMap.put("ROLE_ADMIN", "/admin");

        final Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        for (final GrantedAuthority grantedAuthority : authorities) {
            String authorityName = grantedAuthority.getAuthority();
            if (roleTargetUrlMap.containsKey(authorityName)) {
                return roleTargetUrlMap.get(authorityName);
            }
        }

        return "/";
    }

    protected void clearAuthenticationAttributes(HttpServletRequest request, Authentication authentication) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            return;
        }
        session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);

        String email = "";
        // compare and get email by traditional login and oauth2
        if (authentication instanceof UsernamePasswordAuthenticationToken) {
            email = authentication.getName();

            User currentUser = this.userService.findByEmail(email);
            if (currentUser != null) {
                session.setAttribute("fullName", currentUser.getFullName());
                session.setAttribute("avatar", currentUser.getAvatar());
                session.setAttribute("id", currentUser.getId());
                session.setAttribute("email", currentUser.getEmail());
                session.setAttribute("role", currentUser.getRole().getName());

                long sum = currentUser.getCart() == null ? 0 : currentUser.getCart().getSum();
                session.setAttribute("sum", sum);
            }
        } else if (authentication instanceof OAuth2AuthenticationToken oauthToken) {
            OAuth2User oauthUser = oauthToken.getPrincipal();

            Map<String, Object> attributes = oauthUser.getAttributes();

            if (attributes.containsKey("email")) {
                email = (String) attributes.get("email");
            } else if (attributes.containsKey("login")) {
                email = (String) attributes.get("login"); // GitHub
            } else {
                email = oauthToken.getName(); // fallback
            }
            saveUserWithOauth2(email, oauthToken, request);
        }

    }

    private void saveUserWithOauth2(String email, OAuth2AuthenticationToken oauthToken, HttpServletRequest request) {
        User user = userService.findByEmail(email);
        if (user == null) {
            User newUser = new User();
            String dummyPassword = UUID.randomUUID().toString();

            if (oauthToken.getAuthorizedClientRegistrationId().equals("google")) {
                newUser.setEmail(email);
                newUser.setAvatar(oauthToken.getPrincipal().getAttribute("picture"));
            } 
            else if (oauthToken.getAuthorizedClientRegistrationId().equals("github")) {
                newUser.setAvatar(oauthToken.getPrincipal().getAttribute("avatar_url"));
            }
            newUser.setFullName(oauthToken.getPrincipal().getAttribute("name"));
            Role role = roleService.findByName("USER");
            newUser.setRole(role);
            newUser.setPassword(passwordEncoder.encode(dummyPassword));
            newUser.setVerified(true);


            userService.save(newUser);
            user = newUser;
        }

        HttpSession session = request.getSession(false);
        session.setAttribute("email", email);
        session.setAttribute("fullName", user.getFullName());
        session.setAttribute("oauth2Avatar", user.getAvatar());
        session.setAttribute("role", "USER");

        long sum = user.getCart() == null ? 0 : user.getCart().getSum();
        session.setAttribute("sum", sum);
    }

}
