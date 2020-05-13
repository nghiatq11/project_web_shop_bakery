package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class home_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("        <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\n");
      out.write("        <title>Material Design Bootstrap</title>\n");
      out.write("        <!-- Font Awesome -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://use.fontawesome.com/releases/v5.8.2/css/all.css\">\n");
      out.write("        <!-- Bootstrap core CSS -->\n");
      out.write("        <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("        <!-- Material Design Bootstrap -->\n");
      out.write("        <link href=\"css/mdb.min.css\" rel=\"stylesheet\">\n");
      out.write("        <!-- Your custom styles (optional) -->\n");
      out.write("        <link href=\"css/style.css\" rel=\"stylesheet\">\n");
      out.write("        <!-- MDBootstrap Steppers Pro  -->\n");
      out.write("        <link href=\"css/addons-pro/stepper.min.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" media=\"screen\" href=\"cssShop_Web.css\">\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "navbar.jsp", out, false);
      out.write(" \n");
      out.write("\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "heading.jsp", out, false);
      out.write(" \n");
      out.write("\n");
      out.write("        <!-- Start your project here-->\n");
      out.write("        <div id=\"products\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("\n");
      out.write("                <h1 class=\"my-4 font-weight-bold\">Masonry - Bootstrap 4 grid</h1>\n");
      out.write("                <div class=\"sanpham\">\n");
      out.write("                    <div class=\"grid row\">\n");
      out.write("                        <div class=\"grid-sizer\"></div>\n");
      out.write("                        <div class=\"grid-item mb-4 col-lg-3 col-md-4 col-sm-6\">\n");
      out.write("                            <div class=\"card \">\n");
      out.write("                                <div class=\"card-img\">\n");
      out.write("                                    <div class=\"smooth\"></div>\n");
      out.write("                                    <a href=\"Detail.html\"><img class=\"card-img-top\" src=\"img_main/product_1.jpg\" alt=\"Card image cap\"></a>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"card-body\">\n");
      out.write("                                    <a href=\"Detail.html\">\n");
      out.write("                                        <h5 class=\"card-title\">Card title</h5>\n");
      out.write("                                    </a>\n");
      out.write("                                    <p class=\"card-text\">Đây là a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"card-footer\">\n");
      out.write("                                    <a href=\"#\"><small class=\"text-muted\"><img src=\"img/add_shopping_cart_24px.png\">Add To Cart</small></a>\n");
      out.write("                                    <div class=\"card-footer1\">\n");
      out.write("                                        <a href=\"#\"><small class=\"text-muted\"><img src=\"img/add_shopping_cart_24px.png\">Add To Cart</small></a>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"grid-item mb-4 col-lg-3 col-md-4 col-sm-6\">\n");
      out.write("                            <div class=\"card \">\n");
      out.write("                                <div class=\"card-img\">\n");
      out.write("                                    <div class=\"smooth\"></div>\n");
      out.write("                                    <a href=\"Detail.html\"><img class=\"card-img-top\" src=\"img_main/product_1.jpg\" alt=\"Card image cap\"></a>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"card-body\">\n");
      out.write("                                    <a href=\"Detail.html\">\n");
      out.write("                                        <h5 class=\"card-title\">Card title</h5>\n");
      out.write("                                    </a>\n");
      out.write("                                    <p class=\"card-text\">Đây là a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"card-footer\">\n");
      out.write("                                    <a href=\"#\"><small class=\"text-muted\"><img src=\"img/add_shopping_cart_24px.png\">Add To Cart</small></a>\n");
      out.write("                                    <div class=\"card-footer1\">\n");
      out.write("                                        <a href=\"#\"><small class=\"text-muted\"><img src=\"img/add_shopping_cart_24px.png\">Add To Cart</small></a>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"grid-item mb-4 col-lg-3 col-md-4 col-sm-6\">\n");
      out.write("                            <div class=\"card \">\n");
      out.write("                                <div class=\"card-img\">\n");
      out.write("                                    <div class=\"smooth\"></div>\n");
      out.write("                                    <a href=\"Detail.html\"><img class=\"card-img-top\" src=\"img_main/product_1.jpg\" alt=\"Card image cap\"></a>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"card-body\">\n");
      out.write("                                    <a href=\"Detail.html\">\n");
      out.write("                                        <h5 class=\"card-title\">Card title</h5>\n");
      out.write("                                    </a>\n");
      out.write("                                    <p class=\"card-text\">Đây là a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"card-footer\">\n");
      out.write("                                    <a href=\"#\"><small class=\"text-muted\"><img src=\"img/add_shopping_cart_24px.png\">Add To Cart</small></a>\n");
      out.write("                                    <div class=\"card-footer1\">\n");
      out.write("                                        <a href=\"#\"><small class=\"text-muted\"><img src=\"img/add_shopping_cart_24px.png\">Add To Cart</small></a>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"grid-item mb-4 col-lg-3 col-md-4 col-sm-6\">\n");
      out.write("                            <div class=\"card \">\n");
      out.write("                                <div class=\"card-img\">\n");
      out.write("                                    <div class=\"smooth\"></div>\n");
      out.write("                                    <a href=\"Detail.html\"><img class=\"card-img-top\" src=\"img_main/product_1.jpg\" alt=\"Card image cap\"></a>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"card-body\">\n");
      out.write("                                    <a href=\"Detail.html\">\n");
      out.write("                                        <h5 class=\"card-title\">Card title</h5>\n");
      out.write("                                    </a>\n");
      out.write("                                    <p class=\"card-text\">Đây là a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"card-footer\">\n");
      out.write("                                    <a href=\"#\"><small class=\"text-muted\"><img src=\"img/add_shopping_cart_24px.png\">Add To Cart</small></a>\n");
      out.write("                                    <div class=\"card-footer1\">\n");
      out.write("                                        <a href=\"#\"><small class=\"text-muted\"><img src=\"img/add_shopping_cart_24px.png\">Add To Cart</small></a>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"grid-item mb-4 col-lg-3 col-md-4 col-sm-6\">\n");
      out.write("                            <div class=\"card \">\n");
      out.write("                                <div class=\"card-img\">\n");
      out.write("                                    <div class=\"smooth\"></div>\n");
      out.write("                                    <a href=\"Detail.html\"><img class=\"card-img-top\" src=\"img_main/product_1.jpg\" alt=\"Card image cap\"></a>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"card-body\">\n");
      out.write("                                    <a href=\"Detail.html\">\n");
      out.write("                                        <h5 class=\"card-title\">Card title</h5>\n");
      out.write("                                    </a>\n");
      out.write("                                    <p class=\"card-text\">Đây là a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"card-footer\">\n");
      out.write("                                    <a href=\"#\"><small class=\"text-muted\"><img src=\"img/add_shopping_cart_24px.png\">Add To Cart</small></a>\n");
      out.write("                                    <div class=\"card-footer1\">\n");
      out.write("                                        <a href=\"#\"><small class=\"text-muted\"><img src=\"img/add_shopping_cart_24px.png\">Add To Cart</small></a>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <!-- Start your project here-->\n");
      out.write("\n");
      out.write("        <!-- SCRIPTS -->\n");
      out.write("\n");
      out.write("        <!-- JQuery -->\n");
      out.write("        <script type=\"text/javascript\" src=\"js/jquery-3.4.1.min.js\"></script>\n");
      out.write("        <!-- Bootstrap tooltips -->\n");
      out.write("        <script type=\"text/javascript\" src=\"js/popper.min.js\"></script>\n");
      out.write("        <!-- Bootstrap core JavaScript -->\n");
      out.write("        <script type=\"text/javascript\" src=\"js/bootstrap.min.js\"></script>\n");
      out.write("        <!-- MDB core JavaScript -->\n");
      out.write("        <script type=\"text/javascript\" src=\"js/mdb.min.js\"></script>\n");
      out.write("\n");
      out.write("        <!-- MDBootstrap Masonry  -->\n");
      out.write("        <script type=\"text/javascript\" src=\"js/addons/masonry.pkgd.min.js\"></script>\n");
      out.write("\n");
      out.write("        <script type=\"text/javascript\" src=\"js/addons/imagesloaded.pkgd.min.js\"></script>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <script>\n");
      out.write("            $('.grid').masonry({\n");
      out.write("                itemSelector: '.grid-item',\n");
      out.write("                columnWidth: '.grid-sizer',\n");
      out.write("                percentPosition: true\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("\n");
      out.write("</html>");
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
