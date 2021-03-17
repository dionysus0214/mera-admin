package org.mera.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import lombok.Setter;
import org.apache.ibatis.session.SqlSessionFactory;
import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.jasypt.encryption.pbe.config.EnvironmentStringPBEConfig;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.*;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;

@Configuration
@EnableTransactionManagement
@ComponentScan(basePackages = {"org.mera.service", "org.mera.aop"})
@MapperScan(basePackages = {"org.mera.mapper"})
@EnableAspectJAutoProxy
@PropertySource(name="config", value="classpath:config/config-properties-${spring.profiles.active}.xml")
public class RootConfig {

    //@Autowired
    @Setter(onMethod_ = {@Autowired})
    ApplicationContext applicationContext;

    @Value("${jdbc.driverClass}")
    private String jdbcDriverClass;
    @Value("${jdbc.url}")
    private String jdbcUrl;
    @Value("${jdbc.user}")
    private String jdbcUser;
    @Value("${jdbc.pass}")
    private String jdbcPass;
    @Value("${cloud.sql}")
    private String cloudSqlConnect;

    /**
     * DataSource 설정
     * <bean id="dataSource"
     *  class="org.springframework.jdbc.datasource.DriverManagerDataSource">
     *
     *  <property name="driverClassName" value="oracle.jdbc.driver.OracleDriver" />
     *  <property name="url" value="jdbc:oracle:thin:@localhost:1521:xe" />
     *  <property name="username" value="intercast" />
     *  <property name="password" value="pass123!" />
     * </bean>
     *
     * @return
     */
    @Bean
    public DataSource dataSource() {

        String profile = System.getProperty("spring.profiles.active");
//        ApplicationContext context = new ClassPathXmlApplicationContext("config/config-properties-"+profile+".xml");
//        Environment environment = context.getEnvironment();
        System.out.println("profile = " + profile);
//        System.out.println("jdbc.driverClass = " + environment.getProperty("jdbc.driverClass"));

        HikariConfig hikariConfig = new HikariConfig();

        if ( profile == null || profile.equals("google") ) {
            hikariConfig.addDataSourceProperty("socketFactory", jdbcDriverClass);
            hikariConfig.addDataSourceProperty("cloudSqlInstance", cloudSqlConnect);
            //hikariConfig.addDataSourceProperty("socketFactory", "com.google.cloud.sql.mysql.SocketFactory");
            //hikariConfig.addDataSourceProperty("cloudSqlInstance", "wish-quiz-project:asia-east1:mera-cloussql");
        } else {
           hikariConfig.setDriverClassName(jdbcDriverClass);
        }
        hikariConfig.setJdbcUrl(jdbcUrl);
        hikariConfig.setUsername(jdbcUser);
        hikariConfig.setPassword(jdbcPass);

        hikariConfig.setMaximumPoolSize(3);
        hikariConfig.setConnectionTimeout(10000); // 10 seconds
        hikariConfig.setIdleTimeout(600000); // 10 minutes

        //HikariDataSource dataSource = new HikariDataSource(hikariConfig);
        DataSource dataSource = new HikariDataSource(hikariConfig);
        return dataSource;
    }

    /**
     * SqlSessionFactory 설정
     *
     * <bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
     *  <property name="dataSource" ref="dataSource" />
     *  <property name="configLocation" value="classpath:mybatis/configuration.xml" />
     * <property name="mapperLocations" value="classpath:mybatis/mappers/** /*.xml" />
     * </bean>
     *
     * @return
     * @throws Exception
     */
    @Bean
    public SqlSessionFactory sqlSessionFactory() throws Exception {
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(dataSource());
        sqlSessionFactoryBean.setConfigLocation(applicationContext.getResource("classpath:/mybatis-config.xml"));
        sqlSessionFactoryBean.setMapperLocations(applicationContext.getResources("classpath:mappers/**/*Mapper.xml"));
        return (SqlSessionFactory)sqlSessionFactoryBean.getObject();
    }

    /**
     * TransactionManager설정
     *
     * <bean id="transactionManager"
     *  class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
     *  <property name="dataSource" ref="dataSource"></property>
     * </bean>
     *
     * @return
     */
    @Bean
    public PlatformTransactionManager transactionManager() {
        return new DataSourceTransactionManager(dataSource());
    }

    /**
     * SqlSessionTemplate 설정
     *
     * <bean id="sqlSession" class="org.mybatis.spring.SqlSessionTemplate">
     *  <constructor-arg ref="sqlSessionFactory" />
     * </bean>
     *
     * @param sqlSessionFactory
     * @return
     */
    @Bean
    public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
        return new SqlSessionTemplate(sqlSessionFactory);
    }

    @Bean
    public StandardPBEStringEncryptor configurationEncryptor() {
        EnvironmentStringPBEConfig config = new EnvironmentStringPBEConfig();
        config.setAlgorithm("PBEWITHMD5ANDDES");
        config.setPassword("bellcoin_2020");

        StandardPBEStringEncryptor enc = new StandardPBEStringEncryptor();
        enc.setConfig(config);
        return enc;
    }


}
