﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DragADrop.aspx.cs" ValidateRequest="false" Inherits="DragADrop" %>

<!DOCTYPE HTML>
<html>
<head>
   

    <link href="css/style.css" rel="stylesheet" />
  <script src="js/jquery-1.10.2.js"></script>
    <script src="js/jquery-ui.js"></script>
      <link rel="stylesheet" href="css/jquery-ui.css"/>
      <script src="js/svg.js"></script>
     <script src="js/svg.draggable.js"></script>
    <script src="js/CMLJS.js"></script>
    <link href="js/jquery.contextMenu.css" rel="stylesheet" />
    <script src="js/jquery.contextMenu.js"></script>

  <script>
      $(document).ready(function () {
          $("#accordion").accordion({
              heightStyle: "content"
          });
      });
  </script>
    <script id="generetXMLscr">
        function generateXML() {
            var cmltag = '<cml id="cml1" height="540" width="1070" scale="20">' + BtnHandlefun();
            
            document.getElementById('<%=Hidden1.ClientID%>').value = cmltag;
            var btn_ = document.getElementById('<%= btn_xml.ClientID%>');

            btn_.click();
            //return cmltag;    
        }



    </script>


    <script>
        $(function () {
            setNavigation();
        });

        function setNavigation() {
            var path = window.location.pathname.split('/').pop();;
            //alert(path);
            //path = path.replace(/\/$/, "");
            //path = decodeURIComponent(path);

            $(".nav a").each(function () {
                var href = $(this).attr('href');
                if (path === href) {
                    if (path == 'DragADrop.aspx' || path == 'XMLeditor.aspx') {
                        $('#').closest('li').addClass('active');
                    }
                    else {
                        $(this).closest('li').addClass('active');
                    }
                }
            });
        }
</script>


<title>Drag & Drop Editor</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style-editor.css" rel="stylesheet" type="text/css" media="all" />
<link href='http://fonts.googleapis.com/css?family=Lato:400,300,600,700,800' rel='stylesheet' type='text/css'>
<%--<script src="js/jquery.min.js"></script>--%>
<link rel="stylesheet" type="text/css" href="css/lightbox.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
   <%-- <script src="jquery-1.10.2.js"></script>--%>
    <%--<link href="jquery-ui.css" rel="stylesheet" />--%>
   <%-- <script src="jquery-ui.js"></script>--%>
    <style type="text/css">
        .auto-style1 {
            height: 64px;
        }
    </style>
</head>
<body style="overflow:hidden;">
    <form id="Form1" runat="server" >
         <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
          <input id="Hidden1" runat="server" type="hidden" value="" />
<div class="wrap" > 
	<div class="pages-top_master">
        <div class="header-top_master">
            <%--<a href="HomePage.aspx"><img src="images/Home Logo.png"  class="home"/></a>--%>
            
	        <div class="logo_master " style="margin-top:-100px">
				<a href="Home.aspx"><img src="images/best.png"  alt=""/></a>
			 </div>	
		</div>
        <!-- end header_main4 -->
 </div>
   
<%--    <div class="header-top">
            <div class="logo_home">
				<a href="HomePage.aspx"><img src="images/best.png" alt=""/></a>
			 </div>--%>
		     <div class="h_menu4" style="margin-top:-80px"><!-- start h_menu4 -->
				<a class="toggleMenu" href="#">Menu</a>
				<ul class="nav">
                   <li>
                       <a href="Home.aspx">Home</a></li>
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
                        <a href="About.aspx">About</a>
                    </li>
                     <li>
                        <a href="Contact.aspx">Contact</a>
                    </li>
				</ul>

				<script type="text/javascript" src="js/nav.js"></script>
			</div>
        <!-- end h_menu4 -->
		
        	<div class="clear"></div>
		</div>
    

</div>
	 <div class="main" style="margin-top:-25px">  
          <%--<div id="grid" style="width:1000px;height:530px"></div>--%>
      <div class="row"  style="margin-top:-30px;width:1500px;height:550px">
  <div class="col-lg-1" style="width:20%;height:550px;padding-top:0px;background-color:#aaa2a2" >
      
 <div id="accordion" style="margin-left:7px;border:thin;border-radius:10px;padding-top:8px">
  <h3 style="background-color:#1a1d4f;color:white">Essentials Elements</h3>
  <div style="background-color:#aaa2a2;overflow:hidden">
    <span style="margin-top:-15px;margin-left:-25px"><img class="toolbox-images"  src="images/Wire.png" onclick="myfun('Wire')" id="Wire"/></span>
    
     
  </div>
  <h3  style="background-color:#1a1d4f;color:white">Ideals Sources</h3>
  <div style="background-color:#aaa2a2;overflow:hidden">
