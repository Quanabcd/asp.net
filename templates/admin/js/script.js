var selectedList;
var availableList;
function createListObjects(){
    availableList = document.getElementById("availableOptions");
    selectedList = document.getElementById("selectedOptions");
}
function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode;
    if (charCode == 59 || charCode == 46)
        return true;
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}
function delAttribute(){
   var selIndex = selectedList.selectedIndex;
   if(selIndex < 0)
      return;
   availableList.appendChild(
      selectedList.options.item(selIndex))
   selectNone(selectedList,availableList);
   setSize(availableList,selectedList);
}
function addAttribute(){
   var addIndex = availableList.selectedIndex;
   if(addIndex < 0)
      return;
   selectedList.appendChild( 
      availableList.options.item(addIndex));
   selectNone(selectedList,availableList);
   setSize(selectedList,availableList);
}
function setTop(top){
	document.getElementById
      ('someLayer').style.top = top;
}
function setLayerTop(lyr,top){
	lyr.style.top = top;
}
function setSize(list1,list2){
    list1.size = getSize(list1);
    list2.size = getSize(list2);
}

function selectNone(list1,list2){
    list1.selectedIndex = -1;
    list2.selectedIndex = -1;
    addIndex = -1;
    selIndex = -1;
}
function getSize(list){
    /* Mozilla ignores whitespace, 
       IE doesn't - count the elements 
       in the list */
    var len = list.childNodes.length;
    var nsLen = 0;
    //nodeType returns 1 for elements
    for(i=0; i<len; i++){
        if(list.childNodes.item(i).nodeType==1)
            nsLen++;
    }
    if(nsLen<2)
        return 2;
    else
        return nsLen;
}
function delAll(){
    var len = selectedList.length -1;
    for(i=len; i>=0; i--){
        availableList.appendChild(selectedList.item(i));
    }
    selectNone(selectedList,availableList);
    setSize(selectedList,availableList);
    
}

function addAll(){
    var len = availableList.length -1;
    for(i=len; i>=0; i--){
        selectedList.appendChild(availableList.item(i));
    }
    selectNone(selectedList,availableList);
    setSize(selectedList,availableList);
    
}
function showSelected(){
    var optionList = 
       document.getElementById
      ("selectedOptions").options;
    var data = '';
    var len = optionList.length;
    for(i=0; i<len; i++)
	{
            data += ',';
        data += optionList.item(i).value;
    }
    alert(data);
}
function selectAll(invoker)
 {
        var inputElements = document.getElementsByTagName('input');
        for (var i = 0 ; i < inputElements.length ; i++) 
        {
            var myElement = inputElements[i];
            if (myElement.type === "checkbox") 
            {
                myElement.checked = invoker.checked;
            }

        }
}
function selectAll1(invoker) {
    $(this).children(':checkbox').attr('checked', this.checked);
    $(invoker).parent().css
    var inputElements = document.getElementsByTagName('input');
    for (var i = 0 ; i < inputElements.length ; i++) {
        var myElement = inputElements[i];
        if (myElement.type === "checkbox") {
            myElement.checked = invoker.checked;
        }

    }
}

$(document).on("keypress keyup keydown", '#txtsearchnews', function () {
    var key = $(this).val();
    $.ajax({
        type: "POST",
        url: "/webservices/webservice_common.asmx/GetListNews",
        data: "{ key: '" + key + "',groupid:" + $("#hdcid").val() + "}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            $(".dresult").html("");
            $(".dresult").html(data.d);
            $(".dresult").show();
        },
        error: function (data) {
        }
    })
    //s.server.getcatebymodule(id);
})
$(document).on("keypress keyup keydown", '#txtsearch', function () {
    var key = $(this).val();
    $.ajax({
        type: "POST",
        url: "/webservices/webservice_common.asmx/GetListProduct",
        data: "{ key: '" + key + "',groupid:" + $("#hdcid").val() + "}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            $(".dresult").html("");
            $(".dresult").html(data.d);
            $(".dresult").show();
        },
        error: function (data) {
        }
    })
    //s.server.getcatebymodule(id);
})

