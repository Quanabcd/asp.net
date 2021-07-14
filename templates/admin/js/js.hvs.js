//get list
var socket = $.connection.hvs;
eclient(socket);
//$.connection.hub.qs = { 'chatid': options.meid };
$.connection.hub.start().done(function () {
    eserver(socket);
});
$.connection.hub.disconnected(function () {
    setTimeout(function () {
        $.connection.hub.start();
    }, 5000); // Restart connection after 5 seconds.
});
function eserver(s) {
    $(document).on("click", '.prd-cate-lnk', function () {
        //s.server.abc($(this).html()); //gọi hàm trong appcode
        var id = $(this).attr("data");
        s.server.getitemsbycate(id); //gọi hàm trong appcode
    })
    $(document).on("click", '.prd-lnk', function () {
        //s.server.abc($(this).html()); //gọi hàm trong appcode
        var id = $(this).attr("data");
        if ($("#lis" + id).length < 1)
            $(".lprd-selected ul").append("<li id='lis" + $(this).attr("data") + "'><a class='prd-selected-lnk' rel='" + $(this).attr("rel") + "' title='" + $(this).attr("title") + "' data='" + $(this).attr("data") + "' href='javascript:0'>" + $(this).attr("title") + "</a></li>");
        else
            alert("Sản phẩm đã được thêm vào");
    })

    $(document).on("click", '.prd-selected-lnk', function () {
        //s.server.abc($(this).html()); //gọi hàm trong appcode
        var id = $(this).attr("data");
        $(".lprd-selected ul").remove($(this));
    })
    
    $(document).on("click", '.item-upload-del', function () {
        if (confirm("Bạn có muốn xóa không?")) {
            var id = $(this).attr("data");
            $(this).parents('.item-upload').remove();
            s.server.deleteimg(id);
          
        }
    })

    //menu
    $(document).on("click", '#rdlinkinput', function () {
        $('#ddllinkfromcate').attr("disabled", "disabled");
        $('#ddllinkfrommodule').attr("disabled", "disabled");
        $('#txtlink').removeAttr("disabled");
        $(".linklist").hide();
    })
    $(document).on("click", '#rdlinkfromcate', function () {
        $('#txtlink').attr("disabled", "disabled");
        $('#ddllinkfrommodule').attr("disabled", "disabled");
        $('#ddllinkfromcate').removeAttr("disabled");
        $(".linklist").hide();
        var id = $("#ddllinkfromcate").val();
        s.server.getcatebymodule(id);
    })
    $(document).on("click", '#rdlinkfrommodule', function () {
        $('#txtlink').attr("disabled", "disabled");
        $('#ddllinkfromcate').attr("disabled", "disabled");
        $('#ddllinkfrommodule').removeAttr("disabled");
        $(".linklist").hide();
    })
    $(document).on("click", '.mnu-item-lnk', function () {
        $('#txtlink').val("/" + $(this).attr("rel"));
    })
    $(document).on("change", '#ddllinkfrommodule', function () {
        var id = $(this).val();
        $('#txtlink').val(id);
    })
    $(document).on("change", '#ddllinkfromcate', function () {
        var id = $(this).val();
        s.server.getcatebymodule(id);
    })
}
function eclient(s) {
    // hàm này được gọi từ appcode
    s.client.getitemsbycate = function (result) {
        $(".lprd-prd ul").html("");
        var str = "";
        for (i = 0; i < result.length; i++) {
            str += "<li><a class='prd-lnk' rel='" + result[i].img + "' title='" + result[i].name + "' data='" + result[i].id + "' href='javascript:0'>" + result[i].name + "</a></li>";
        }
        $(".lprd-prd ul").html(str);
    }
    s.client.getcatebymodule = function (result) {
        $(".linklist").html("");
        var str = "";
        var space = "";
        for (i = 0; i < result.length; i++) {
            space="";
            for (j = 1; j < result[i].level; j++)
                space += "...";
            str += "<li><a class='mnu-item-lnk' rel='" + result[i].alias + "' title='" + result[i].name + "' data='" + result[i].cid + "' href='javascript:0'>" + space + result[i].name + "</a></li>";
        }
        $(".linklist").html(str);
        $(".linklist").show();
    }
}