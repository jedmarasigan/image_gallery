<HTML>
<HEAD>
    <%@ include file="navbar.jsp" %>
    <meta charset="utf-8">
    <link rel="stylesheet" href="create.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <TITLE>Create</TITLE>
</HEAD>
<BODY>
<div id="title_border">
    <p id="title">Create a New Artist or Gallery</p>
</div>

<div id="boxes_container">
    <form method="get" action="create_gallery.jsp">
        <div id="gallery_box">
            <p id="gallery_box_title">Create a New Gallery</p>
            <input type = "submit" class = "gallery_box_button" value="Create Gallery">
        </div>
    </form>

    <form method="get" action="create_artist.jsp">
        <div id="artist_box">
            <p id="artist_box_title">Create a New Artist</p>
            <input type = "submit" class = "artist_box_button" value="Create Artist">
        </div>
    </form>
</div>


</BODY>
</HTML>