$(document).on("click", '.deleteitsp', function () {
    var ino = $(this).attr("data");
    $.ajax({
        type: "POST",
        url: "/webservices/webservice_common.asmx/RemoveItemToGroup",
        data: "{ ino: " + ino + "}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            $("#blc_" + ino).remove();
        },
        error: function (data) {
        }
    })
    //s.server.getcatebymodule(id);
})
$(document).on("change", '.txtiporder', function () {
    
    var ino = $(this).attr("data");
    var thutu = $(this).val();
    $.ajax({
        type: "POST",
        url: "/webservices/webservice_common.asmx/UpdateOrder",
        data: "{ ino: " + ino + ",thutu:" + thutu + "}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
           // $("#blc_" + ino).remove();
        },
        error: function (data) {
        }
    })
    //s.server.getcatebymodule(id);
})
$(document).on("change", '#ddlcate', function () {
    var cid = $(this).val();
    var listcur = $("#hdfeature").val();
    $.ajax({
        type: "POST",
        url: "/webservices/webservice_common.asmx/LoadFt",
        data: "{ cid: -1,capp: 'FT',listcur:'" + listcur + "',icate:" + cid + "}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            $(".listtt").html(data.d);
        },
        error: function (data) {
        }
    })
    //s.server.getcatebymodule(id);
})

$(document).on("click", '.badd', function () {
    var iid = $(this).find("#itspid").html();
    var igr = $(this).find("#itspcid").html();
    var u = $(this);
    $.ajax({
        type: "POST",
        url: "/webservices/webservice_common.asmx/AddItemToGroup",
        data: "{ iid: " + iid + ",groupid:" + igr + "}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
           u.addClass("bdelete");
           u.find(".add").addClass("fa-close");
           u.find(".add").addClass("delete");
           u.find(".add").removeClass("fa-plus-square");
           u.find(".add").removeClass("add");
           u.removeClass("badd");
            $(".itemadded").append(data.d);
        },
        error: function (data) {
        }
    })
    //s.server.getcatebymodule(id);
})

$(document).on("click", '.bdelete', function () {
    var iid = $(this).find("#itspid").html();
    var igr = $(this).find("#itspcid").html();
    var u = $(this);
    $.ajax({
        type: "POST",
        url: "/webservices/webservice_common.asmx/DeleteItemToGroup",
        data: "{ iid: " + iid + ",groupid:" + igr + "}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            u.addClass("badd");
            u.find(".delete").addClass("fa-plus-square");
            u.find(".delete").addClass("add");
            u.find(".delete").removeClass("fa-close");
            u.find(".delete").removeClass("delete");
           u.removeClass("bdelete");
            $(data.d).remove();
        },
        error: function (data) {
        }
    })
    //s.server.getcatebymodule(id);
})

