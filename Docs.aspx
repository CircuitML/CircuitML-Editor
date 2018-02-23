<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Docs.aspx.cs" Inherits="Docs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/style-editor.css" rel="stylesheet" />
    <title></title>
    </head>
<body>
     <div class="row"  style="margin-top:2px;width:1360px;">
  <div class="col-lg-1" style="width:300px;padding-top:-1px; background-color:#e5dddd;overflow-y:scroll;overflow-x:hidden;height:630px;border:outset;border-radius:5px; " >
      <div class="header-top" style="background-color:#a7b0a8;margin-top:-10px;width:290px;color:white;border:outset;border-radius:6px" ><a href="#CML"><h1 style="margin-top:0px;margin-left:20px;">CML.Js</h1></a></div>
       <div class="modal-header" style="margin-top:-25px"></div>
      <div class="row" style="margin-top:10px;margin-left:15px">
        <div  style="width:290px;color:white;margin-top:-10px;"><a href="#usage" style="text-decoration:none"> <h1>Usage</h1></a></div>
         
          <div style="margin-left:30px;margin-top:17px"> <a href="#XMLeditor"><h2>Use XML editor</h2></a></div>
          <div style="margin-left:30px;"><a href="#jseditor"><h2>Use CML.js in sctipt</h2></a></div>
      </div>
      <hr style="color:#a7b0a8" />

       <div class="row" style="margin-top:10px;margin-left:15px">
         <ul style="width:290px;color:white;margin-top:-10px;"><a href="#element" style="text-decoration:none">Elements</a></ul>
          
          <li  ><ul style="width:290px;color:white;margin-top:3px;margin-left:5px"><a href="#element" style="text-decoration:none">Essential Element</a></ul> 
           <li style="margin-left:30px;margin-top:4px;list-style-type:square"><a href="#XMLeditor">Wire(Connector)</a></li>

          </li>
           <hr />
            <li >
                <ul><a href="#IS" >Ideal Sources</a></ul>
                  <li style="margin-left:30px;list-style-type:square"><a href="#vdc">Vdc(voltage DC source)</a></li>
                   <li style="margin-left:30px;list-style-type:square"><a href="#idc">Idc </a></li>
            </li>
           <hr />
           
           
           
           
           <li>
          <ul><a href="#diod">Diodes</a></ul>
            <li style="margin-left:30px;list-style-type:square;list-style-type:square"><a href="#vdc">ConstatntCurrentDiode</a></li>
            <li style="margin-left:30px;list-style-type:square;list-style-type:square"><a href="#vdc">PhotoDiode</a></li>
            <li style="margin-left:30px;list-style-type:square;list-style-type:square"><a href="#vdc">PINDiode</a></li>
            <li style="margin-left:30px;list-style-type:square;list-style-type:square"><a href="#vdc">SchottyDiode</a></li>
            <li style="margin-left:30px;list-style-type:square;list-style-type:square"><a href="#vdc">TunnelDiode</a></li>
           </li>
           <hr />
           <li>
              <ul><a href="#diod">Passive Elements</a></ul>
                    <li style="margin-left:30px;"><a href="#caoacitor">Capacitor</a></li>
                     <li style="margin-left:30px;"><a href="#trans">Transistor</a></li>
                     <li style="margin-left:30px;"><a href="#coil">l (Coil )</a></li>
                                 
          </li>
           <hr />
           <li>
            <ul><a href="#diod">Switshes</a></ul>
              
             <li style="margin-left:30px;list-style-type:square;list-style-type:square"><a href="#vdc">BushButton</a></li>

             <li style="margin-left:30px;list-style-type:square;list-style-type:square"><a href="#diod">toggleswitch</a></li>
                 
                 <li style="margin-left:45px;list-style-type:disc"><a href="dDpdt" >Dpdt</a></li>
                 <li style="margin-left:45px;list-style-type:disc"><a href="dDpdt" >Dps</a> </li>
                 <li style="margin-left:45px;list-style-type:disc"><a href="dDpdt" >Spdt</a> </li>
                 <li style="margin-left:45px;list-style-type:disc"><a href="dDpdt" >Spst</a></li>
                 <li style="margin-left:45px;list-style-type:disc"><a href="dDpdt" >Twopsixt</a></li>

             </li>
           <hr />
           <li>
               <ul ><a href="#">Measurement</a></ul>
                   <li style="margin-left:30px;list-style-type:square"><a href="#ohm">ohmmeter</a></li>
                  <li style="margin-left:30px;list-style-type:square"><a href="#power">powermeter</a></li>
                 <li style="margin-left:30px;list-style-type:square"><a href="#volt">voltameter</a></li>
        </li>
           <hr />
          
      
           
           <li>
          <ul><a href="#diod">Logic Gates</a></ul>
            <li style="margin-left:30px;list-style-type:square;list-style-type:square"><a href="#vdc">OR</a></li>
            <li style="margin-left:30px;list-style-type:square;list-style-type:square"><a href="#vdc">AND</a></li>
            <li style="margin-left:30px;list-style-type:square;list-style-type:square"><a href="#vdc">NOR</a></li>
            <li style="margin-left:30px;list-style-type:square;list-style-type:square"><a href="#vdc">NAND</a></li>
            <li style="margin-left:30px;list-style-type:square;list-style-type:square"><a href="#vdc">XOR</a></li>
            <li style="margin-left:30px;list-style-type:square;list-style-type:square"><a href="#vdc">XNOR</a></li>
            <li style="margin-left:30px;list-style-type:square;list-style-type:square"><a href="#vdc">NOT</a></li>


           </li>
           <hr />
          <ul><a href="#diod"> Others</a></ul>
            
          <li style="margin-left:30px;"><a href="#led">Led</a></li>
          <li style="margin-left:30px;"><a href="#vac">Vac(voltage AC source)</a></li>
          <li style="margin-left:30px;"><a href="#voltag">Vdc(voltage DC source)</a></li>
             

      </div>

   
   

      </div>

 <div class="col-lg-1" style="width:1060px;padding-top:-1px; background-color:aqua;height:630px;" >
     

  </div>
          </div>
  

</body>
</html>
