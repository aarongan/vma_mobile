<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en-us" xml:lang="en-us">
    <head>
        <title>Verizon Integrated Communication Services</title>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
        <meta http-equiv="Content-Style-Type" content="text/css" />

        <style type="text/css">
            .actionLink {font-size:12px;font-weight:bold;text-decoration:underline;cursor:pointer;color:#0066CC;}
        </style>
        <link rel='stylesheet' href='../scripts/dojotoolkit/dijit/themes/tundra/tundra.css'/>
        <link rel='stylesheet' href='../scripts/dojotoolkit/dojo/resources/dojo.css'/>
        <link rel='stylesheet' href='../scripts/dojotoolkit/dojox/layout/resources/ResizeHandle.css'/>
        <link rel="stylesheet" href="../styles/css/ics/contacts/ImageCrop.css"/>
        <script type='text/javascript'>
            // setup the module path for ICS
            djConfig = {
                isDebug:true,
                debugAtAllCosts:true,
                parseOnLoad:true,
                modulePaths: {
                    'ics': '../../ics'
                }
            }
        </script>
        <script type="text/javascript" src='../scripts/dojotoolkit/dojo/dojo.js'></script>
        <script type="text/javascript" src='../scripts/ics/app/contacts/imageCrop.js'></script>
    </head>

    <body class="pl tundra" style="font-family:arial;">

        <div id="layer_holder" style="width:560px;height:500px;margin-top:0px;padding-left:10px;padding-right:10px;border-left-width:0px;border-right-width:0px;">
            <p style="font-size:12px;margin:15px 0px 15px 0px">Please upload a picture or select a predefined avatar:</p>
            <p style="font-weight:bold;font-size:12px;margin-bottom:7px;">Upload a Picture</p>
            <img id="cropPicture" width="200" height="200" src="../simulation/contacts/images/no_crop_pic.png" alt="Crop Picture" style="opacity:1.0;"/>
            <p style="margin:5px 0px 20px 0px"><span id="uploadPictureLink" class="actionLink">Upload Picture</span></p>
            <div style="height: 5px;margin:5px 5px 5px 0;border-top:3px dotted #dbdbdb;" class="clear:both;"> </div>
            <p style="font-weight:bold;font-size:12px;margin:0px 0px 5px 0px;">Preview Image</p>
            <div>
                <div id="previewPicture" style="float:left;overflow:hidden; postion:absolute;width:120px;height:120px;">
                	<img src="../styles/images/ics/contacts/icons/default_photo.png" width='100' height='100'/>
                </div>
                <div style="float:left;margin-left:10px;font-size:15px;font-weight:bold;"><%= request.getParameter("contactName") %></div>
            </div>
            <input type="hidden" id="contactId" name="contactId" value="<%= request.getParameter("contactId") %>"/>
            <input type="hidden" id="contentType" name="contentType" value=""/>
            <input type="hidden" id="fileName" name="fileName" value=""/>
        </div>

        <div id="uploadDialog" dojoType="dijit.Dialog" title="Upload Picture" style="width:450px;height:200px" >
        </div>
    </body>
</html>