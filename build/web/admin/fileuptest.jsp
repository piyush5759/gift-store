<%@page import="com.sun.faces.facelets.tag.jsf.core.ConvertDateTimeHandler"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>

<%
    String fileid ="";
    
    File file;
    int maxFileSize = 5000 * 1024;
    int maxMemSize = 5000 * 1024;
    ServletContext context = pageContext.getServletContext();
    String filePath = context.getInitParameter("file-upload");

    // Verify the content type
    String contentType = request.getContentType();
    if ((contentType.indexOf("multipart/form-data") >= 0)) {

        DiskFileItemFactory factory = new DiskFileItemFactory();

        // maximum size that will be stored in memory
        factory.setSizeThreshold(maxMemSize);
        // Location to save data that is larger than maxMemSize.
        factory.setRepository(new File("c:\\temp"));

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);
        // maximum file size to be uploaded.
        upload.setSizeMax(maxFileSize);
        
        // Parse the request to get file items.
        List fileItems = upload.parseRequest(request);
        
      
        // Process the upl   out.print(id);oaded file items
        Iterator i = fileItems.iterator();

        out.println("<html>");
        out.println("<head>");
        out.println("<title>JSP File upload</title>");
        out.println("</head>");
        out.println("<body>");
        fileid = request.getParameter("prodidtest");
        
        while (i.hasNext()) {
            FileItem fi = (FileItem) i.next();
            if (!fi.isFormField()) {
                // Get the uploaded file parameters
                String fieldName = fi.getFieldName();
                
                String fileName = fi.getName();
                
                boolean isInMemory = fi.isInMemory();
                long sizeInBytes = fi.getSize();
                // Write the file


                if (fileName.lastIndexOf("\\") >= 0) {
                    file = new File(filePath
                            + "prod" + fileid + ".jpg");
                } else {
                    file = new File(filePath
                            + "prod" + fileid + ".jpg");
                }
                fi.write(file);
                out.println("Uploaded Filename: " + filePath
                        + "prod" + fileid + ".jpg");
            }
        }
        out.println("</body>");
        out.println("</html>");
    }

%>