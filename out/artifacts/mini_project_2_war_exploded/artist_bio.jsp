<HTML>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<HEAD>
    <%@ include file="navbar.jsp" %>
    <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css'/>
    <link rel='stylesheet' href='artist_bio.css' />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <title>Artist Bio</title>
</HEAD>
<BODY>

<form method="post" action="${pageContext.request.contextPath}/artist">
    <div id="bio_container">
        <img src="view_user.png" alt="profile picture" id="profile_pic">

        <div id ="name_container">
            <b name="name" id="user_name">Name: <%=request.getParameter("name")%></b>
        </div>


        <div id ="year_container">
            <b id="year_label">Birth Year: </b>
            <input id="year" type="number" name="birth_year" onkeydown="javascript: return event.keyCode == 69 ? false : true" value="<%=request.getParameter("birth_year")%>">
        </div>

        <div id="country_container">
            <b id="country_label">Country: </b>
            <input type = "text" name="country" value="<%=request.getParameter("country")%>">
        </div>

        <div id="description_container">
            <b id="description_label">Description: </b>
            <input type = "text" name="description" id="description" value="<%=request.getParameter("description")%>">

        </div>

        <div id="button_wrapper">
            <input type="submit" value="Edit Profile" id="edit_artist" name="edit_artist">
        </div>

    </div>
</form>

</BODY>
</HTML>