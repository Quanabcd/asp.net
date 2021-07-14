var GuestUploadNonFlash;
var dropText1 = bds_lang.UploadImageControl.DropText1;
var dropText2 = bds_lang.UploadImageControl.DropText2;
var maxcount = 0;
var uploadTemp = null;

GuestUploadNonFlash = function (instanceId,url,idtemp,module) {
    this.strTemplate = '<div class="droptext textUploadNotice"></div>';
    this.strTemplate += '<div class="thumbnails prdthumbnails"></div>';
    this.strTemplate += '<div style="display: none" class="divFileProgressContainer">';
    this.strTemplate += '<div class="progressWrapper" id="divFileProgress"></div></div>';
    this.strTemplate += '<div class="spanButtonPlaceholder block-upload-item" id="upload-drop-zone">';
    this.strTemplate += '<div class="browse-file"></div>';
    this.strTemplate += '<p style="color: #065799;font-size: 13px;text-align: justify;font-weight: 700;">' + bds_lang.UploadImageControl.DragMessage + '</p>';
    this.strTemplate += '</div>';

    this.strTemplate += '<div class="divFileProgressContainer1"></div>';
    this.strTemplate += '<div class="droptext">';
    this.strTemplate += '{dropProcessingText}';
    this.strTemplate += '</div>';

    var strLoadingProcess = '<div class="progressContainer">';
    strLoadingProcess += '<a class="progressCancel" href="#" style="visibility: hidden;"> </a>';
    strLoadingProcess += '<div class="upload-tool-delete" style="display:none;"></div>';
    strLoadingProcess += '<div class="loading-fl"></div>';
    strLoadingProcess += '<div class="progressSpinner"></div>';
    strLoadingProcess += '<span class="imgthumb" style="display:none;"></span>';
    strLoadingProcess += '&nbsp;&nbsp;<span class="progressSize"></span>';
    strLoadingProcess += '<div class="progressBarStatus"></div>';
    strLoadingProcess += '<div class="progressBarStatus1">' + bds_lang.UploadImageControl.Uploading + '</div>';
    strLoadingProcess += '<div class="progressBarInProgress" style="width: 110%;"></div>';
    strLoadingProcess += '</div>';

    this.strList = strLoadingProcess;
   
    this.strListView = '<div class="imgContainer" draggable="true">';
    this.strListView += '<div class="imgthumb"></div>';
    this.strListView += '</div>';

    var instance = $('#' + instanceId);
    var svid = instance.attr('svid');
    var svurl = url;//instance.attr('sv');
    var svkey = instance.attr('key');
    var hiddenFieldId = instance.attr('input');
    maxcount =16;

    this.uploader = new qq.FineUploader(
        {
            svId: svid,
            svurl: svurl,
            element: $('#' + instanceId)[0],
            listElement: null,
            multiple: true,
            request: {
                endpoint: svurl + 'upload.ashx',
                inputName: 'fileToUpload',
                params: {
                    UploadType: 'upload',
                    idtmp: idtemp,
                    mod: module,
                }
            }, 
            validation: {
                sizeLimit: 20144000,
                itemLimit: parseInt(instance.attr('maxcount')),
                maxCount: parseInt(instance.attr('maxcount')),
                trueCount: maxcount,
                allowedExtensions: ['jpeg', 'jpg', 'gif', 'png']
            },
            text: {
                uploadButton: bds_lang.UploadImageControl.SelectedFile + '. (không quá 2MB)',
                dropProcessing: bds_lang.UploadImageControl.DropProcessing
            },
            template: this.strTemplate,
            fileTemplate: this.strList,
            fileTemplateView: this.strListView,
            deleteFile: {
                enabled: true,
                forceConfirm: true,
                endpoint: svurl + 'GuestUploadNoFlash.aspx'
            },
            failedUploadTextDisplay: {
                mode: 'custom'
            },
            cors: {
                expected: true, //all requests are expected to be cross-domain requests
                sendCredentials: true //if you want cookies to be sent along with the request
            },
            classes: {
                deleteButton: "upload-tool-delete",
                statusText: "progressBarStatus1",
                cancel: "progressCancel",
                spinner: "progressSpinner",
                size: "progressSize",
                progressBar: "progressBarInProgress",
                file: "imgthumb",
                list: "progressWrapper",
                button: "spanButtonPlaceholder",
                dropProcessing: "droptext",
                drop: "divFileProgressContainer1",
                listView: "thumbnails"
            },
            callbacks: {
                onError: function (id, name, errorReason, xhr) {  },
               onComplete: function (id, fileName, responseJSON) {
                    $('.divFileProgressContainer').hide();
                    $('.divFileProgressContainer').html(strLoadingProcess);
                    if (responseJSON.success) {
                        var listimg = $("#hdlistimgrel").val();
                        if (listimg.length == 0)
                            listimg += "|" + responseJSON.fn + "|";
                        else
                            listimg += responseJSON.fn + "|";
                        $("#hdlistimgrel").val(listimg);
                        var str = "";
                        str += "<div class='item-upload'><span class='item-upload-name'><img class='img-responsive' src='../uploads/products/relative/" + responseJSON.fn + "' /></span><span data='" + responseJSON.fn + "' class='item-upload-del1' title='Xóa'></span></div>";
                        $(".prdthumbnails").append(str);
                       
                    }
                },
                onDeleteComplete: function (id, xhr, isError) {
                    if (!isError) {
                       
                    }
                },
                onSubmit: function (id, name) { },
                onUpload: function (e) {
                    $('.divFileProgressContainer').show();
                }
            }
        });
    /*binding drop item*/
    if (parseInt(instance.attr('maxcount')) == $('#' + hiddenFieldId).val().split(',').length - 1) {
        $('.spanButtonPlaceholder').hide();
        $('.droptext').hide();
    }
    uploadTemp = this.uploader;

   

    /*binding drop upload*/

    var browserIEInfo = navigator.userAgent.match(/MSIE (([0-9]+)(\.[0-9]+)?)/);
    if (browserIEInfo === null || parseInt(browserIEInfo[2]) > 9) {
        $(document).on("dragover", '.spanButtonPlaceholder', function (e) {
      
            e.preventDefault && e.preventDefault();
            $(this).addClass('drop-active');
            return false;
        });
        $(document).on("dragleave", '.spanButtonPlaceholder', function (e) {
     
            e.preventDefault && e.preventDefault();
            $(this).removeClass('drop-active');
            return false;
        });

        var dragUpload = this.uploader;
        $(document).on("drop", '.spanButtonPlaceholder', function (e) {
      
            e.preventDefault && e.preventDefault();
            $(this).removeClass('drop-active');
            var files = e.originalEvent.dataTransfer.files;
            dragUpload.addFiles(files);
            return false;
        });
    }

}