<div>
    <div style=" float:left;margin-left:-15px;margin-top:-50px;">
        <img alt="" src="images/CircleDCVoltageSource.png" class="toolbox-images" onclick="myfun('CircleDCVoltageSource')" id="CircleDCVoltageSource"/></div>
    <div style="margin-bottom:-3px; float:right;margin-top:-50px;">
        <img alt="" src="images/DCVoltageSource.png" class="toolbox-images" onclick="myfun('DCVoltageSource')" id="DCVoltageSource" /></div>
    </div>

 <div style="">
    <div style=" float:left;margin-left:-15px;margin-top:-20px;">
        <img alt="" src="images/CurrentSource.png" class="toolbox-images" onclick="myfun('DCCurrentSource')" id="DCCurrentSource" /></div>

  </div>
  </div>
  <h3 style="background-color:#1a1d4f;color:white">Passive Elements</h3>
  <div style="background-color:#aaa2a2">
     <div>
    <div style=" float:left;margin-left:-15px;margin-top:-50px;">
        <img alt="" src="images/Resistor.png" class="toolbox-images" onclick="myfun('Resistor')" id="Resistor"/></div>
    <div style="margin-bottom:-3px; float:right;margin-top:-50px;">
        <img alt="" src="images/VRes1.png" class="toolbox-images" onclick="myfun('VarResistor')" id="VarResistor"/></div>
    </div>
        <div style="">
    <div style=" float:left;margin-left:-15px;margin-top:-20px;">
        <img alt="" src="images/Capacitor.png" class="toolbox-images" onclick="myfun('Capacitor')" id="Capacitor" /></div>
    <div style="margin-bottom:-3px; float:right;margin-top:-20px;">
        <img alt="" src="images/VarCapacitor.png" class="toolbox-images" onclick="myfun('VarCapacitor')" id="VarCapacitor" /></div>
    </div>
      <div style="">
    
            <div style="margin-left:-90px; float:left;margin-top:12px;">
        <img alt="" src="images/Polarized Capacitor1.png" class="toolbox-images" onclick="myfun('PolarizedCapacitor')" id="PolarizedCapacitor"  />

    </div>
           <div style="margin-left:-20px; float:right;margin-top:-15px;padding-right:-3px">
        <img alt="" src="images/VarPolarized Capacitor.png" class="toolbox-images" onclick="myfun('VarPolarizedCapacitor')" id="VarPolarizedCapacitor" />

    </div>
 
    </div>

  </div>
     <h3 style="background-color:#1a1d4f;color:white">Diodes</h3>
  <div style="overflow:hidden;background-color:#aaa2a2">
         <div >
    <div style=" float:left;margin-left:-15px;margin-top:-50px;">
        <img alt="" src="images/TunnelDiode.png" class="toolbox-images" onclick="myfun('TunnelDiode')" id="TunnelDiode"/></div>
    <div style="margin-bottom:-3px; float:right;margin-top:-50px;">
        <img alt="" src="images/PhotoDiode.png"  class="toolbox-images" onclick="myfun('PhotoDiode')" id="PhotoDiode" /></div>
    </div>
       <div style="">
    <div style=" float:left;margin-left:-15px;margin-top:-20px;">
        <img alt="" src="images/ConstantCurrentDiode.png"  class="toolbox-images" onclick="myfun('ConstCurrentDiode')" id="ConstCurrentDiode"/></div>
    <div style="margin-bottom:-3px; float:right;margin-top:-20px;">
        <img alt="" src="images/PINdiode.png"  class="toolbox-images"onclick="myfun('PINDiode')" id="PINDiode"/></div>
    </div>

          <div style="">
    
            <div style="margin-left:-90px; float:left;margin-top:12px;">
        <img alt="" src="images/VaractorDiode.png"  class="toolbox-images" onclick="myfun('VaractorDiode')" id="VaractorDiode"/>

    </div>
           <div style="margin-left:-20px; float:right;margin-top:-15px;padding-right:-3px">
        <img alt="" src="images/SchottyDiode.png"  class="toolbox-images"  onclick="myfun('SchottyDiode')" id="SchottyDiode"/>

    </div>
 
    </div>

      <div style="">
    
            <div style="margin-left:-12px; float:left;margin-top:-1px;padding-top:4px">
        <img alt="" src="images/GreenLED.png" class="toolbox-images" onclick="myfun('LED')" id="LED"/>

    </div>
 
    </div>

  </div>
     <h3 style="background-color:#1a1d4f;color:white">Switches</h3>
  <div style="overflow:hidden;background-color:#aaa2a2">
               <div >
    <div style=" float:left;margin-left:-15px;margin-top:-50px;">
        <img alt="" src="images/SPSTSwitch.png" class="toolbox-images" onclick="myfun('SPSTSwitch')" id="SPSTSwitch"/></div>
    <div style="margin-bottom:-3px; float:right;margin-top:-50px;">
        <img alt="" src="images/SPDTSwitch.png"class="toolbox-images" onclick="myfun('SPDTSwitch')" id="SPDTSwitch"/></div>
    </div>
       <div style="">
    <div style=" float:left;margin-left:-15px;margin-top:-20px;">
        <img alt="" src="images/DPSTSwitch.png" class="toolbox-images" onclick="myfun('DPSTSwitch')" id="DPSTSwitch" /></div>

  </div>
      </div>

     <h3 style="background-color:#1a1d4f;color:white">Transistors</h3>
  <div style="overflow:hidden;background-color:#aaa2a2">
       <div >
    <div style=" float:left;margin-left:-15px;margin-top:-50px;">
        <img alt="" src="images/NPNTransistor.png" class="transistors-images" onclick="myfun('NPNTransistor')" id="NPNTransistor"/></div>
    <div style="margin-bottom:-3px; float:right;margin-top:-50px;">
        <img alt="" src="images/PNPTransistor.png"class="transistors-images" onclick="myfun('PNPTransistor')" id="PNPTransistor"/></div>
    </div>
       
      <div style="">
    <%--<div style=" float:left;margin-left:-15px;margin-top:-40px;">
        <img alt="" src="images/DPSTSwitch.png" class="toolbox-images" onclick="myfun('DPSTSwitch')" id="Img3" /></div>--%>

  </div>
      </div>

</div>

    <div class="row">
         
      
         <a href="#" target="_blank"  onclick="generateXML();"> <asp:Button runat="server" id="btn_xml" Text="Generate XML" class="carrot-flat-button-xml" style="margin-left:50px;visibility:visible;text-align:center;"  OnClick="btn_xml_Click" /></a>
     </div>
  </div>
       <div class ="col-lg-1" style="background-color:#FFF;width:80%;height:550px;padding-top:0px;padding-left:0px"  id="dd">
       </div>
    </div>      

<%--		</div>
		<div class="footer-bottom_master"> 
	     	  	<div class="copy_master">
				   <p>© All Rights reserved to Cicuit</p>
			    </div>	 
       </div>--%>

         	<div class="copy" style="margin-top:-15px">
            <p class="link"><span>&copy; 2014 All rights reserved to CircuitML &nbsp;</span></p>
		</div>
       
