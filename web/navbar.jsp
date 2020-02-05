<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="navbar.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css'/>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
<div class="nav_bar_container">
    <div class="nav_bar">
        <div class="logo">
            <a href="index.jsp"><h1>Snippit</h1></a>
        </div>
        <a class="nav_bar_item" href="create.jsp">Create</a>
        <a class="nav_bar_item" href="gallery.jsp">Galleries</a>
        <a class="nav_bar_item" href="artist.jsp">Artists</a>
        <a class="nav_bar_item" href="find_artist.jsp">Find Artists</a>
        <a class="nav_bar_item" href="find_image.jsp">Find Images</a>
        <a class="nav_bar_item" href="add_img.jsp">Add Image</a>
    </div>
    <div class="handle">Menu
        <a href="javascript:void(0);" class="icon" onclick="myFunction()">&#9776</a>
    </div>
</div>
<div id="wrapper">
    <div style="border: 1px solid white; min-height: 55.2px;">
        <!-- You can create left side elements here (without any float specification in CSS) -->
    </div>
    <div class="clear"></div>
</div>
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script>
    $(function () {
        $('a').each(function (){
            if ($(this).prop('href') === window.location.href){
                $(this).addClass('active');
                $(this).parents('.nav_bar_container').addClass('active');
            }
        });
    });
</script>

<script>
    $('.handle').on('click', function(){
        $('.nav_bar').toggleClass('showing');
    })
</script>


</body>
