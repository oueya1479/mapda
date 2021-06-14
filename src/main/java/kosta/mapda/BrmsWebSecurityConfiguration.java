//package kosta.mapda;
//
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.builders.WebSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//
//@EnableWebSecurity
//public class BrmsWebSecurityConfiguration extends WebSecurityConfigurerAdapter {
//
//    /**
//     * 스프링시큐리티 앞단 설정들을 할 수 있다.
//     */
//    @Override
//    public void configure(WebSecurity web) throws Exception {
//        // resources 모든 접근을 허용하는 설정을 해버리면
//        // HttpSecurity 설정한 ADIM권한을 가진 사용자만 resources 접근가능한 설정을 무시해버린다.
//        web.ignoring()
//                .antMatchers("/resources/**");
//    }
//
//    /**
//     * 스프링시큐리티의 설정을 할 수 있다.
//     */
//    @Override
//    public void configure(HttpSecurity http) throws Exception {
//        // WebSecurity에 접근 허용 설정을 해버리면 이 설정이 적용되지 않는다.
//        http.authorizeRequests()
//        .antMatchers("/**").permitAll();
//              // .antMatchers("/resources/**").hasRole("ADIM") // no effect
//              // .anyRequest().authenticated();
//    }
//}
//
//
//
//
//
//
