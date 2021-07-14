<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_vertical_bycate.ascx.cs" Inherits="home_products_menu_u_vertical_bycate" %>

<script type="text/javascript">

ddaccordion.init({
	headerclass: "submenuheader", //Shared CSS class name of headers group
	contentclass: "submenu", //Shared CSS class name of contents group
	revealtype: "click", //Reveal content when user clicks or onmouseover the header? Valid value: "click", "clickgo", or "mouseover"
	mouseoverdelay: 200, //if revealtype="mouseover", set delay in milliseconds before header expands onMouseover
	collapseprev: false, //Collapse previous content (so only one open at any time)? true/false 
	defaultexpanded: [], //index of content(s) open by default [index1, index2, etc] [] denotes no content
	onemustopen: true, //Specify whether at least one header should be open always (so never all headers closed)
	animatedefault: false, //Should contents open by default be animated into view?
	persiststate: true, //persist state of opened contents within browser session?
	toggleclass: ["", ""], //Two CSS classes to be applied to the header when it's collapsed and expanded, respectively ["class1", "class2"]
	togglehtml: ["suffix", "", ""], //Additional HTML added to the header when it's collapsed and expanded, respectively  ["position", "html1", "html2"] (see docs)
	animatespeed: "slow", //speed of animation: integer in milliseconds (ie: 200), or keywords "fast", "normal", or "slow"
	//oninit:function(headers, expandedindices){ //custom code to run when headers have initalized
		
	//},
	//onopenclose:function(header, index, state, isuseractivated){ //custom code to run whenever a header is opened or closed
		//if (state=="block" && isuseractivated==true){ //if header is expanded and as the result of the user initiated action
			//myiframe.location.replace(header.getAttribute('href'))
		
	//}
})

</script>

<style type="text/css">
    .prodscate
    {
        height: 25px;
        background: #d6e7ef;
    }
    .prodscate a, prodscate a:hover
    {
        font-family: Tahoma;
        font-size: 12px;
        color: #000;
        font-weight: bold;
        display: block;
        padding-left: 10px;
        line-height: 25px;
    }
</style>
<div class='tab'>
    <div class='tab_tl'>
        <div class='tab_tr'>
            <div class='tab_tc'><asp:Literal ID="ltname" runat="server"></asp:Literal></div>
        </div>
    </div>
    <div class='tab_cl'>
        <div class='tab_cr'>
            <div class='tab_cc'>
                <asp:Literal ID="ltmenu" runat="server"></asp:Literal>
               </div>
        </div>
    </div>
    <div class='tab_bl'>
        <div class='tab_br'>
            <div class='tab_bc'></div>
        </div>
    </div>
               
</div>
