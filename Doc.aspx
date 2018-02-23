<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Doc.aspx.cs" Inherits="Doc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head >
    <title></title>
   
    <style>

    #toc_wrapper{
    color:rgb(133, 133, 133);
    position: fixed;
    top: 10px;
    width: 200px;
    right: 10px;
}
.toc-button {
    display: block;
    font-size: 16px;
    display: inline-block;
    transition: transform .5s ease;
    -webkit-transition: -webkit-transform .5s ease;
    -moz-transition: -moz-transform .5s ease;
    -o-transition: -o-transform .5s ease;
    -ms-transition: -ms-transform .5s ease;
    height: 20px;
    width: 20px;
    background: url(toc-button.png) 0px 0px no-repeat;
    float: right;
    text-indent: -400px;
    overflow: hidden;
}
.toc-button.rotate {
    transform: rotate(180deg);
    -webkit-transform: rotate(180deg);
    -moz-transform: rotate(180deg);
    -o-transform: rotate(180deg);
    -ms-transform: rotate(180deg);
    background: url(toc-button.png) 0px -20px no-repeat;
    float: right;
}
#nav {
    list-style: none;
    padding: 20px 20px 20px 30px;
    background: rgb(248, 248, 248);
    border-radius: 10px;
    margin-top: 0px;
    box-shadow: 0px 0px 5px rgb(204, 204, 204);
}
#nav a{
    color:rgb(133, 133, 133);
}

   </style>
    <script>
        $(document).ready(function () {
            var nav_list = $("#nav"); // navigation list id
            var nav_links = $("#nav a");  //links inside navigation list
            var toc_button = $("#toc_wrapper .toc-button"); // expand/collapse animated button

            nav_list.hide(); // hide navigation on page load
            toc_button.click(function () { // use click on navigation button
                nav_list.fadeToggle('fast', function () { // toggle hide/show navigation list
                    if (nav_list.is(':visible')) { //navigtion list is visible
                        toc_button.addClass('rotate'); //add css3 animation class
                    } else {
                        toc_button.removeClass('rotate'); //restore css3 animation class 
                    }
                });
            });

            $(nav_links).click(function () { //user click on toc links
                event.returnValue = false; //stop browser from going to href link
                $('html, body').animate({ scrollTop: $($(this).attr('href')).offset().top }, 500); //scroll smoothly to #id  
            });

        });

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="toc_wrapper">
<span class="toc-button"><input id="Button1" type="button" value="button" /></span>
<ul id="nav" style="display: block;">
    
    <li><a href="#section1">Section 1</a></li>
    <li><a href="#section2">Section 2</a></li>
    <li><a href="#section3">Section 3</a></li>
    <li><a href="#section4">Section 4</a></li>
    <li><a href="#section5">Section 5</a></li>
    <li><a href="#section6">Section 6</a></li>
    <li><a href="#section7">Section 7</a></li>
    <li><a href="#section7">Section 8</a></li>

</ul>
</div>

<p id="section1">
<h1>Section 1</h1>
Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.
    Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.
    Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.
</p>
<p id="section2">
  <h1>Section 2</h1>
Section 2 of the page, this is paragraph2.Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.
    Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.
    Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.
</p>

  <p id="section3">
<h1>Section 3</h1>
Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.
      Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.
      Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.
</p>
        <p id="section4">
<h1>Section 4</h1>
Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.
            Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.
            Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.
</p>
        <p id="section5">
<h1>Section 5</h1>
Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.
            Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.
            Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.
            Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.
</p>
        <p id="section6">
<h1>Section 6</h1>
Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.
            Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.
            Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.
            Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.
</p>
        <p id="section7">
<h1>Section 7</h1>
Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.
            Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.
</p>
               <p id="section8">
<h1>Section 8</h1>
Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.
                   Section 1 of the page, this is paragraph.Section 1 of the page, this is paragraph.
</p>
    </form>
</body>
</html>
