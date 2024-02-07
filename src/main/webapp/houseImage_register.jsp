<%@ page import="java.io.*, java.util.*, javax.servlet.http.Part, java.nio.file.*"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Apna Ghar</title>
    <link rel="shortcut icon" href="/assets/images/old logo.svg">
   <style type="text/css">
   body {
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
    background-color: #8AAAE5;
}

.form-container {
    max-width: 400px;
    margin: 50px auto;
    margin-top:200px;
    background-color: #fff;
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.form-group {
    margin-bottom: 20px;
}

label {
    display: block;
    font-size: 14px;
    margin-bottom: 5px;
}

input[type="file"] {
    width: 100%;
    padding: 10px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.btn {
	width:100%;
    background-color: #4CAF50;
    color: white;
    padding: 10px 15px;
    font-size: 16px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.btn:hover {
    background-color: #45a049;
}
   
   </style>
</head>
<body>
    <div class="form-container">
        <form action="" method="post" enctype="multipart/form-data">
            <h1>Upload House Image</h1>
            <div class="form-group">
                <label for="image"> Choose an image:</label>
                <input type="file" name="image" accept="image/*" required>
            </div>
            <div class="form-group">
                <button type="submit" class="btn">Next</button>
            </div>
        </form>
    </div>

    <%
        // Handle image upload
        if (request.getMethod().equalsIgnoreCase("POST")) {
            Part imagePart = request.getPart("image");
            if (imagePart != null) {
                // Generate a unique image name
                String imageName = "image_" + System.currentTimeMillis() + ".jpg";

                // Specify the directory to store images
                String imageDirectory = "C:/Users/91877/Desktop/Advance java 23 may/HomeRental/src/main/webapp/HouseImages";

                // Save the image to the specified directory
                try (InputStream inputStream = imagePart.getInputStream();
                     OutputStream outputStream = new FileOutputStream(new File(imageDirectory, imageName))) {

                    int read;
                    final byte[] bytes = new byte[1024];
                    while ((read = inputStream.read(bytes)) != -1) {
                        outputStream.write(bytes, 0, read);
                    }

                    // Pass the image name to the next JSP page using a session attribute
                    session.setAttribute("imageName", imageName);
                    response.sendRedirect("houseDetail_register.jsp");
                } catch (IOException e) {
                    out.println("Error storing the image: " + e.getMessage());
                }
            } else {
                out.println("No image provided.");
            }
        }
    %>
</body>
</html>