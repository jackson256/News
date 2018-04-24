jQuery(document).ready(function() {

    $('.page-container form').submit(function(){
        var username = $(this).find('.username').val();
        var password = $(this).find('.password').val();
        var codeIs_ok = $(this).find('.validationResult').html();
        if(username == '') {
            $(this).find('.error').fadeOut('fast', function(){
                $(this).css('top', '27px');
            });
            $(this).find('.error').fadeIn('fast', function(){
                $(this).parent().find('.username').focus();
            });
            return false;
        }
		
        if(password == '') {
            $(this).find('.error').fadeOut('fast', function(){
                $(this).css('top', '96px');
            });
            $(this).find('.error').fadeIn('fast', function(){
                $(this).parent().find('.password').focus();
            });
            return false;
        }
        
        if(codeIs_ok != "√"){
        	$('.error').fadeOut('fast', function(){   
        		//给error定位到对应的输入框后面
                $(this).css('top', '165px');
            });
            $('.error').fadeIn('fast', function(){            	
                $(this).parent().find('.input').focus();
            });
            return false;
        }
        
    });

    $('.page-container form .username, .page-container form .password,.page-container form .input').keyup(function(){
        $(this).parent().find('.error').fadeOut('fast');
    });

}); 


$(function() {  
    var code = 9999; 
    function codes(){
    	
        var ranColor = '#' + ('00000' + (Math.random() * 0x1000000 << 0).toString(16)).slice(-6); //闅忔満鐢熸垚棰滆壊
    	// alert(ranColor)
    	var ranColor2 = '#' + ('00000' + (Math.random() * 0x1000000 << 0).toString(16)).slice(-6); 
     	var num1 = Math.floor(Math.random() * 100);  
        var num2 = Math.floor(Math.random() * 100);  
        code = num1 + num2;  
        
        $("#code").html(num1 + "+" + num2 + "=?");  
        if ($("#code").hasClass("nocode")) {  
            $("#code").removeClass("nocode");  
            $("#code").addClass("code"); 
        }  
        $("#code").css('background',ranColor);
         $("#code").css('color',ranColor2);
    }
    codes();
   
    $("#code").on('click',codes);
      


    $("#validationInput").mouseout(function(){    
    	
    	if($(".input").val() == code && code != 9999){
    		$(".validationResult").html("√");
    	}else{
    		$(".validationResult").html("X");
    	}
	
    	
    });
    
    
    

});  
