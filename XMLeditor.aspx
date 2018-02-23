<%@ Page Language="C#" AutoEventWireup="true" CodeFile="XMLeditor.aspx.cs" ValidateRequest="false"  Inherits="XMLeditor" %>

<!DOCTYPE html>
<html>
<head>
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
      <script src="js/xmllint.js"></script>  
    <script src="js/jquery.min.js"></script>
    <script src="Parsing.js"></script>
    <script src="js/svg.js"></script>
    <script src="js/CMLJS.js"></script>
    <script>
        function test() {
            Drawing("draw", txtDraw);
        }

   </script>
   <script >
       $(document).ready(function () {
           test();
       })
   </script> 
  
<title>CML</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style-editor.css" rel="stylesheet" type="text/css" media="all" />
<link href='http://fonts.googleapis.com/css?family=Lato:400,300,600,700,800' rel='stylesheet' type='text/css'>

<link rel="stylesheet" type="text/css" href="css/lightbox.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
</head>
    <body style="overflow:hidden;" >
    <form id="Form1" runat="server" >
<div class="wrap" > 
	<div class="pages-top_master">
        <%--<div class="header-top_master">
             <a href="HomePage.aspx"><img src="images/Home Logo.png"  class="home-user" style="margin-right:18.5%;"/></a>
	        <div class="logo_master ">
				<a href="HomePage.aspx"><img src="images/best.png"  alt=""/></a>
			 </div>	
		</div>
        --%>

        <div class="header-top_master">
            <%--<a href="HomePage.aspx"><img src="images/Home Logo.png"  class="home"/></a>--%>
            <div class="h_menu4">
                <!-- start h_menu4 -->
				<a class="toggleMenu" href="#">Menu</a>
				<ul class="nav">
                   <li>
                       <a href="HomePage.aspx">Home</a></li>
                    <li>
                        <a href="js/CMLJS.js" target="_blank">Download JS Library </a>
					</li>
                    	<li class="active"><a href="#">Editors</a>
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
	        <div class="logo_master ">
				<a href="HomePage.aspx"><img src="images/best.png"  alt=""/></a>
			 </div>	
		</div>
        

        <!-- end header_main4 -->
 </div>
   </div>
	 <div class="main">        
    <div class="row"  style="margin-top:-30px;width:1380px;height:550px">
  <div class="col-lg-1" style="width:480px;height:550px;padding-top:-1px; background-color:rgba(245, 242, 246, 0.94);"id="grid">
      <textarea id="txtDraw"  runat="server" style="width:100%; height:495px;border:inset;border-radius:10px;margin-left:10px;margin-top:-18px"  ></textarea>
      <%--<textarea id="txtDraw"  style="width:100%; height:495px"></textarea>--%>
      
      <input id="btn_Draw" type="button" value="DRAW" class="carrot-flat-button" style="margin-top:2.5px ;margin-left:12px" onclick="test()"/>

     <input id ="btnDrawXML" type="button" style ="visibility:hidden" onclick ="test();">

      </div>
  <div id="draw"class ="col-lg-1"style="background-color:rgba(245, 240, 240, 0.95);width:900px;height:550px;">
  </div>
          </div>
        
		</div>
		<div class="footer-bottom_master"> 
	     	  	<div class="copy_master">
				   <p>© All Rights reserved to Cicuit</p>
			    </div>	 
       </div>
</form>
</body> 
</html>