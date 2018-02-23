<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="HomePage" %>
<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<title>Circuit ML Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href='http://fonts.googleapis.com/css?family=Lato:400,300,600,700,800' rel='stylesheet' type='text/css'>
 <script>


     function stextlogin() {
         var x = document.getElementById("LBlogin");
         x.style.color = '#f6a244';
     }
     function stextaccount() {
         var y = document.getElementById("LBaccount");
         y.style.color = '#f6a244';
     }

     function htextlogin() {
         var x = document.getElementById("LBlogin");
         x.style.color = 'white';
     }
     function htextaccount() {
         var y = document.getElementById("LBaccount");
         y.style.color = 'white';
     }



 </script>  
<script src="js/jquery.min.js"></script>
<!---strat-slider---->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
	    <link rel="stylesheet" type="text/css" href="css/slider.css" />
		<script type="text/javascript" src="js/modernizr.custom.28468.js"></script>
		<script type="text/javascript" src="js/jquery.cslider.js"></script>
			<script type="text/javascript">
			    $(function () {

			        $('#da-slider').cslider({
			            autoplay: true,
			            bgincrement: 450
			        });

			    });
			</script>
		<!---//strat-slider---->
<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
<link href="css/magnific-popup.css" rel="stylesheet" type="text/css">
		<script>
		    $(document).ready(function () {
		        $('.popup-with-zoom-anim').magnificPopup({
		            type: 'inline',
		            fixedContentPos: false,
		            fixedBgPos: true,
		            overflowY: 'auto',
		            closeBtnInside: true,
		            preloader: false,
		            midClick: true,
		            removalDelay: 300,
		            mainClass: 'my-mfp-zoom-in'
		        });
		    });
		</script>
		
</head>
<body style="overflow:hidden;" >
    <form id="Form1" runat="server">
<div class="wrap"> 
	<div class="header-top">
            <div class="logo_home">
				<a href="HomePage.aspx"><img src="images/best.png"  style="height:280px ; width:390px;" width:; alt=""/></a>
			 </div>
		     <div class="h_menu4"><!-- start h_menu4 -->
				<a class="toggleMenu" href="#">Menu</a>
				<ul class="nav">
                   <li class="active">
                       <a href="index.html">Home</a></li>
                    <li>
                        <a href="js/CMLJS.js" target="_blank">Download JS Library </a>
					</li>
                    	<li><a href="#">Editors</a>
						<ul>
							<li>
                                <a href="DragADrop.aspx" >Darg & Drop</a>
							</li>
                            <li>
                                <a href="XMLeditor.aspx" >Xml Editor</a>
                            </li> 

						</ul>
					</li>
                    <li>
                        <a href="#">Documentation</a>
                    </li>
                    
                    <li>
                        <a href="#">About</a>
                    </li>
				</ul>

				<script type="text/javascript" src="js/nav.js"></script>
			</div>
        <!-- end h_menu4 -->
		
        	<div class="clear"></div>
		</div>
    
    <!-- end header_main4 -->
        <div class="slider">
				<!---start-da-slider----->
			  <div id="da-slider" class="da-slider">
				  <div class="da-slide">
					<h1>First schematic XML based language </h1>
					<p>Know more About Us.</p>
					<a href="#about" class="da-link">Show More</a>
				  </div>
				  <div class="da-slide">
					<h1>You Can Drag & Drob Your Ciruit</h1>
					<p>Try It</p>
					<a href="DragADrop.aspx" class="da-link">Show More</a>
				  </div>
				  <div class="da-slide">
					<h1>You Can Write Your XML Code</h1>
					<p>Write It</p>
					<a href="#about" class="da-link">Show More</a>
				  </div>
				  <div class="da-slide">
					<h1>You Can Generat Your XML Code</h1>
					<p>Show It</p>
					<a href="#about" class="da-link">Show More</a>
				  </div>		
				  <nav class="da-arrows">
					<span class="da-arrows-prev"></span>
				 	<span class="da-arrows-next"></span>
				  </nav>
			   </div>
 		       <!---//End-da-slider----->

	      </div>
	 </div>
        </form>
    </body>
    </html>