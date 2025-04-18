package vn.quangkhongbiet.shopping.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;
import org.springframework.session.security.web.authentication.SpringSessionRememberMeServices;

import jakarta.servlet.DispatcherType;
import vn.quangkhongbiet.shopping.service.custom.CustomAuthorizationRequestResolver;
import vn.quangkhongbiet.shopping.service.custom.CustomUserDetailsService;

import static org.springframework.security.oauth2.client.web.OAuth2AuthorizationRequestRedirectFilter.DEFAULT_AUTHORIZATION_REQUEST_BASE_URI;

@Configuration
@EnableMethodSecurity(securedEnabled = true)
public class SecurityConfiguration {

        @Autowired
        private CustomUserDetailsService userDetailsService;
        @Autowired
        private ClientRegistrationRepository clientRegistrationRepository;

        @Bean
        public DaoAuthenticationProvider authProvider() {
                DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
                authProvider.setUserDetailsService(userDetailsService);
                authProvider.setPasswordEncoder(encoder());
                return authProvider;
        }

        @Bean
        public PasswordEncoder encoder() {
                return new BCryptPasswordEncoder();
        }

        @Bean
        public SpringSessionRememberMeServices rememberMeServices() {
                SpringSessionRememberMeServices rememberMeServices = new SpringSessionRememberMeServices();

                // optionally customize
                rememberMeServices.setAlwaysRemember(true);
                return rememberMeServices;
        }

        @Bean
        public SecurityFilterChain filterChain(HttpSecurity http)
                        throws Exception {
                http
                                .authorizeHttpRequests(authorize -> authorize
                                                // key FORWARD cho phép rederiect tới login
                                                // key INCLUDE cho phép 1 trang lấy dc thông tin ở các nơi khác
                                                // vd: home lấy list product
                                                .dispatcherTypeMatchers(DispatcherType.FORWARD, DispatcherType.INCLUDE)
                                                .permitAll()
                                                .requestMatchers("/", "/login", "/register","/account_verifications", "/client/**", "/css/**",
                                                                "/js/**", "/images/**", "/error/**",
                                                                "/product/**", "/products", "/client/product/**")
                                                .permitAll()
                                                .requestMatchers("/admin/**").hasRole("ADMIN")
                                                .requestMatchers("/client/**").hasRole("USER")
                                                .anyRequest().authenticated())

                                .sessionManagement((sessionManagement) -> sessionManagement
                                                .sessionCreationPolicy(SessionCreationPolicy.ALWAYS) // luôn tạo session
                                                                                                     // mới

                                                .invalidSessionUrl("/login?logout")
                                                .maximumSessions(1) // giới hạn 1 tk login tối đa trên 1 thiết bị
                                                .maxSessionsPreventsLogin(false)) // neu có thêm1 người login vào thì ng
                                                                                  // sau đá ng trc
                                // giống kiểu liên quân
                                // nếu là true thì ngc lại
                                .logout(logout -> logout
                                                .logoutUrl("/logout") // URL để gọi logout
                                                .logoutSuccessUrl("/login?logout") // URL sau khi logout thành công
                                                .invalidateHttpSession(true) // Hủy toàn bộ session hiện tại
                                                .deleteCookies("JSESSIONID", "remember-me") // Xóa cookie chứa session ID
                                                .clearAuthentication(true) // Xóa thông tin xác thực khỏi
                                                                           // SecurityContext
                                                .permitAll())

                                .rememberMe(r -> r.rememberMeServices(rememberMeServices()))

                                .formLogin(formLogin -> formLogin
                                                .loginPage("/login")
                                                .failureUrl("/login?error")
                                                .successHandler(myAuthenticationSuccessHandler())
                                                .permitAll())
                                .oauth2Login(oauth2 -> oauth2
                                                .loginPage("/login") // Dùng lại trang login nếu muốn
                                                .failureUrl("/login?error")
                                                .successHandler(myAuthenticationSuccessHandler())
                                                .authorizationEndpoint(authorization -> authorization
                                                                .authorizationRequestResolver(new CustomAuthorizationRequestResolver(clientRegistrationRepository,
                                                                DEFAULT_AUTHORIZATION_REQUEST_BASE_URI)))
                                                                                                
                                )

                                .csrf(c -> c
                                                .csrfTokenRepository(CookieCsrfTokenRepository.withHttpOnlyFalse()))
                                .exceptionHandling(ex -> ex.accessDeniedPage("/access-deny"));
                return http.build();
        }

        @Bean
        public AuthenticationSuccessHandler myAuthenticationSuccessHandler() {
                return new CustomSuccessHandler();
        }




}
