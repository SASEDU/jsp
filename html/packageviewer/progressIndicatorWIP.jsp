<%@ taglib uri="http://www.sas.com/taglib/saspackageviewer" prefix="packageviewer"%>

<div id="progressIndicatorWIP" style="visibility:visible; position:absolute;top:90px;  left:0px; z-index:3001; width:100%; height:90%; border: none; background-color: #FFFFFF">
    <table border="0" cellspacing="0" cellpadding="0" style="height:100%;width:100%;" summary="">
        <tr>
            <td style="text-align:center;vertical-align:top;">
                <table border="0" cellspacing="0" cellpadding="0" style="width:100%;" summary="">

                    <tr>
                        <td style="text-align:center;vertical-align:bottom;">
                            <img id="progressIndicatorImage" src='<packageviewer:ImagePath image="progress.gif"/>'
                                style="width:120px; height:120px" alt="<packageviewer:Text key="please.wait.txt" />" />
                        </td>
                    </tr>
                    <tr><td class="lineSpacer">&nbsp;</td></tr>
                    <tr>
                        <td style="text-align:center;vertical-align:top;" class="progress">
                            <span id="pleaseWaitMessage">
                                <packageviewer:Text key="please.wait.txt" />
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align:center;vertical-align:top;" class="progress">
                            <span id="progressMessage">
                                <packageviewer:Text key="retrieving.information.txt" />
                            </span>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>


