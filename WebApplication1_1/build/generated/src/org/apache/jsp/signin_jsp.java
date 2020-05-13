package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class signin_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("    <head>\n");
      out.write("        <!-- Required meta tags -->\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("\n");
      out.write("        <!-- Font Awesome CSS -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://use.fontawesome.com/releases/v5.5.0/css/all.css\" integrity=\"sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU\" crossorigin=\"anonymous\">\n");
      out.write("\n");
      out.write("        <!-- Bootstrap CSS -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"loginForm/assets/css/bootstrap/bootstrap.min.css\">\n");
      out.write("\n");
      out.write("        <!-- Custom CSS -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"loginForm/assets/css/fms/form.css\">\n");
      out.write("\n");
      out.write("        <!-- link css form đăng ký -->\n");
      out.write("        <link href=\"//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css\" rel=\"stylesheet\" id=\"bootstrap-css\">\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <section id=\"cover\" class=\"c-signin\" style=\"background-image: url(loginForm/assets/images/bakery-wallpaper-hd-1.jpg);\"></section>\n");
      out.write("\n");
      out.write("        <!-- Begin: Login form -->\n");
      out.write("        <!-- <div id=\"login-blur\" style=\"background-image: url(img/bg_common2.jpg);\"></div> -->\n");
      out.write("        <div id=\"login-f\">\n");
      out.write("            <div class=\"middle\">\n");
      out.write("                <div class=\"login-panel\">\n");
      out.write("                    <div class=\"col\">\n");
      out.write("                        ");
 String message = (String) request.getAttribute("message");
                            if (message == null) {
                        
      out.write("\n");
      out.write("                        <h3> Chào mừng trở lại! </h3>\n");
      out.write("                        ");
} else {
      out.write("\n");
      out.write("                        <h3> ");
      out.print( message);
      out.write(" </h3>\n");
      out.write("                        ");
}
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                    <form class=\"js-validation-signin\" method=\"post\" action=\"login\">\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <div class=\"col\">\n");
      out.write("                                <div class=\"form-material floating\">\n");
      out.write("                                    <input type=\"email\" class=\"f-control\" id=\"login-email\" name=\"email\" onchange=\"setLabelLogin()\">\n");
      out.write("                                    <label for=\"login-username\" id=\"l-login\">\n");
      out.write("                                        <i class=\"far fa-envelope fa-fw\"></i>\n");
      out.write("                                        Email\n");
      out.write("                                    </label>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <div class=\"col\">\n");
      out.write("                                <div class=\"form-material floating\">\n");
      out.write("                                    <input type=\"password\" class=\"f-control\" id=\"login-password\" name=\"password\" onchange=\"setLabelPassword()\">\n");
      out.write("                                    <label for=\"login-password\" id=\"l-password\">\n");
      out.write("                                        <i class=\"fas fa-key fa-fw\"></i>\n");
      out.write("                                        Mật khẩu\n");
      out.write("                                    </label>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <div class=\"col\">\n");
      out.write("                                <label class=\"custom-control custom-checkbox\">\n");
      out.write("                                    <input type=\"checkbox\" class=\"custom-control-input\" id=\"login-remember-me\" name=\"login-remember-me\">\n");
      out.write("                                    <span class=\"custom-control-indicator\"></span>\n");
      out.write("                                    <span class=\"custom-control-description\">Ghi nhớ tài khoản</span>\n");
      out.write("                                </label>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <div class=\"col\">\n");
      out.write("                                <button type=\"submit\" class=\"btn btn-sm\" id=\"buttonSubmit\">\n");
      out.write("                                    <i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i> Đăng nhập\n");
      out.write("                                </button>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-group\" style=\"margin-top: 10px;\">\n");
      out.write("                            <div class=\"col\">\n");
      out.write("                                <a class=\"link-effect mr-5\" href=\"signup.html\">\n");
      out.write("                                    <i class=\"fas fa-edit fa-fw\"></i> Tạo tài khoản\n");
      out.write("                                </a>\n");
      out.write("                                <a class=\"link-effect\" href=\"reminder_password.html\">\n");
      out.write("                                    <i class=\"fas fa-lock fa-fw\"></i> Quên mật khẩu?\n");
      out.write("                                </a>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                    </form>\n");
      out.write("\n");
      out.write("                    <div class=\"row justify-content-center\">\n");
      out.write("                        <div class=\"col-md-8\">\n");
      out.write("                            <div class=\"card\">\n");
      out.write("                                <div class=\"card-header\">Register</div>\n");
      out.write("                                <div class=\"card-body\">\n");
      out.write("\n");
      out.write("                                    <form class=\"form-horizontal\" method=\"post\" action=\"#\">\n");
      out.write("\n");
      out.write("                                        <div class=\"form-group\">\n");
      out.write("                                            <label for=\"name\" class=\"cols-sm-2 control-label\">Your Name</label>\n");
      out.write("                                            <div class=\"cols-sm-10\">\n");
      out.write("                                                <div class=\"input-group\">\n");
      out.write("                                                    <span class=\"input-group-addon\"><i class=\"fa fa-user fa\" aria-hidden=\"true\"></i></span>\n");
      out.write("                                                    <input type=\"text\" class=\"form-control\" name=\"name\" id=\"name\" placeholder=\"Enter your Name\" />\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"form-group\">\n");
      out.write("                                            <label for=\"email\" class=\"cols-sm-2 control-label\">Your Email</label>\n");
      out.write("                                            <div class=\"cols-sm-10\">\n");
      out.write("                                                <div class=\"input-group\">\n");
      out.write("                                                    <span class=\"input-group-addon\"><i class=\"fa fa-envelope fa\" aria-hidden=\"true\"></i></span>\n");
      out.write("                                                    <input type=\"text\" class=\"form-control\" name=\"email\" id=\"email\" placeholder=\"Enter your Email\" />\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"form-group\">\n");
      out.write("                                            <label for=\"username\" class=\"cols-sm-2 control-label\">Username</label>\n");
      out.write("                                            <div class=\"cols-sm-10\">\n");
      out.write("                                                <div class=\"input-group\">\n");
      out.write("                                                    <span class=\"input-group-addon\"><i class=\"fa fa-users fa\" aria-hidden=\"true\"></i></span>\n");
      out.write("                                                    <input type=\"text\" class=\"form-control\" name=\"username\" id=\"username\" placeholder=\"Enter your Username\" />\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"form-group\">\n");
      out.write("                                            <label for=\"password\" class=\"cols-sm-2 control-label\">Password</label>\n");
      out.write("                                            <div class=\"cols-sm-10\">\n");
      out.write("                                                <div class=\"input-group\">\n");
      out.write("                                                    <span class=\"input-group-addon\"><i class=\"fa fa-lock fa-lg\" aria-hidden=\"true\"></i></span>\n");
      out.write("                                                    <input type=\"password\" class=\"form-control\" name=\"password\" id=\"password\" placeholder=\"Enter your Password\" />\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"form-group\">\n");
      out.write("                                            <label for=\"confirm\" class=\"cols-sm-2 control-label\">Confirm Password</label>\n");
      out.write("                                            <div class=\"cols-sm-10\">\n");
      out.write("                                                <div class=\"input-group\">\n");
      out.write("                                                    <span class=\"input-group-addon\"><i class=\"fa fa-lock fa-lg\" aria-hidden=\"true\"></i></span>\n");
      out.write("                                                    <input type=\"password\" class=\"form-control\" name=\"confirm\" id=\"confirm\" placeholder=\"Confirm your Password\" />\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"form-group \">\n");
      out.write("                                            <button type=\"button\" class=\"btn btn-primary btn-lg btn-block login-button\">Register</button>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"login-register\">\n");
      out.write("                                            <a href=\"index.php\">Login</a>\n");
      out.write("                                        </div>\n");
      out.write("                                    </form>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("        <!-- End: Login form -->\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- form đăng ký -->\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- Bootstrap core JavaScript-->\n");
      out.write("        <!-- jQuery first, then Popper.js, then Bootstrap JS -->\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js \"></script>\n");
      out.write("\n");
      out.write("        <!-- <script src=\"assets/js/jquery/jquery.min.js\"></script> -->\n");
      out.write("        <script src=\"loginForm/assets/js/bootstrap/popper.min.js\"></script>\n");
      out.write("        <script src=\"loginForm/assets/js/bootstrap/bootstrap.min.js\"></script>\n");
      out.write("\n");
      out.write("        <!-- Validate -->\n");
      out.write("        <script src=\"loginForm/assets/js/authentic/jquery.validate.min.js\"></script>\n");
      out.write("        <script src=\"loginForm/assets/js/authentic/op_auth_signin.js\"></script>\n");
      out.write("\n");
      out.write("        <!-- scrip form đăng ký -->\n");
      out.write("        <script src=\"//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js\"></script>\n");
      out.write("        <script src=\"//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js\"></script>\n");
      out.write("        <script>\n");
      out.write("                                        function setLabelLogin() {\n");
      out.write("                                            var element = document.getElementById('l-login');\n");
      out.write("                                            element.classList.add(\"focus-lable\");\n");
      out.write("                                        }\n");
      out.write("\n");
      out.write("                                        function setLabelPassword() {\n");
      out.write("                                            var element = document.getElementById('l-password');\n");
      out.write("                                            element.classList.add(\"focus-lable\");\n");
      out.write("                                        }\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