</form>

  <script>


      var svgdiv = document.getElementById("dd");
      svgdiv.addEventListener("click", getPosition, false);
      var dragendstr;
      var x = new Number();
      var y = new Number();
      var flag = 0;
      var Element = null;
      var arrow;
      var objcounter = 0;
      var CircuitElements = [];
      var rect;
      var Point = { "X": x, "Y": y };
      var PointAfterDrag = { "X": x, "Y": y };
      var width=1070;
      var height=540;
      var scale=20;


      function MouseDwnFun(event) {

          if (event.which == 1) {
              var iindex = $(this).attr("index");
          }

          if (event.which == 3) {
              // alert("Entered RightClick");
              var objectsender = this;
              svgdiv.oncontextmenu = function () { return false; };
              var id = $(this).attr('ID');
              //alert("ID = " + id);
              var iindex = $(this).attr("index");

              //for (var i = 0; i < CircuitElements.length; i++)
              //{
              //    CircuitElements[i].get(0).stroke({ width: 0 }).fill({ color: 'white', opacity: 0.0 });

              //}


              //CircuitElements[iindex].get(0).stroke({ width: 1, color: 'red', dasharray: '3,3' });

              //alert(" id = " + id);

              $(function () {
                  //alert(this.nodeName);
                  $.contextMenu({
                      //selector: "#" + this.attr('ElementID') + "'",
                      selector: "#" + id,
                      callback: function (key, options) {
                          //var m = "clicked: " + key;
                          //alert(m);
                          switch (key) {
                              case 'Rotate By 90 CW':
                                  var stpoint = { "X": CircuitElements[iindex].attr('StartPointX'), "Y": CircuitElements[iindex].attr('StartPointY') };
                                  RotateElementBy(CircuitElements[iindex], parseInt(90), stpoint);
                                  break;
                              case 'Rotate By -90 CW':
                                  var stpoint = { "X": CircuitElements[iindex].attr('StartPointX'), "Y": CircuitElements[iindex].attr('StartPointY') };
                                  RotateElementBy(CircuitElements[iindex], parseInt(-90), stpoint);
                                  break;
                              case 'Rotate By 45 CW':
                                  var stpoint = { "X": CircuitElements[iindex].attr('StartPointX'), "Y": CircuitElements[iindex].attr('StartPointY') };
                                  RotateElementBy(CircuitElements[iindex], parseInt(45), stpoint);
                                  break;
                              case 'Rotate By -45 CW':
                                  var stpoint = { "X": CircuitElements[iindex].attr('StartPointX'), "Y": CircuitElements[iindex].attr('StartPointY') };
                                  RotateElementBy(CircuitElements[iindex], parseInt(-45), stpoint);
                                  break;
                              case 'Delete':
                                  //alert("Before" + CircuitElements.length);
                                  this.remove();
                                  CircuitElements[iindex] = null;
                                  //alert("After" + CircuitElements.length);
                                  break;
                              case 'Flip Left':
                                  var stpoint = { "X": CircuitElements[iindex].attr('StartPointX'), "Y": CircuitElements[iindex].attr('StartPointY') };
                                  RotateElementBy(CircuitElements[iindex], parseInt(180), stpoint);
                                  break;
                              case 'Flip Right':
                                  var stpoint = { "X": CircuitElements[iindex].attr('StartPointX'), "Y": CircuitElements[iindex].attr('StartPointY') };
                                  RotateElementBy(CircuitElements[iindex], parseInt(-180), stpoint);
                                  break;
                              default:
                                  alert("Defualt");
                                  break;

                          }
                      },
                      items: {
                          "Delete": { name: "Delete", icon: "delete" },
                          "Rotate By 90 CW": { name: "Rotate90CW", icon: "Rotate90CW" },
                          "Rotate By -90 CW": { name: "Rotate-90CW", icon: "Rotate-90CW" },
                          "Rotate By 45 CW": { name: "Rotate45CW", icon: "Rotate45CW" },
                          "Rotate By -45 CW": { name: "Rotate-45CW", icon: "Rotate-45CW" },
                          "Flip Left": { name: "FlipLeft", icon: "FlipLeft" },
                          "Flip Right": { name: "FlipRight", icon: "FlipRight" }

                      }
                  });


              });

          }
      }

      function MouseOverFun(event) {
          var iindex = $(this).attr("index");
          CircuitElements[iindex].get(1).radius((5 * scale) / 25).fill('#000').stroke({ color: '#000', width: 1 });
          CircuitElements[iindex].get(2).radius((5 * scale) / 25).fill('#000').stroke({ color: '#000', width: 1 });

      }

      function MouseLeaveFun(event) {
          var iindex = $(this).attr("index");
          CircuitElements[iindex].get(1).radius((5 * scale) / 25).fill('none').stroke({ color: '#000', width: 0 });
          CircuitElements[iindex].get(2).radius((5 * scale) / 25).fill('none').stroke({ color: '#000', width: 0 });

      }

      function DPSTMouseOverFun(event) {
          var iindex = $(this).attr("index");
          CircuitElements[iindex].get(1).radius((5 * scale) / 25).fill('#000').stroke({ color: '#000', width: 1 });
          CircuitElements[iindex].get(2).radius((5 * scale) / 25).fill('#000').stroke({ color: '#000', width: 1 });
          CircuitElements[iindex].get(3).radius((5 * scale) / 25).fill('#000').stroke({ color: '#000', width: 1 });
          CircuitElements[iindex].get(4).radius((5 * scale) / 25).fill('#000').stroke({ color: '#000', width: 1 });
      }

      function DPSTMouseLeaveFun(event) {
          var iindex = $(this).attr("index");
          CircuitElements[iindex].get(1).radius((5 * scale) / 25).fill('none').stroke({ color: '#000', width: 0 });
          CircuitElements[iindex].get(2).radius((5 * scale) / 25).fill('none').stroke({ color: '#000', width: 0 });
          CircuitElements[iindex].get(3).radius((5 * scale) / 25).fill('none').stroke({ color: '#000', width: 0 });
          CircuitElements[iindex].get(4).radius((5 * scale) / 25).fill('none').stroke({ color: '#000', width: 0 });

      }

      function SPDTMouseOverFun(event) {
          var iindex = $(this).attr("index");
          CircuitElements[iindex].get(1).radius((3.5 * scale) / 25).fill('#000').stroke({ color: '#000', width: 1 });
          CircuitElements[iindex].get(2).radius((3.5 * scale) / 25).fill('#000').stroke({ color: '#000', width: 1 });
          CircuitElements[iindex].get(3).radius((3.5 * scale) / 25).fill('#000').stroke({ color: '#000', width: 1 });
      }

      function SPDTMouseLeaveFun(event) {
          var iindex = $(this).attr("index");
          CircuitElements[iindex].get(1).radius((3.5 * scale) / 25).fill('none').stroke({ color: '#000', width: 0 });
          CircuitElements[iindex].get(2).radius((3.5 * scale) / 25).fill('none').stroke({ color: '#000', width: 0 });
          CircuitElements[iindex].get(3).radius((3.5 * scale) / 25).fill('none').stroke({ color: '#000', width: 0 });

      }

      function RotateElementBy(elementobj, givenangle, startpoint)
      {


          var XendBeforeRotate = elementobj.attr('EndPointX');
          var YendBeforeRotate = elementobj.attr('EndPointY');
          //alert("End Point Before Rotate  X= " + XendBeforeRotate + "\t Y= " + YendBeforeRotate);

          var XStart = elementobj.attr('StartPointX');
          var YStart = elementobj.attr('StartPointY');

          //alert("Start Point Before Rotate  X= " + XStart + "\t Y= " + YStart);

          var X = XendBeforeRotate - XStart;
          var Y = YendBeforeRotate - YStart;
          var L = Math.sqrt((X * X) + (Y * Y));


          var Xdef = XendBeforeRotate - XStart;
          var Ydef = YendBeforeRotate - YStart;
          var InitialAngle;
          //var InitialAngle = 360 * (Math.atan(Ydef / Xdef)) / (2 * (Math.PI));
        //alert("Theeetaaaa ===  "+ 360 * (Math.atan(Ydef / Xdef)) / (2 * (Math.PI)));

          if (XendBeforeRotate >= XStart)
          {
              if (YendBeforeRotate > YStart)
              {
                  //alert("444444444");
                  InitialAngle = (360 * (Math.atan(Ydef / Xdef)) / (2 * (Math.PI)));
              }
                  ////// if (YendBeforeRotate < YStart)
              else
              {
                  //alert("111111111111");
                  InitialAngle = (360 * (Math.atan(Ydef / Xdef)) / (2 * (Math.PI)));
              }
          }
          else
          {
              if (YendBeforeRotate > YStart)
              {
                  //alert("3333333333333");
                  InitialAngle = 180-(360 * (Math.atan(Ydef / Xdef)) / (2 * (Math.PI)));
              }
                  ////// if (YendBeforeRotate < YStart)
              else
              {
                  //alert("22222222222");
                  InitialAngle = 180+(360 * (Math.atan(Ydef / Xdef)) / (2 * (Math.PI)));
              }
          }

          //alert("Initial Angle = " + InitialAngle);
          var XendAfterRotate = (L * Math.cos((2 * (Math.PI) * (InitialAngle + givenangle)) / 360)) + XStart;
          var YendAfterRotate = (L * Math.sin((2 * (Math.PI) * (InitialAngle + givenangle)) / 360)) + YStart;
          var AfterRotateEnd = { "X": XendAfterRotate, "Y": YendAfterRotate };
          AfterRotateEnd = PointApproximation(AfterRotateEnd);

          //alert("End Point After Rotate  X= " + XendAfterRotate + "\t Y= " + YendAfterRotate);

          //elementobj.rotate(givenangle, startpoint.X, startpoint.Y);
          elementobj.transform({ rotation: (givenangle+InitialAngle), cx: startpoint.X, cy: startpoint.Y })

          elementobj.attr('EndPointX', XendAfterRotate);
          elementobj.attr('EndPointY', YendAfterRotate);

          //alert(elementobj.attr('StartPointX') + "    " + elementobj.attr('StartPointY'));
          var XendBeforeRotate1 = elementobj.attr('EndPointX');
          var YendBeforeRotate1 = elementobj.attr('EndPointY');
          var XStart1 = elementobj.attr('StartPointX');
          var YStart1 = elementobj.attr('StartPointY');
          var Xdef1 = XendBeforeRotate1 - XStart1;
          var Ydef1 = YendBeforeRotate1 - YStart1;
          var InitialAngle1 = 360 * (Math.atan(Ydef1 / Xdef1)) / (2 * (Math.PI));
          //alert("Initial Angle After Rotation = " + InitialAngle1);

      }


      function myfun(str) {
          dragendstr = str;
          if (str != Element)
          {
              if (Element != null) {
                  document.getElementById(Element).style.borderColor = "#aaa2a2";

              }

              document.getElementById(str).style.borderColor = "#000";
              //document.getElementById('dd').style.cursor = "cross, auto";
              Element = str;
              flag = 1;
              //alert("str = " + str)
              
              //document.getElementById('dd').style.cursor = "cross, auto";
              //alert("element = " + Element)
          }
          else
          {
              flag = 0;
              Element = null;
              //flag = !flag;
          }
          //for (var i = 0; i < CircuitElements.length; i++) {
          //    CircuitElements[i].get(0).stroke({ width: 0 }).fill({ color: 'white', opacity: 0.0 });
          //}
          //if (flag == 1) {
          //    document.getElementById("Resistor").style.borderColor="#000";
          //}
          //else {
          //    document.getElementById("Resistor").style.borderColor = "#000";
          //}
      }

      function getPosition(event) {
          if (flag != 1)
              return;

          //flag = 0;
          if (event.x != undefined && event.y != undefined) {
              x = event.offsetX;
              y = event.offsetY;
          }
          else // Firefox method to get the position
          {

              if (typeof event.offsetX == "undefined" || typeof event.offsetY == "undefined") {
                  var targetOffset = $(event.target).offset();
                  x = event.offsetX = event.pageX - targetOffset.left;
                  y = event.offsetY = event.pageY - targetOffset.top;
              }

              //alert(parseFloat(event.offsetX));

              //x = event.clientX + document.body.scrollLeft +
              //    document.documentElement.scrollLeft;

              //y = event.clientY + document.body.scrollTop +
              //    document.documentElement.scrollTop;
              //alert(y);
          }

          Point.X = x;
          Point.Y = y;
          //alert("Before ceiling \n" + "Point x: " + Point.X + " \n Point y: " + Point.Y);
          //////
          Point = PointApproximation(Point)
          //alert("After ceiling \n" + "Point x: " + Point.X + " \n Point y: " + Point.Y);
          objcounter = objcounter + 1;
          //CircuitElements[objcounter].attr('StartPointX') = Point.X;
          //CircuitElements[objcounter].attr('StartPointY') = Point.Y;

          //for (var i = 0; i < CircuitElements.length; i++) {
          //    CircuitElements[i].get(0).stroke({ width: 0 }).fill({ color: 'white', opacity: 0.0 });
          //}

          DrawElement(Point);
          return Point;
      }

      function DrawElement(GivenDrawingPoint) {
          var DrawingPoint = GivenDrawingPoint;
          //Point=getPosition(event);
          switch (Element) {

              case 'NOT':
                  var notobj = draw.Not(DrawingPoint.X, DrawingPoint.Y, DrawingPoint.X + 4 * scale, DrawingPoint.Y);
                  SetElementAttrs(Element, notobj, DrawingPoint);
                  CircuitElements[objcounter - 1] = notobj;
                  if (true) {
                      CircuitElements[objcounter - 1].draggable();
                  }
                  CircuitElements[objcounter - 1].dragend = DragEndFun;
                  CircuitElements[objcounter - 1].on('mouseup', MouseDwnFun);

                  return CircuitElements[objcounter - 1];
                  break;

              case 'Resistor':
                  //var resobj = draw.Resistor(DrawingPoint.X, DrawingPoint.Y, DrawingPoint.X, DrawingPoint.Y + 4 * scale);
                  var resobj = draw.Resistor(DrawingPoint.X, DrawingPoint.Y, DrawingPoint.X + 4 * scale, DrawingPoint.Y);

                  SetElementAttrs(Element, resobj, DrawingPoint);
                  //SetVerticalElementAttrs(Element, resobj, DrawingPoint);
                  CircuitElements[objcounter - 1] = resobj;
                      CircuitElements[objcounter - 1].draggable();
                      CircuitElements[objcounter - 1].dragend = DragEndFun;
                  CircuitElements[objcounter - 1].on('mouseup', MouseDwnFun);
                  CircuitElements[objcounter - 1].on('mouseover', MouseOverFun);
                  CircuitElements[objcounter - 1].on('mouseleave', MouseLeaveFun);


                  return CircuitElements[objcounter - 1];
                  break;

              case 'VarResistor':
                  var vresobj = draw.VarResistor(DrawingPoint.X, DrawingPoint.Y, DrawingPoint.X + 4 * scale, DrawingPoint.Y);
                  var str = "";
                  SetElementAttrs(Element, vresobj, DrawingPoint);
                  CircuitElements[objcounter - 1] = vresobj;
                  CircuitElements[objcounter - 1].draggable();
                  CircuitElements[objcounter - 1].dragend = DragEndFun;
                  CircuitElements[objcounter - 1].on('mouseup', MouseDwnFun);
                  CircuitElements[objcounter - 1].on('mouseover', MouseOverFun);
                  CircuitElements[objcounter - 1].on('mouseleave', MouseLeaveFun);

                  return CircuitElements[objcounter - 1];
                  break;

              case 'Capacitor':
                  var capobj = draw.Capacitor(DrawingPoint.X, DrawingPoint.Y, DrawingPoint.X + 4 * scale, DrawingPoint.Y);
                  SetElementAttrs(Element, capobj, DrawingPoint);
                  CircuitElements[objcounter - 1] = capobj;
                  CircuitElements[objcounter - 1].draggable();
                  CircuitElements[objcounter - 1].dragend = DragEndFun;
                  CircuitElements[objcounter - 1].on('mouseup', MouseDwnFun);
                  CircuitElements[objcounter - 1].on('mouseover', MouseOverFun);
                  CircuitElements[objcounter - 1].on('mouseleave', MouseLeaveFun);

                  return CircuitElements[objcounter - 1];
                  break;

              case 'VarCapacitor':
                  var vcapobj = draw.VarCapacitor(DrawingPoint.X, DrawingPoint.Y, DrawingPoint.X + 4 * scale, DrawingPoint.Y);
                  SetElementAttrs(Element, vcapobj, DrawingPoint);
                  CircuitElements[objcounter - 1] = vcapobj;
                  CircuitElements[objcounter - 1].draggable();
                  CircuitElements[objcounter - 1].dragend = DragEndFun;
                  CircuitElements[objcounter - 1].on('mouseup', MouseDwnFun);
                  CircuitElements[objcounter - 1].on('mouseover', MouseOverFun);
                  CircuitElements[objcounter - 1].on('mouseleave', MouseLeaveFun);

                  return CircuitElements[objcounter - 1];
                  break;

              case 'PolarizedCapacitor':
                  var pcapobj = draw.PolarizedCapacitor(DrawingPoint.X, DrawingPoint.Y, DrawingPoint.X + 4 * scale, DrawingPoint.Y);
                  SetElementAttrs(Element, pcapobj, DrawingPoint);
                  CircuitElements[objcounter - 1] = pcapobj;
                  CircuitElements[objcounter - 1].draggable();
                  CircuitElements[objcounter - 1].dragend = DragEndFun;
                  CircuitElements[objcounter - 1].on('mouseup', MouseDwnFun);
                  CircuitElements[objcounter - 1].on('mouseover', MouseOverFun);
                  CircuitElements[objcounter - 1].on('mouseleave', MouseLeaveFun);

                  return CircuitElements[objcounter - 1];
                  break;

              case 'VarPolarizedCapacitor':
                  var vpcapobj = draw.VarPolarizedCapacitor(DrawingPoint.X, DrawingPoint.Y, DrawingPoint.X + 4 * scale, DrawingPoint.Y);
                  SetElementAttrs(Element, vpcapobj, DrawingPoint);
                  CircuitElements[objcounter - 1] = vpcapobj;
                  CircuitElements[objcounter - 1].draggable();
                  CircuitElements[objcounter - 1].dragend = DragEndFun;
                  CircuitElements[objcounter - 1].on('mouseup', MouseDwnFun);
                  CircuitElements[objcounter - 1].on('mouseover', MouseOverFun);
                  CircuitElements[objcounter - 1].on('mouseleave', MouseLeaveFun);

                  return CircuitElements[objcounter - 1];
                  break;

              case 'Wire':
                  var wireobj = draw.Wire(DrawingPoint.X, DrawingPoint.Y, DrawingPoint.X + 4 * scale, DrawingPoint.Y, 'black');
                  SetElementAttrs(Element, wireobj, DrawingPoint);
                  //wireobj.dx(30);
                  //wireobj.dy(40);
                  //alert("wireobj.dy" + wireobj.y());
                  CircuitElements[objcounter - 1] = wireobj;
                  CircuitElements[objcounter - 1].draggable();
                  CircuitElements[objcounter - 1].dragend = DragEndFun;
                  CircuitElements[objcounter - 1].on('mouseup', MouseDwnFun);
                  CircuitElements[objcounter - 1].on('mouseover', MouseOverFun);
                  CircuitElements[objcounter - 1].on('mouseleave', MouseLeaveFun);

                  return CircuitElements[objcounter - 1];
                  break;

              case 'PINDiode':
                  var pindiodeobj = draw.PINdiode(DrawingPoint.X, DrawingPoint.Y, DrawingPoint.X + 4 * scale, DrawingPoint.Y);
                  SetElementAttrs(Element, pindiodeobj, DrawingPoint);
                  CircuitElements[objcounter - 1] = pindiodeobj;
                  CircuitElements[objcounter - 1].draggable();
                  CircuitElements[objcounter - 1].dragend = DragEndFun;
                  CircuitElements[objcounter - 1].on('mouseup', MouseDwnFun);
                  CircuitElements[objcounter - 1].on('mouseover', MouseOverFun);
                  CircuitElements[objcounter - 1].on('mouseleave', MouseLeaveFun);

                  return CircuitElements[objcounter - 1];
                  break;

              case 'LED':
                  var LEDobj = draw.LED(DrawingPoint.X, DrawingPoint.Y, DrawingPoint.X + 4 * scale, DrawingPoint.Y, 'LimeGreen');
                  SetElementAttrs(Element, LEDobj, DrawingPoint);
                  CircuitElements[objcounter - 1] = LEDobj;
                  CircuitElements[objcounter - 1].draggable();
                  CircuitElements[objcounter - 1].dragend = DragEndFun;
                  CircuitElements[objcounter - 1].on('mouseup', MouseDwnFun);
                  CircuitElements[objcounter - 1].on('mouseover', MouseOverFun);
                  CircuitElements[objcounter - 1].on('mouseleave', MouseLeaveFun);

                  return CircuitElements[objcounter - 1];
                  break;

              case 'PhotoDiode':
                  var PhotoDiodeobj = draw.PhotoDiode(DrawingPoint.X, DrawingPoint.Y, DrawingPoint.X + 4 * scale, DrawingPoint.Y, 'LimeGreen');
                  SetElementAttrs(Element, PhotoDiodeobj, DrawingPoint);
                  CircuitElements[objcounter - 1] = PhotoDiodeobj;
                  CircuitElements[objcounter - 1].draggable();
                  CircuitElements[objcounter - 1].dragend = DragEndFun;
                  CircuitElements[objcounter - 1].on('mouseup', MouseDwnFun);
                  CircuitElements[objcounter - 1].on('mouseover', MouseOverFun);
                  CircuitElements[objcounter - 1].on('mouseleave', MouseLeaveFun);

                  return CircuitElements[objcounter - 1];
                  break;

              case 'VaractorDiode':
                  var VaractorDiodeobj = draw.VaractorDiode(DrawingPoint.X, DrawingPoint.Y, DrawingPoint.X + 4 * scale, DrawingPoint.Y);
                  SetElementAttrs(Element, VaractorDiodeobj, DrawingPoint);
                  CircuitElements[objcounter - 1] = VaractorDiodeobj;
                  CircuitElements[objcounter - 1].draggable();
                  CircuitElements[objcounter - 1].dragend = DragEndFun;
                  CircuitElements[objcounter - 1].on('mouseup', MouseDwnFun);
                  CircuitElements[objcounter - 1].on('mouseover', MouseOverFun);
                  CircuitElements[objcounter - 1].on('mouseleave', MouseLeaveFun);

                  return CircuitElements[objcounter - 1];
                  break;
              case 'TunnelDiode':
                  var TunnelDiodeobj = draw.TunnelDiode(DrawingPoint.X, DrawingPoint.Y, DrawingPoint.X + 4 * scale, DrawingPoint.Y);
                  SetElementAttrs(Element, TunnelDiodeobj, DrawingPoint);
                  CircuitElements[objcounter - 1] = TunnelDiodeobj;
                  CircuitElements[objcounter - 1].draggable();
                  CircuitElements[objcounter - 1].dragend = DragEndFun;
                  CircuitElements[objcounter - 1].on('mouseup', MouseDwnFun);
                  CircuitElements[objcounter - 1].on('mouseover', MouseOverFun);
                  CircuitElements[objcounter - 1].on('mouseleave', MouseLeaveFun);

                  return CircuitElements[objcounter - 1];
                  break;

              case 'SchottyDiode':
                  var SchottyDiodeobj = draw.SchottyDiode(DrawingPoint.X, DrawingPoint.Y, DrawingPoint.X + 4 * scale, DrawingPoint.Y);
                  SetElementAttrs(Element, SchottyDiodeobj, DrawingPoint);
                  CircuitElements[objcounter - 1] = SchottyDiodeobj;
                  CircuitElements[objcounter - 1].draggable();
                  CircuitElements[objcounter - 1].dragend = DragEndFun;
                  CircuitElements[objcounter - 1].on('mouseup', MouseDwnFun);
                  CircuitElements[objcounter - 1].on('mouseover', MouseOverFun);
                  CircuitElements[objcounter - 1].on('mouseleave', MouseLeaveFun);

                  return CircuitElements[objcounter - 1];
                  break;

              case 'ConstCurrentDiode':
                  var ConstCurrentDiodeobj = draw.ConstCurrentDiode(DrawingPoint.X, DrawingPoint.Y, DrawingPoint.X + 4 * scale, DrawingPoint.Y);
                  SetElementAttrs(Element, ConstCurrentDiodeobj, DrawingPoint);
                  CircuitElements[objcounter - 1] = ConstCurrentDiodeobj;
                  CircuitElements[objcounter - 1].draggable();
                  CircuitElements[objcounter - 1].dragend = DragEndFun;
                  CircuitElements[objcounter - 1].on('mouseup', MouseDwnFun);
                  CircuitElements[objcounter - 1].on('mouseover', MouseOverFun);
                  CircuitElements[objcounter - 1].on('mouseleave', MouseLeaveFun);

                  return CircuitElements[objcounter - 1];
                  break;

              case 'DCVoltageSource':
                  var DCVoltageSourceobj = draw.DCVoltageSource(DrawingPoint.X, DrawingPoint.Y, DrawingPoint.X + 4 * scale, DrawingPoint.Y);
                  SetElementAttrs(Element, DCVoltageSourceobj, DrawingPoint);
                  CircuitElements[objcounter - 1] = DCVoltageSourceobj;
                  CircuitElements[objcounter - 1].draggable();
                  CircuitElements[objcounter - 1].dragend = DragEndFun;
                  CircuitElements[objcounter - 1].on('mouseup', MouseDwnFun);
                  CircuitElements[objcounter - 1].on('mouseover', MouseOverFun);
                  CircuitElements[objcounter - 1].on('mouseleave', MouseLeaveFun);
                  return CircuitElements[objcounter - 1];
                  break;

              case 'CircleDCVoltageSource':
                  var CircleDCVoltageSourceobj = draw.CircleDCVoltageSource(DrawingPoint.X, DrawingPoint.Y, DrawingPoint.X + 4 * scale, DrawingPoint.Y);
                  SetElementAttrs(Element, CircleDCVoltageSourceobj, DrawingPoint);
                  CircuitElements[objcounter - 1] = CircleDCVoltageSourceobj;
                  CircuitElements[objcounter - 1].draggable();
                  CircuitElements[objcounter - 1].dragend = DragEndFun;
                  CircuitElements[objcounter - 1].on('mouseup', MouseDwnFun);
                  CircuitElements[objcounter - 1].on('mouseover', MouseOverFun);
                  CircuitElements[objcounter - 1].on('mouseleave', MouseLeaveFun);

                  return CircuitElements[objcounter - 1];
                  break;
              case 'DCCurrentSource':
                  var DCCurrentSourceobj = draw.DCCurrentSource(DrawingPoint.X, DrawingPoint.Y, DrawingPoint.X + 4 * scale, DrawingPoint.Y);
                  SetElementAttrs(Element, DCCurrentSourceobj, DrawingPoint);
                  CircuitElements[objcounter - 1] = DCCurrentSourceobj;
                  CircuitElements[objcounter - 1].draggable();
                  CircuitElements[objcounter - 1].dragend = DragEndFun;
                  CircuitElements[objcounter - 1].on('mouseup', MouseDwnFun);
                  CircuitElements[objcounter - 1].on('mouseover', MouseOverFun);
                  CircuitElements[objcounter - 1].on('mouseleave', MouseLeaveFun);

                  return CircuitElements[objcounter - 1];
                  break;

              case 'SPSTSwitch':
                  var SPSTSwitchobj = draw.SPSTSwitch(DrawingPoint.X, DrawingPoint.Y, DrawingPoint.X + 4 * scale, DrawingPoint.Y);
                  SetElementAttrs(Element, SPSTSwitchobj, DrawingPoint);
                  CircuitElements[objcounter - 1] = SPSTSwitchobj;
                  CircuitElements[objcounter - 1].draggable();
                  CircuitElements[objcounter - 1].dragend = DragEndFun;
                  CircuitElements[objcounter - 1].on('mouseup', MouseDwnFun);
                  CircuitElements[objcounter - 1].on('mouseover', MouseOverFun);
                  CircuitElements[objcounter - 1].on('mouseleave', MouseLeaveFun);

                  return CircuitElements[objcounter - 1];
                  break;

              case 'DPSTSwitch':
                  var DPSTSwitchobj = draw.DPSTSwitch(DrawingPoint.X, DrawingPoint.Y, DrawingPoint.X, DrawingPoint.Y + 25, DrawingPoint.X + 4 * scale, DrawingPoint.Y, DrawingPoint.X + 4 * scale, DrawingPoint.Y + 25);
                  SetElementAttrs(Element, DPSTSwitchobj, DrawingPoint);
                  CircuitElements[objcounter - 1] = DPSTSwitchobj;
                  CircuitElements[objcounter - 1].draggable();
                  CircuitElements[objcounter - 1].dragend = DragEndFun;
                  CircuitElements[objcounter - 1].on('mouseup', MouseDwnFun);
                  CircuitElements[objcounter - 1].on('mouseover', DPSTMouseOverFun);
                  CircuitElements[objcounter - 1].on('mouseleave', DPSTMouseLeaveFun);

                  return CircuitElements[objcounter - 1];
                  break;

              case 'SPDTSwitch':
                  var SPDTSwitchobj = draw.SPDTSwitch(DrawingPoint.X, DrawingPoint.Y, DrawingPoint.X + 4 * scale, DrawingPoint.Y, DrawingPoint.X + 4 * scale, DrawingPoint.Y - 40);
                  SetElementAttrs(Element, SPDTSwitchobj, DrawingPoint);
                  CircuitElements[objcounter - 1] = SPDTSwitchobj;
                  CircuitElements[objcounter - 1].draggable();
                  CircuitElements[objcounter - 1].dragend = DragEndFun;
                  CircuitElements[objcounter - 1].on('mouseup', MouseDwnFun);
                  CircuitElements[objcounter - 1].on('mouseover', SPDTMouseOverFun);
                  CircuitElements[objcounter - 1].on('mouseleave', SPDTMouseLeaveFun);

                  return CircuitElements[objcounter - 1];
                  break;

              case 'NPNTransistor':
                  var NPNTransistorobj = draw.NPNTransistor(DrawingPoint.X, DrawingPoint.Y, DrawingPoint.X + 4 * scale, DrawingPoint.Y - 4 * scale, DrawingPoint.X + 4 * scale, DrawingPoint.Y + 4 * scale);
                  SetElementAttrs(Element, NPNTransistorobj, DrawingPoint);
                  CircuitElements[objcounter - 1] = NPNTransistorobj;
                  CircuitElements[objcounter - 1].draggable();
                  CircuitElements[objcounter - 1].dragend = DragEndFun;
                  CircuitElements[objcounter - 1].on('mouseup', MouseDwnFun);
                  CircuitElements[objcounter - 1].on('mouseover', SPDTMouseOverFun);
                  CircuitElements[objcounter - 1].on('mouseleave', SPDTMouseLeaveFun);

                  return CircuitElements[objcounter - 1];
                  break;

              case 'PNPTransistor':
                  var PNPTransistorobj = draw.PNPTransistor(DrawingPoint.X, DrawingPoint.Y, DrawingPoint.X + 4 * scale, DrawingPoint.Y - 4 * scale, DrawingPoint.X + 4 * scale, DrawingPoint.Y + 4 * scale);
                  //SetElementAttrs(Element, PNPTransistorobj, DrawingPoint);
                  //CircuitElements[objcounter - 1] = PNPTransistorobj;
                  //CircuitElements[objcounter - 1].draggable();
                  //CircuitElements[objcounter - 1].dragend = DragEndFun;
                  //CircuitElements[objcounter - 1].on('mouseup', MouseDwnFun);
                  //CircuitElements[objcounter - 1].on('mouseover', SPDTMouseOverFun);
                  //CircuitElements[objcounter - 1].on('mouseleave', SPDTMouseLeaveFun);

                  return CircuitElements[objcounter - 1];
                  break;

              default:
          }
      }




      //////////// function To Set Element Attributes ---------------//

      function SetElementAttrs(ElementStr, ElementObj, ElementStPoint) {
          //ElementObj.attr('ID', ElementStr.concat(objcounter));
          ElementObj.attr('ElementID', ElementStr.concat(objcounter));
          ElementObj.attr('index', objcounter - 1);
          ElementObj.attr('StartPointX', ElementStPoint.X);
          ElementObj.attr('StartPointY', ElementStPoint.Y);

          ElementObj.attr('EndPointX', ElementStPoint.X + 4 * scale);
          ElementObj.attr('EndPointY', ElementStPoint.Y);
          ElementObj.attr('ElementXml', "");
          ElementObj.attr('Border', rect);
      }


      /////////////- ------------------- Vertical Element  ----------------///
      function SetVerticalElementAttrs(ElementStr, ElementObj, ElementStPoint) {
          //ElementObj.attr('ID', ElementStr.concat(objcounter));
          ElementObj.attr('ElementID', ElementStr.concat(objcounter));
          ElementObj.attr('index', objcounter - 1);
          ElementObj.attr('StartPointX', ElementStPoint.X);
          ElementObj.attr('StartPointY', ElementStPoint.Y);

          ElementObj.attr('EndPointX', ElementStPoint.X );
          ElementObj.attr('EndPointY', ElementStPoint.Y + 4 * scale);
          ElementObj.attr('ElementXml', "");
          ElementObj.attr('Border', rect);
      }



      //////////// function  للتقريب ---------------//

      function PointApproximation(inputpoint) {
          var AfterApproxPoint = { "X": inputpoint.X, "Y": inputpoint.Y };
          var modx = inputpoint.X % scale;
          var mody = inputpoint.Y % scale;
          var midPoint;
          if (scale % 2 == 0) {
              midPoint = scale / 2;
          }
          else if (scale % 2 == 0.5) {
              midPoint = scale / 2 + 0.5;
          }

          if (modx != 0 || mody != 0) {
              if (modx >= midPoint) {
                  AfterApproxPoint.X = AfterApproxPoint.X + (scale - modx);
              }
              else {
                  AfterApproxPoint.X = AfterApproxPoint.X - modx;
              }

              if (mody >= midPoint) {
                  AfterApproxPoint.Y = AfterApproxPoint.Y + (scale - mody);
              }
              else {
                  AfterApproxPoint.Y = AfterApproxPoint.Y - mody;
              }
              return AfterApproxPoint;
          }
      }



      ////////////// Drag End Function -----------------//
      function DragEndFun(delta, event) {
          flag = 0;

          if (Element != null) {
              //document.getElementById('str').style.cursor = "move";
              document.getElementById(Element).style.borderColor = "#aaa2a2";
              Element = null;
          }
          //else {
          //    //alert("eeeeeeeeeeeeeeelse")
          //}
          ////alert("str = " + str)
          //document.getElementById(str).style.borderColor = "#000";
          //document.getElementById('dd').style.cursor = "url('\images\Cusrsors\' + str +'.png'), auto";

          
          if (event.which == 1) {
              var obj = this;
              var pointAfterDrag = { "X": obj.attr('StartPointX') + delta.x, "Y": obj.attr('StartPointY') + delta.y };
              var ApproxPointAfterDrag = PointApproximation(pointAfterDrag);
              var endpointAfterDrag = { "X": obj.attr('EndPointX') + delta.x, "Y": obj.attr('EndPointY') + delta.y };
              var endApproxPointAfterDrag = PointApproximation(endpointAfterDrag);
              var currentindex = obj.attr('index');
              CircuitElements[currentindex].attr('StartPointX', ApproxPointAfterDrag.X);
              CircuitElements[currentindex].attr('StartPointY', ApproxPointAfterDrag.Y);
              CircuitElements[currentindex].attr('EndPointX', endApproxPointAfterDrag.X);
              CircuitElements[currentindex].attr('EndPointY', endApproxPointAfterDrag.Y);
              
              if (CircuitElements[currentindex].attr('StartPointY')==CircuitElements[currentindex].attr('EndPointY')) {
                  CircuitElements[currentindex].dx(ApproxPointAfterDrag.X - pointAfterDrag.X);
                  CircuitElements[currentindex].dy(ApproxPointAfterDrag.Y - pointAfterDrag.Y);
              }
              else
              {
                  CircuitElements[currentindex].dx(ApproxPointAfterDrag.Y - pointAfterDrag.Y);
                  CircuitElements[currentindex].dy((-1)*(ApproxPointAfterDrag.X - pointAfterDrag.X));
              }

              for (var i = 0; i < CircuitElements.length; i++)
              {
                  var SelectedStartpoint = { "X": CircuitElements[currentindex].attr("StartPointX"), "Y": CircuitElements[currentindex].attr("StartPointY") };
                  var SelectedEndpoint = { "X": CircuitElements[currentindex].attr("StartPointX"), "Y": CircuitElements[currentindex].attr("StartPointY") };
                  var ArrayobjStartpoint = { "X": CircuitElements[i].attr("StartPointX"), "Y": CircuitElements[i].attr("StartPointY") };
                  var ArrayobjEndpoint = { "X": CircuitElements[i].attr("StartPointX"), "Y": CircuitElements[i].attr("StartPointY") };
                  //alert(""+);
                  if (SelectedStartpoint == ArrayobjStartpoint || SelectedStartpoint == ArrayobjEndpoint)
                  {
                      CircuitElements[currentindex].get(1).radius((5 * scale) / 25).fill('red').stroke({ color: 'red', width: 1 });
                      //CircuitElements[currentindex].get(2).radius((5 * scale) / 25).fill('red').stroke({ color: 'red', width: 1 });
                  }


              }
          }

   
      }


      ////////////// Drag End Function -----------------//
      function DragOverFun(delta, event) {
          alert("assssssssss");
      }

      function BtnHandlefun() {
          //alert("btnhndl ");
          //var str = '<cml width="' + width + '" height="' + '" scale= 20"' + '" id="cml1">';
          var str = "";
          for (var i = 0; i < CircuitElements.length; i++) {
              //alert("foooooor ");
              if (CircuitElements[i] != null) {
                  str = str.concat("\n" + CircuitElements[i].GenerateXML());
                  //alert("Str = " + str);
              }
          }
          var EndTag = '\n</cml>';
          var XML = str.concat(EndTag);
          //alert("XML = " + XML);
          //document.getElementById("TextArea1").value = XML;
          return XML;
      }


      //function GenerateGrid() {
          //alert("GenerateGrid");
          //width = parseInt(document.getElementById("txt_width").value);
          //height = parseInt(document.getElementById("txt_height").value);
          //scale = parseInt(document.getElementById("txt_scale").value);

          //alert(width + "Height= " + height + "Scale= " + scale);

          $(document).ready(function () {
              initializeSVG('dd', width, height);
              drawGrid(0, 0, width, height, scale);
              //document.getElementById("dd").setAttribute("Height", height);
              //document.getElementById("dd").setAttribute("Width", width);
          });
          

     // }

    </script>



</body> 
</html>