//GuestUploadNonFlash.removeImage = function (domain, imgid, imgids, inputId, container) {

//    if (confirm(bds_lang.UploadImageControl.DeleteMessage)) {
       
//        uploadTemp._options.validation.trueCount = uploadTemp._options.validation.trueCount + 1;
//        $('#img' + imgid.replace(/[.]/g, '')).parent().remove();
//        GuestUploadNonFlash.removeValue(imgid, inputId, container);
//    }
//}

//GuestUploadNonFlash.removeAdminImage = function (imgid, inputId, container) {

//    if (confirm(bds_lang.UploadImageControl.ConfirmDelete)) {
//        $('#img' + imgid.replace(/[.]/g, '')).remove();
//        GuestUploadNonFlash.removeValue(imgid, inputId, container);
//    }
//}

//GuestUploadNonFlash.removeValue = function (value, inputid, container) {

//    $('#' + container + ' > .spanButtonPlaceholder').show();

//    var arr = $('#' + inputid).val();
//    if (arr.length == 0)
//        return;
//    else {
//        var ids = '';
//        $('div.imgthumb').each(function () {
//            if (ids.length > 0)
//                ids += ',';
//            ids += $(this).attr('rel');
//        });
//        $('#' + inputid).val(ids);
//    }
//}

//GuestUploadNonFlash.rotateImage = function (id, instanceId, obj) {

  

//}
