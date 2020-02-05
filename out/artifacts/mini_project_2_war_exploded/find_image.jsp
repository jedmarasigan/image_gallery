<%--
  Created by IntelliJ IDEA.
  User: Jed
  Date: 10/18/2018
  Time: 12:13 AM
  To change this template use File | Settings | File Templates.
--%>
<HTML>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<HEAD>
    <%@ include file="navbar.jsp" %>
    <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css'/>
    <link rel='stylesheet' href='find_artist.css' />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <title>Find Artist</title>
</HEAD>
<BODY>

<form method="post" action="${pageContext.request.contextPath}/image">
    <div id="bio_container">

        <div id="country_container">
            <b id="country_label">Artist ID: </b>
            <input type = "text" name="artist_id">
        </div>

        <div id ="year_container">
            <b id="year_label">Title: </b>
            <input id="year" type="text" name="title" onkeydown="javascript: return event.keyCode == 69 ? false : true">
        </div>

        <div id="button_wrapper">
            <input type="submit" value="Find Artists" id="find_artist" name="find_image">
        </div>

    </div>
</form>
</BODY>
</HTML>
