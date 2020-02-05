<%--
  Created by IntelliJ IDEA.
  User: Jed
  Date: 10/15/2018
  Time: 1:05 PM
--%>
<!DOCTYPE html>
<html lang="en">
<head>
  <%@ include file="navbar.jsp" %>
  <meta charset="UTF-8">
  <title>Home</title>
  <link rel="stylesheet" type="text/css" href="index.css">
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
  body,h1 {font-family: "Montserrat", sans-serif}
  img {margin-bottom: -7px}
  .w3-row-padding img {margin-bottom: 12px}
</style>
<body>

<!-- !PAGE CONTENT! -->
<div class="w3-content" style="max-width:1500px">

  <!-- Header -->
  <div class="w3-opacity">
    <div class="w3-clear"></div>
    <header class="w3-center w3-margin-bottom">
      <h1 style="color: #00cc99;margin-top: 20px"><b>Snippit</b></h1>
      <p><b>A image database made by a novice.</b></p>
    </header>
  </div>

  <!-- Photo Grid -->
  <div class="w3-row-padding" id="myGrid" style="margin-bottom:128px">
    <div class="w3-third">
      <img src="images/IMG_0791.JPG" style="width:100%">
      <img src="images/IMG_0792.JPG" style="width:100%">
      <img src="images/IMG_0793.JPG" style="width:100%">
      <img src="images/IMG_0965.JPG" style="width:100%">
      <img src="images/IMG_0966.JPG" style="width:100%">
      <img src="images/IMG_0967.JPG" style="width:100%">
    </div>

    <div class="w3-third">
      <img src="images/IMG_0968.JPG" style="width:100%">
      <img src="images/IMG_0969.JPG" style="width:100%">
      <img src="images/IMG_0970.JPG" style="width:100%">
      <img src="images/IMG_0971.JPG" style="width:100%">
      <img src="images/IMG_0972.JPG" style="width:100%">
      <img src="images/IMG_0973.JPG" style="width:100%">
    </div>

    <div class="w3-third">
      <img src="images/IMG_1104.JPG" style="width:100%">
      <img src="images/IMG_1105.JPG" style="width:100%">
      <img src="images/IMG_1106.JPG" style="width:100%">
      <img src="images/IMG_1107.JPG" style="width:100%">
      <img src="images/IMG_1213.PNG" style="width:100%">
      <img src="images/jed.JPG" style="width:100%">
    </div>
  </div>

  <!-- End Page Content -->
</div>

<script>
    // Toggle grid padding
    function myFunction() {
        var x = document.getElementById("myGrid");
        if (x.className === "w3-row") {
            x.className = "w3-row-padding";
        } else {
            x.className = x.className.replace("w3-row-padding", "w3-row");
        }
    }
</script>
</body>
</html>