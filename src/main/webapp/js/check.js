$(function(){
            $("[name='auction_name' ]").blur(checkName);
         	$("[name='auction_start_price' ]").blur(checkPrice);
         	$("[name='auction_upset']").blur(checkUpset);
         	$("[name='auction_start_time']").blur(checkTime);
         	$("[name='auction_end_time']").blur(checkEndTime); 
         	$("[name='auction_desc' ]").blur(checkDesc);
         
         	$(':file').change(function(event) {
        				//  HTML5 js 对象的获取
           				var files = event.target.files, file;  
        				if(files && files.length > 0){
        					// 获取目前上传的文件
             		 		file = files[0];
             		 		// 文件的限定类型什么的道理是一样的
             		 		if(file.size > 1024 * 1024 * 2) {
        	       			 	alert('图片大小不能超过 2MB!');
        	        			return false;
             				}
              				// file对象生成可用的图片
              				var URL = window.URL || window.webkitURL;
              				// 通过 file 生成目标 url
              				var imgURL = URL.createObjectURL(file);
              				// 用这个 URL 产生一个 <img> 将其显示出来
              				$("img").attr('src', imgURL);
        				}
        			});
         	        	 
        });
         function checkName(){
        		var str=$("[name='auction_name' ]").val();
        		//var reg=/^\w+$/;
        		if(str.length>0){        		    
        		     $("#name").html("输入正确").css("color","green");
        		     return true;
        		}else{
        		    $("#name").html("输入错误，请输入名称").css("color","red");
        			return false;
        		}
        }
        function checkPrice(){
        		var str=$("[name='auction_start_price' ]").val();
        		var reg=/^\d+$/;
        		if(reg.test(str)){
        		     //console.log("true");
        		     $("#resultPrice").html("输入正确").css("color","green");
        		     return true;
        		}else{
        		    $("#resultPrice").html("输入错误，请输入数字").css("color","red");
        			//console.log("false");
        			return false;
        		}
        }
        function checkUpset(){
        		var str=$("[name='auction_upset']").val();
        		var reg=/^\d+$/;
        		if(reg.test(str)){       		    
        		     $("#resultUp").html("输入正确").css("color","green");
        		     return true;
        		}else{
        		    $("#resultUp").html("输入错误，请输入数字").css("color","red");
        			return false;
        		}
        }
        function checkTime(){
        		var str=$("[name='auction_start_time']").val();
        		var reg=/^[1-9]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])\s+(20|21|22|23|[0-1]\d):[0-5]\d:[0-5]\d$/;
        		if(reg.test(str)){       		    
        		     $("#startTime").html("输入正确").css("color","green");
        		     return true;
        		}else{
        		    $("#startTime").html("输入错误，请按正确格式输入,格式：2010-05-05 12:30:00").css("color","red");
        			return false;
        		}
        }
        function checkEndTime(){
        		var str=$("[name='auction_end_time']").val();
        		var reg=/^[1-9]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])\s+(20|21|22|23|[0-1]\d):[0-5]\d:[0-5]\d$/;
        		if(reg.test(str)){       		    
        		     $("#endTime").html("输入正确").css("color","green");
        		     return true;
        		}else{
        		    $("#endTime").html("输入错误，请按正确格式输入,格式：2010-05-05 12:30:00").css("color","red");
        			return false;
        		}
        }
      function   checkDesc(){
            var str = $("[name='auction_desc']").val();
            var reg =/^\w+$/ 
            if(str.length>0){
            	$("#desc").html("输入正确").css("color","green");
            	return true;
            }else{
            	$("#desc").html("请输入描述").css("color","red");
            	return  false;
            }
      }
      function checkFile(){
           var obj=$(":file").val();
           if(obj ==''){
              $("#file").html("请选择图片").css("color","red");
              return false;
             }else{             
               return  true;
             }
      }
        function  check(){
        		if(checkName()&checkPrice()&checkUpset()&checkTime()&checkEndTime()&checkFile()&checkDesc()){
               			return true;
                }
                return false;
        }