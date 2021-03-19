package org.mera.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class CommonExceptionAdvice {

    private static final Logger logger = LoggerFactory.getLogger(CommonExceptionAdvice.class);

    //@ExceptionHandler(Exception.class)
    public String common(Exception e) {

        logger.info(e.toString());

        return "error/error_common";
    }

    @ExceptionHandler(Exception.class)
    public String errorModelAndView(Exception ex, Model model) {
        logger.error("Exception .... " + ex.getMessage() );
        model.addAttribute("exception", ex);
        logger.error(model.toString());

        return "error/error_page";
    }

    @ExceptionHandler(NoHandlerFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public String handle404(NoHandlerFoundException ex) {
        logger.error(ex.toString());
        return "error/error_404";
    }
}


