var inter;

  $(window).load(function(){
        $('#adminmapModal').modal('show');
    });

function alertDivProcess(alertDivMsg,timeDelay){

    processAlertDiv(alertDivMsg,timeDelay);
      
        
}

function processAlertDiv(alertDivMsg,timeDelay)
{
   
    $('#alertid').show();
    $('#alertid').html("Last Operation:::::: " + alertDivMsg.concat("<div id='timeid'> [  " + new Date($.now()) + " ] </div>"));
    //inter = setInterval("processAlertDivHide()", 2000);

}

function processAlertDivHide()
{
    $('#alertid').hide();
    clearInterval(inter);
}

function signinfunc()
{
    $('#loginmapModal').modal();
}

function revertsigninfunc()
{
    var url = 'cgi-la.cgi';
    $(location).attr('href',url);

}

function signinupfunc()
{
    var url = 'cgi-signup.cgi';
    $(location).attr('href',url);

}

function cpProcess(attr, val)
{
	
    if(attr=='THEME')
    {
        var cols = document.getElementsByClassName('labgcolor');
        for(i=0; i<cols.length; i++) {
            cols[i].style.backgroundColor = val;
        }	
    }
}

// When the document is loaded...
$(document).ready(function()
{	

    // Hide the toTop button when the page loads.
    $("#toTop").css("display", "none");

    // This function runs every time the user scrolls the page.
    $(window).scroll(function(){

        // Check weather the user has scrolled down (if "scrollTop()"" is more than 0)
        if($(window).scrollTop() > 0){

            // If it's more than or equal to 0, show the toTop button.
            //console.log("is more");
            $("#toTop").fadeIn("fast");
        }
        else {
            // If it's less than 0 (at the top), hide the toTop button.
            //console.log("is less");
            $("#toTop").fadeOut("fast");

        }
    });

    // When the user clicks the toTop button, we want the page to scroll to the top.
    $("#toTop").click(function(){

        // Disable the default behaviour when a user clicks an empty anchor link.
        // (The page jumps to the top instead of // animating)
        //event.preventDefault();

        // Animate the scrolling motion.
        $("html, body").animate({
            scrollTop:0
        },"slow");

    });

});
        

$(function () {
    $(".editShaker").dblclick(function (e) {
        e.stopPropagation();
        var currentEle = $(this);
        var value = $(this).html();
        updateProcessValue(currentEle, value);
    });
});

function updateProcessValue(currentEle, value) {

    $(currentEle).html('<input class="tdVal" type="text" value="' + value + '" />');

    var mode = $(currentEle).attr('class').split(' ')[1];

    if (mode == 'subjectEdit') {
        //alert("Subject Id");
    }
    
    $(".tdVal").focus();
    $(".tdVal").keyup(function (event) {
        if (event.keyCode == 13) {
            $(currentEle).html($(".tdVal").val().trim());
        }
    });

    $(document).click(function () {
            $(currentEle).html($(".tdVal").val().trim());
    });
}      