$(document).click(function (e) {
    if ($(e.target).parents(".dresult").length === 0) {
        $(".dresult").hide();
    }
});
//menu
$(document).on("click", '#rdlinkinput', function () {
    $('#ddllinkfromcate').attr("disabled", "disabled");
    $('#ddllinkfrommodule').attr("disabled", "disabled");
    $('#txtlink').removeAttr("disabled");
    $(".linklist").hide();
})
$(document).on("click", '#rdlinkfromcate', function () {
    //$('#txtlink').attr("disabled", "disabled");
    $('#ddllinkfrommodule').attr("disabled", "disabled");
    $('#ddllinkfromcate').removeAttr("disabled");
    $(".linklist").hide();
    var id = $("#ddllinkfromcate").val();
    $.ajax({
        type: "POST",
        url: "/webservices/webservice_common.asmx/GetCategory",
        data: "{ app: '" + id + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            $(".linklist").html("");
            $(".linklist").html(data.d);
            $(".linklist").show();
        },
        error: function (data) {
        }
    })
    //s.server.getcatebymodule(id);
})
$(document).on("click", '#rdlinkfrommodule', function () {
   // $('#txtlink').attr("disabled", "disabled");
    $('#ddllinkfromcate').attr("disabled", "disabled");
    $('#ddllinkfrommodule').removeAttr("disabled");
    $(".linklist").hide();
})
$(document).on("click", '.mnu-item-lnk', function () {
    $('#txtlink').val("/" + $(this).attr("rel"));
    $('#txtname').val($(this).attr("title"));
    $('#hdicate').val($(this).attr("data"));
})
$(document).on("change", '#ddllinkfrommodule', function () {
    var id = $(this).val();
    $('#txtlink').val(id);
})
$(document).on("change", '#ddllinkfromcate', function () {
    var id = $(this).val();
    $.ajax({
        type: "POST",
        url: "/webservices/webservice_common.asmx/GetCategory",
        data: "{ app: '" + id + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            $(".linklist").html("");
            $(".linklist").html(data.d);
            $(".linklist").show();
        },
        error: function (data) {
        }
    })
})
$(document).on("click", '.item-upload-del', function () {
    if (confirm("Bạn có muốn xóa không?")) {
        var id = $(this).attr("data");
        $(this).parents('.item-upload').remove();
        //s.server.deleteimg(id);
        $.ajax({
            type: "POST",
            url: "/webservices/webservice_common.asmx/DeleteImage",
            data: "{ ino: '" + id + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
            
            },
            error: function (data) {
            }
        })
    }
})
$(document).on("click", '.item-upload-del1', function () {
    if (confirm("Bạn có muốn xóa không?")) {
        var img = $(this).attr("data");
        $(this).parents('.item-upload').remove();
        //s.server.deleteimg(id);
        $.ajax({
            type: "POST",
            url: "/webservices/webservice_common.asmx/DeleteImage1",
            data: "{ img: '" + img + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var listimg = $("#hdlistimgrel").val();
                listimg = listimg.replace("|" + img + "|", "|");
                $("#hdlistimgrel").val(listimg);
            },
            error: function (data) {
            }
        })
    }
})
$(document).on("keyup", '#txt_tag', function (event) {
    if (event.keyCode == 13 || event.keyCode == 188) {
        var tag = $(this).val();
        if (event.keyCode == 188) {
            tag = tag.substr(0, tag.length - 1);
        }
      
        var taglist = $("#taglist").val();
        if (taglist.indexOf("," + tag + ",") ==-1 && tag.length>0)
        {
            if (taglist.length > 0)
                taglist = taglist + tag + ",";
            else
                taglist = "," + tag + ",";
            $(".tagl").append("<span class='tag label label-tags'><span class='tagname'>" + tag + "</span><span class='rmtag' data-role='remove'></span></span>");
            $("#taglist").val( taglist);
            $(this).val("");
        }
    }
})


$(document).on("click", '.rmtag', function () {
    var tag = $(this).parent().find(".tagname").html();
    $(this).parent().remove();
    var taglist = $("#taglist").val();
    taglist = taglist.replace("," + tag + ",", ",");
    $("#taglist").val(taglist);
    var num = $(".tags > div > ul >li").length;
    for (i = 1; i <= num; i++) {
        var tagt = $(".tag-color-" + i).html();
        if (tagt == tag) {
            $(".tag-color-" + i).removeClass("disabled");
            $(".tag-color-" + i).addClass("selecttag");
        }
    }
})


$(document).on("click", '.selecttag', function (event) {
        var tag = $(this).html();
        var taglist = $("#taglist").val();
        if (taglist.indexOf("," + tag + ",") == -1 && tag.length > 0) {
            if (taglist.length > 0)
                taglist = taglist + tag + ",";
            else
                taglist = "," + tag + ",";
            $(".tagl").append("<span class='tag label label-tags'><span class='tagname'>" + tag + "</span><span class='rmtag' data-role='remove'></span></span>");
            $("#taglist").val(taglist);
            $(this).addClass("disabled");
            $(this).removeClass("selecttag");
        }
    
})


$(document).ready(function () {
    var wh = $(window).height();
    var dt = $(".navbar-header").height();
    var h = wh - dt;
    $(".side-nav").css("height", h);
})