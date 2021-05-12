package com.ruoyi.common.utils;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 手动静态获取bean对象工具类
 */
@Component("springContextUtil")
public class SpringContextUtil implements ApplicationContextAware {

  // spring 容器上下文对象
  private static ApplicationContext ctx = null;

  public static ApplicationContext getApplicationContext() throws BeansException {
    return ctx;
  }

  public void setApplicationContext(ApplicationContext context) throws BeansException {
    ctx = context;
  }

  /**
   * 从静态变量ApplicationContext中取得Bean, 自动转型为所赋值对象的类型.
   */
  @SuppressWarnings("unchecked")
  public static <T> T getBean(String name) {
    checkApplicationContext();
    return (T) ctx.getBean(name);
  }

  /**
   * 从静态变量ApplicationContext中取得Bean.
   */
  @SuppressWarnings("unchecked")
  public static <T> T getBean(Class<T> clazz) {
    checkApplicationContext();
    return ctx.getBean(clazz);
  }

  /**
   * 清除applicationContext静态变量.
   */
  public static void cleanApplicationContext() {
    ctx = null;
  }

  private static void checkApplicationContext() {
    if (ctx == null) {
      throw new IllegalStateException("applicationContext未注入");
    }
  }

  /**
   * SpringMvc下获取request
   *
   * @return
   */
  public static HttpServletRequest getRequest() {
    return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
  }

  /**
   * SpringMvc下获取session
   *
   * @return
   */
  public static HttpSession getSession() {
    return getRequest().getSession();
  }
}
