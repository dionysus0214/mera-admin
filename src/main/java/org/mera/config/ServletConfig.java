package org.mera.config;

import org.mera.interceptor.AuthInterceptor;
import org.mera.interceptor.LoginInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.core.io.FileSystemResource;
import org.springframework.format.FormatterRegistry;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.validation.MessageCodesResolver;
import org.springframework.validation.Validator;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.HandlerMethodReturnValueHandler;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import java.io.IOException;
import java.util.List;

@EnableWebMvc
@ComponentScan(basePackages = {"org.mera.controller", "org.mera.exception"})
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true)
public class ServletConfig implements WebMvcConfigurer {


    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        InternalResourceViewResolver bean = new InternalResourceViewResolver();
        bean.setViewClass(JstlView.class);
        bean.setPrefix("/WEB-INF/views/");
        bean.setSuffix(".jsp");
        registry.viewResolver(bean);
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
    }

    @Override
    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {

    }

    @Override
    public void addReturnValueHandlers(List<HandlerMethodReturnValueHandler> returnValueHandlers) {

    }

    @Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {

    }

    @Override
    public void extendMessageConverters(List<HttpMessageConverter<?>> converters) {

    }

    @Override
    public void configureHandlerExceptionResolvers(List<HandlerExceptionResolver> exceptionResolvers) {

    }

    @Override
    public void extendHandlerExceptionResolvers(List<HandlerExceptionResolver> exceptionResolvers) {

    }

    @Override
    public Validator getValidator() {
        return null;
    }

    @Override
    public MessageCodesResolver getMessageCodesResolver() {
        return null;
    }

    @Override
    public void configurePathMatch(PathMatchConfigurer configurer) {

    }

    @Override
    public void configureContentNegotiation(ContentNegotiationConfigurer configurer) {

    }

    @Override
    public void configureAsyncSupport(AsyncSupportConfigurer configurer) {

    }

    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {

    }

    @Override
    public void addFormatters(FormatterRegistry registry) {

    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {

//        LoginInterceptor loginInterceptor = new LoginInterceptor();
        AuthInterceptor authInterceptor = new AuthInterceptor();
//
//        // 로그인, 로그아웃, 회원가입은 세션 검사를 할 필요가 없으므로 exclude
//        registry.addInterceptor(loginInterceptor)
//                .addPathPatterns("/user/login")
//                .addPathPatterns("/user/logout")
//                .addPathPatterns("/user/loginPost");
//                //.excludePathPatterns("/*");
//
        registry.addInterceptor(authInterceptor)
                .addPathPatterns("/video/*")
                .addPathPatterns("/quiz/*")
                .addPathPatterns("/board/*")
                .addPathPatterns("/dashboard/*")
                .addPathPatterns("/statistic/*")
                .addPathPatterns("/gyanking/*")
                .addPathPatterns("/webs/*")
                .addPathPatterns("/user/*");
                //.excludePathPatterns("/*");
    }

    @Override
    public void addCorsMappings(CorsRegistry registry) {

    }

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {

    }

    @Bean(name="multipartResolver")
    public CommonsMultipartResolver getResolver() throws IOException {
        CommonsMultipartResolver resolver = new CommonsMultipartResolver();
        // 10MB
        resolver.setMaxUploadSize(1024 * 1024 * 5);
        // 2MB
        resolver.setMaxUploadSizePerFile(1024 * 1024 * 2);
        // 1MB
        resolver.setMaxInMemorySize(1024 * 1024);
        // tmp upload
        resolver.setUploadTempDir(new FileSystemResource("/tmp/logs"));

        resolver.setDefaultEncoding("UTF-8");
        return resolver;
    }

    @Bean
    public String uploadPath() {
        return "/tmp";
    }

}
