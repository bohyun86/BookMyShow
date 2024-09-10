package com.itwillbs.aop;

import lombok.extern.log4j.Log4j2;
import org.apache.logging.log4j.core.config.Order;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Aspect
@Log4j2
@Component
@Order(2)
public class LogAdvice {

    @Before("execution(* com.itwillbs.controller.*.*(..))")
    public void logBefore() {
        log.info("=====================================");
    }

    @Around("execution(* com.itwillbs.controller.*.*(..))")
    public Object logAround(ProceedingJoinPoint pjp) {
        String methodName = pjp.getSignature().toShortString(); // 메서드 이름을 가져옴
        log.info("Method: {}", methodName);  // 메서드 이름 로그 출력
//        log.info("Target: {}", pjp.getTarget());
//        log.info("Param: {}", pjp.getArgs());


        Object result = null;
        try {
            result = pjp.proceed();
            log.info("Result: {}", result);
        } catch (Throwable e) {
            log.error("Exception: {}", e.getMessage());
        }
        return result;

    }

}
