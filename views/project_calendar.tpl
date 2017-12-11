<!-- iframe里日历-->
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='/static/css/fullcalendar.min.css' />
<script src='/static/js/jquery-2.1.3.min.js'></script>
  <script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="/static/css/bootstrap.min.css"/>
<script src='/static/js/moment.min.js'></script>
<script src='/static/js/fullcalendar.min.js'></script>
<script src='/static/js/fullcalendar.zh-cn.js'></script>
<script src='/static/js/bootstrap-datetimepicker.min.js'></script>
<script src='/static/js/bootstrap-datetimepicker.zh-CN.js'></script>

<link rel='stylesheet' href='/static/css/bootstrap-datetimepicker.min.css'/>
<link rel="stylesheet" type="text/css" href="/static/font-awesome-4.7.0/css/font-awesome.min.css"/>
<link rel="stylesheet" type="text/css" href="/static/fex-team-webuploader/css/webuploader.css">
<script type="text/javascript" src="/static/fex-team-webuploader/dist/webuploader.min.js"></script>

<style>
	/*body {
		margin: 0;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}*/

	#script-warning {
		display: none;
		background: #eee;
		border-bottom: 1px solid #ddd;
		padding: 0 10px;
		line-height: 40px;
		text-align: center;
		font-weight: bold;
		font-size: 12px;
		color: red;
	}

	#loading {
		display: none;
		position: absolute;
		top: 10px;
		right: 10px;
	}

	#calendar {
		max-width: 900px;
		margin: 40px auto;
		padding: 0 10px;
	}

	/*body {这个导致窗口挪动，不好
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}*/

	/*#calendar {
		max-width: 900px;
		margin: 0 auto;
	}*/
		  .fc-color-picker {
    		list-style: none;
    		margin: 0;
    		padding: 0;
    	}
    	.fc-color-picker > li {
    	  float: left;
    	  font-size: 30px;
    	  margin-right: 5px;
    	  line-height: 30px;
    	}
    	.fc-color-picker > li .fa {
    	  -webkit-transition: -webkit-transform linear 0.3s;
    	  -moz-transition: -moz-transform linear 0.3s;
    	  -o-transition: -o-transform linear 0.3s;
    	  transition: transform linear 0.3s;
    	}
    	.fc-color-picker > li .fa:hover {
    	  -webkit-transform: rotate(30deg);
    	  -ms-transform: rotate(30deg);
    	  -o-transform: rotate(30deg);
    	  transform: rotate(30deg);
    	}
    	.text-red {
  			color: #dd4b39 !important;
		  }
		  .text-yellow {
		    color: #f39c12 !important;
		  }
		  .text-aqua {
		    color: #00c0ef !important;
		  }
		  .text-blue {
		    color: #0073b7 !important;
		  }
		  .text-black {
		    color: #111111 !important;
		  }
		  .text-light-blue {
		    color: #3c8dbc !important;
		  }
		  .text-green {
		    color: #00a65a !important;
		  }
		  .text-gray {
		    color: #d2d6de !important;
		  }
		  .text-navy {
		    color: #001f3f !important;
		  }
		  .text-teal {
		    color: #39cccc !important;
		  }
		  .text-olive {
		    color: #3d9970 !important;
		  }
		  .text-lime {
		    color: #01ff70 !important;
		  }
		  .text-orange {
		    color: #ff851b !important;
		  }
		  .text-fuchsia {
		    color: #f012be !important;
		  }
		  .text-purple {
		    color: #605ca8 !important;
		  }
		  .text-maroon {
		    color: #d81b60 !important;
		  }
</style>
</head>
<!-- <body> -->
<script type="text/javascript">
$(document).ready(function() {
    // page is now ready, initialize the calendar...
    $('#calendar').fullCalendar({
        // put your options and callbacks here
      header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay,listMonth'
			},
			// defaultDate: '2017-01-12',
			navLinks: true, // can click day/week names to navigate views
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			businessHours: true, // display business hours
			selectable: true,
			selectHelper: true,
			// select: function(start, end) {
			// 	var title = prompt('Event Title:');
			// 	var eventData;
			// 	if (title) {
			// 		eventData = {
			// 			title: title,
			// 			start: start,
			// 			end: end,
			// 			// Color: getRandomColor(),
			// 			textColor: getRandomColor(),
			// 			backgroundColor: getRandomColor(),
			// 			// borderColor: getRandomColor(),
   			//             className: 'done',
			// 		};
			// 		$('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
			// 	}
			// 	$('#calendar').fullCalendar('unselect');
			// },
			select: function(start, end, jsEvent, view){  
                    //添加日程事件
                    // $("input#cid").remove();
      				// var th1="<input id='cid' type='hidden' name='cid' value='" +selectRow[0].Id+"'/>"
      				// $(".modal-body").append(th1);//这里是否要换名字$("p").remove();
      				$("#start").val(start.format('YYYY-MM-DD HH:mm'));
      				$("#end").val(end.format('YYYY-MM-DD HH:mm'));
        			$('#modalTable').modal({
        				show:true,
        				backdrop:'static'
        			});
            },
			editable: true,
			// events: '/project/calendar',
			// eventSources: [  
      //      		'/feed1.php',  
      //      		'/feed2.php'  
      //  		]
			events: {  
        		url: '/project/'+{{.ProjectId}}+'/calendar',  
        		type: 'post'  
    		},
			// events: {
			// 	url: '/project/getcalendar',
			// 	error: function() {
			// 		$('#script-warning').show();
			// 	}
			// },
			loading: function(bool) {
				$('#loading').toggle(bool);
			},
			// events: [
			// 	{
			// 		title: 'All Day Event',
			// 		start: '2017-01-01'
			// 	},
			// 	{
			// 		title: 'Long Event',
			// 		start: '2017-01-07',
			// 		end: '2017-01-10'
			// 	},
			// 	{
			// 		id: 999,
			// 		title: 'Repeating Event',
			// 		start: '2017-01-09T16:00:00'
			// 	},
			// 	{
			// 		id: 999,
			// 		title: 'Repeating Event',
			// 		start: '2017-01-16T16:00:00'
			// 	},
			// 	{
			// 		title: 'Conference',
			// 		start: '2017-01-11',
			// 		end: '2017-01-13'
			// 	},
			// 	{
			// 		title: 'Meeting',
			// 		start: '2017-01-12T10:30:00',
			// 		end: '2017-01-12T12:30:00'
			// 	},
			// 	{
			// 		title: 'Lunch',
			// 		start: '2017-01-12T12:00:00'
			// 	},
			// 	{
			// 		title: 'Meeting',
			// 		start: '2017-01-12T14:30:00'
			// 	},
			// 	{
			// 		title: 'Happy Hour',
			// 		start: '2017-01-12T17:30:00'
			// 	},
			// 	{
			// 		title: 'Dinner',
			// 		start: '2017-01-12T20:00:00'
			// 	},
			// 	{
			// 		title: 'Birthday Party',
			// 		start: '2017-01-13T07:00:00'
			// 	},
			// 	{
			// 		title: 'Click for Google',
			// 		url: 'http://google.com/',
			// 		start: '2017-01-28'
			// 	}
			// ],
			dayClick: function(date, jsEvent, view) {
        		// alert('Clicked on: ' + date.format());
        		// alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
        		// alert('Current view: ' + view.name);
        		// change the day's background color just for fun
        		// $(this).css('background-color', getRandomColor());
    	},
    	eventClick: function(data, jsEvent, view){  
        //修改日程事件 
        $("input#cid").remove();
        $("img").remove();
        $(".file-item").remove();
      	var th1="<input id='cid' type='hidden' name='cid' value='" +data.id+"'/>"
      				$(".modal-body").append(th1);
      				$("#title1").val(data.title);
      				$("#content1").val(data.content);
              $("#isallday1").prop('checked',data.allDay);
              $("#ismemorabilia1").prop('checked',data.memorabilia);
              $("#ispublic1").prop('checked',false);
                // $("#ispublic1[name='private']").prop('checked',false);
              if (data.Public==true){
                $("#ispublic1[value='true']").prop('checked',true);
              }else{
                $("#ispublic1[value='false']").prop('checked',true);
              }
              // $("#ispublic1").prop('checked',data.Public);
      				$("#start1").val(data.start.format('YYYY-MM-DD HH:mm'));
              // if (data.allDay){

              if (data.end){
              // }else{
                $("#end1").val(data.end.format('YYYY-MM-DD HH:mm'));
              }
					    $('#add-new-event1').css({"background-color": data.color, "border-color": data.color});
              var $list1 = $('#fileList1');
              $("img").remove();
              // $("input#imgurl").remove();
              if (data.image){
                var $li = $(
                  '<div id="' + data.id + '" class="file-item thumbnail">' +
                  '<img>' +
                  '<div class="info">' + data.title + '</div>' +
                  '</div>'
                  ),
                img = $li.find('img');
                $list1.append( $li );
                img.attr( 'src', data.image );
                // $("#uploader-demo1").append($("<img style='width:100%'/>").attr("src",data.image));
              }
        			$('#modalTable1').modal({
        				show:true,
        				backdrop:'static'
        			});  
            },
        eventDrop: function(event,delta,revertFunc) {
          // alert(event.id+event.title+delta.days());
          // var url = "/project/calendar/dropcalendar";
          // $.post(url,{id:event.id,dalta:delta.days()},function(msg){
          //   });
          $.ajax({
                type:"post",
                url:"/project/calendar/dropcalendar",
                data: {id:event.id,delta:delta.days()},
                success:function(data,status){
                  alert("修改“"+data+"”成功！(status:"+status+".)");
                },
                error:function(data,status){
                  alert(data);
                  revertFunc();
                }
            });
        },
        eventResize: function(event,delta,revertFunc) {
          // alert(delta.asHours());
          $.ajax({
                type:"post",
                url:"/project/calendar/resizecalendar",
                data: {id:event.id,delta:delta.asHours()},
                success:function(data,status){
                  alert("修改“"+data+"”成功！(status:"+status+".)");
                },
                error:function(data,status){
                  alert(data);
                  revertFunc();
                }
            });     
          }
});
});
// RGB 转16进制
  var rgbToHex = function(rgb) {
    // rgb(x, y, z)
    var color = rgb.toString().match(/\d+/g); // 把 x,y,z 推送到 color 数组里
    var hex = "#";
    for (var i = 0; i < 3; i++) {
      // 'Number.toString(16)' 是JS默认能实现转换成16进制数的方法.
      // 'color[i]' 是数组，要转换成字符串.
      // 如果结果是一位数，就在前面补零。例如： A变成0A
      hex += ("0" + Number(color[i]).toString(16)).slice(-2);
    }
    return hex;
  }
  // 16进制 转 RGB
  
  // 能处理 #axbycz 或 #abc 形式
  var hexToRgb = function(hex) {
    var color = [], rgb = [];
    hex = hex.replace(/#/,"");
    if (hex.length == 3) { // 处理 "#abc" 成 "#aabbcc"
      var tmp = [];
      for (var i = 0; i < 3; i++) {
        tmp.push(hex.charAt(i) + hex.charAt(i));
      }
      hex = tmp.join("");
    }
    for (var i = 0; i < 3; i++) {
      color[i] = "0x" + hex.substr(i+2, 2);
      rgb.push(parseInt(Number(color[i])));
    }
    return "rgb(" + rgb.join(",") + ")";
  }

	function getRandomColor(){ 
		var c = '#'; 
		var cArray = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F']; 
		for(var i = 0; i < 6;i++){ 
			var cIndex = Math.round(Math.random()*15); 
			c += cArray[cIndex]; 
		} 
			return c; 
	}

	function save(){
    var projectid = {{.ProjectId}};
    var title = $('#title').val();
    var content = $('#content').val();
    var start = $('#start').val();
    var end = $('#end').val();
    var allday=document.getElementById("isallday").checked;
    var public=document.getElementById("ispublic").checked;
    var memorabilia=document.getElementById("ismemorabilia").checked;
    var url=$('#imgurl').val();
    // alert(allday);
    // alert(public);
      if (title){  
            $.ajax({
                type:"post",
                url:"/project/"+{{.ProjectId}}+"/calendar/addcalendar",
                data: {projectid:projectid,title:title,content:content,allday:allday,public:public,memorabilia:memorabilia,start:start,end:end,color:rgbToHex(currColor),url:url},
                success:function(data,status){
                  alert("添加“"+data+"”成功！(status:"+status+".)");
                  // if (end==""){
                  //   end=start
                  // };
                  var eventData;
					        if (title) {
					         eventData = {
					       	 title: title,
					       	 content: content,
					       	 start: start,
					       	 end: end,
                    color:rgbToHex(currColor),
					       	// textColor: getRandomColor(),
					       	// backgroundColor: rgbToHex(currColor),
					       	// borderColor: rgbToHex(currColor),
   			            className: 'done',
					         };
					         // $('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true要用下面这个，否则添加后立即删除，无法删除
            $('#calendar').fullCalendar('refetchEvents'); //重新获取所有事件数据
				    }
				    $('#calendar').fullCalendar('unselect'); 
          			$('#modalTable').modal('hide');
                }
            });  
      }
    }

  function update(){
  	  var title = $('#title1').val();
      var content = $('#content1').val();
      var start = $('#start1').val();
      var end = $('#end1').val();
      var cid = $('#cid').val();
      var allday=document.getElementById("isallday1").checked;
      var public=document.getElementById("ispublic1").checked;
      var memorabilia=document.getElementById("ismemorabilia1").checked;
      // var url=$('img').attr('src');保留，供参考
      var url=$('#imgurl').val();
      var currColor=$('#add-new-event1').css("background-color");
      if (title){  
            $.ajax({
                type:"post",
                url:"/project/calendar/updatecalendar",
                data: {cid:cid,title:title,content:content,allday:allday,public:public,memorabilia:memorabilia,start:start,end:end,color:rgbToHex(currColor),url:url},
                success:function(data,status){
                  alert("修改“"+data+"”成功！(status:"+status+".)");
					       $('#calendar').fullCalendar('refetchEvents'); //重新获取所有事件数据 // stick? = true 
          			   $('#modalTable1').modal('hide');
                }
            });  
      }
  }
  //删除事件
  function delete_event(){
        if(confirm("您确定要删除吗？")){
            var cid = $("#cid").val();  
              $.ajax({
                type:"post",
                url:"/project/calendar/deletecalendar",
                data: {cid:cid},
                success:function(data,status){
                  alert("删除“"+data+"”成功！(status:"+status+".)");
					 //从日程视图中删除该事件
                     $("#calendar").fullCalendar("removeEvents",cid); // stick? = true
          			$('#modalTable1').modal('hide');
                }
              });  
        }
  } 
</script>
<!-- <div class="col-lg-12"> -->
	<div id='calendar'></div>
<!-- </div> -->

	<!-- 新建日程窗口 -->
<div class="container">
  <form class="form-horizontal">
    <div class="modal fade" id="modalTable">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">
              <span aria-hidden="true">&times;</span>
            </button>
            <h3 class="modal-title">添加日程</h3>
          </div>
          <div class="modal-body">
            <div class="modal-body-content">
              <div class="form-group must">
                <label class="col-sm-3 control-label">标题</label>
                <div class="col-sm-7">
                  <input type="text" class="form-control" id="title"></div>
              </div>
              <div class="form-group must">
                    <label class="col-sm-3 control-label">内容</label>
                    <div class="col-sm-7">
                      <textarea class="form-control" rows="3" id='content'></textarea>
                    </div>    
              </div>
              <div class="form-group must">
                <label class="col-sm-3 control-label">全天事件</label>
                <div class="col-sm-7 checkbox">
                  <label>
                  <input type="checkbox" value="true" id="isallday"></label>
                  <label>
                  <input type="radio" id="ispublic" value="true" name="public" checked="checked">公开</label>
                  <label>
                  <input type="radio" id="ispublic" value="false" name="public">私有</label>
                </div>
              </div>
              <div class="form-group must">
                <label class="col-sm-3 control-label">是否作为大事记</label>
                <div class="col-sm-7 checkbox">
                  <label>
                  <input type="checkbox" value="true" id="ismemorabilia"></label>
                    <!-- <form method="post" id="form1" action="/admin/user/importusers" enctype="multipart/form-data">
                        <label>选择图片：
                        <input type="file" class="form-control" name="photo" id="photo"/> </label>
                    </form> -->

                </div>
                
              </div>
              <!-- $('input:radio:checked').val()；
              $("input[type='radio']:checked").val();
              $("input[name='rd']:checked").val(); --> 
              <div class="form-group must">
                <label class="col-sm-3 control-label">开始时间</label>
                <div class="input-group date form_datetime col-sm-7" data-link-field="dtp_input1">
                    <input class="form-control" type="text" id="start" readonly="">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					         <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                </div>
				        <input type="hidden" id="dtp_input1" value="">
              </div>
              <div class="form-group must">
                <label class="col-sm-3 control-label">结束时间</label>
                <div class="input-group date form_datetime col-sm-7" data-link-field="dtp_input1">
                    <input class="form-control" type="text" id="end" readonly="">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					           <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                </div>
				        <input type="hidden" id="dtp_input1" value="">
              </div>
              <div class="form-group must">
                <label class="col-sm-3 control-label">选择背景色</label>
                <div class="col-sm-7">
                  <div class="btn-group" style="width: 100%; margin-bottom: 10px;">
                    <ul class="fc-color-picker" id="color-chooser">
                      <li><a class="text-aqua" href="#"><i class="fa fa-square"></i></a></li>
                      <li><a class="text-blue" href="#"><i class="fa fa-square"></i></a></li>
                      <li><a class="text-light-blue" href="#"><i class="fa fa-square"></i></a></li>
                      <li><a class="text-teal" href="#"><i class="fa fa-square"></i></a></li>
                      <li><a class="text-yellow" href="#"><i class="fa fa-square"></i></a></li>
                      <li><a class="text-orange" href="#"><i class="fa fa-square"></i></a></li>
                      <li><a class="text-green" href="#"><i class="fa fa-square"></i></a></li>
                      <li><a class="text-lime" href="#"><i class="fa fa-square"></i></a></li>
                      <li><a class="text-red" href="#"><i class="fa fa-square"></i></a></li>
                      <li><a class="text-purple" href="#"><i class="fa fa-square"></i></a></li>
                      <li><a class="text-fuchsia" href="#"><i class="fa fa-square"></i></a></li>
                      <li><a class="text-muted" href="#"><i class="fa fa-square"></i></a></li>
                      <li><a class="text-navy" href="#"><i class="fa fa-square"></i></a></li>
                    </ul>
                  </div>
                </div>
              </div>
              <div id="uploader-demo" style="position:relative;text-align: center;">
                <!--用来存放item-->
                <div id="fileList" class="uploader-list"></div>
                <div id="filePicker">选择图片</div>
              </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
          <button type="button" id="add-new-event" class="btn btn-primary" onclick="save()">保存</button>
        </div>
      </div>
    </div>
  </div>
</form>
</div>

<!-- 编辑日程窗口 -->
<div class="container">
  <div class="form-horizontal">
    <div class="modal fade" id="modalTable1">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">
              <span aria-hidden="true">&times;</span>
            </button>
            <h3 class="modal-title">编辑日程</h3>
          </div>
          <div class="modal-body">
            <div class="modal-body-content">
              <div class="form-group must">
                <label class="col-sm-3 control-label">标题</label>
                <div class="col-sm-7">
                  <input type="text" class="form-control" id="title1"></div>
              </div>
              <div class="form-group must">
                    <label class="col-sm-3 control-label">内容</label>
                    <div class="col-sm-7">
                      <textarea class="form-control" rows="3" id='content1'></textarea>
                    </div>    
               </div>
               <div class="form-group must">
                <label class="col-sm-3 control-label">全天事件</label>
                <div class="col-sm-7 checkbox">
                  <label>
                  <input type="checkbox" value="true" id="isallday1"></label>
                  <label>
                  <input type="radio" id="ispublic1" value="true" name="public1" checked="checked">公开</label>
                  <label>
                  <input type="radio" id="ispublic1" value="false" name="public1">私有</label>
                </div>
              </div>
              <div class="form-group must">
                <label class="col-sm-3 control-label">是否作为大事记</label>
                <div class="col-sm-7 checkbox">
                  <label>
                  <input type="checkbox" value="true" id="ismemorabilia1"></label>
                </div>
              </div>
               <div class="form-group must">
                <label class="col-sm-3 control-label">开始时间</label>
                <!-- <div class="col-sm-7">
                  <input type="text" class="form-control" id="start">
                </div> -->
                <div class="input-group date form_datetime col-sm-7" data-link-field="dtp_input1">
                    <input class="form-control" type="text" id="start1" readonly="">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					           <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                </div>
				        <input type="hidden" id="dtp_input1" value="">
              </div>
              <div class="form-group must">
                <label class="col-sm-3 control-label">结束时间</label>
                <!-- <div class="col-sm-7">
                  <input type="tel" class="form-control" id="end">
                </div> -->

                <div class="input-group date form_datetime col-sm-7" data-link-field="dtp_input1">
                    <input class="form-control" type="text" id="end1" readonly="">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					           <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                </div>
				        <input type="hidden" id="dtp_input1" value="">

              </div>
              <div class="form-group must">
                <label class="col-sm-3 control-label">选择背景色</label>
                <div class="col-sm-7">
                  <div class="btn-group" style="width: 100%; margin-bottom: 10px;">
                  <!--<button type="button" id="color-chooser-btn" class="btn btn-info btn-block dropdown-toggle" data-toggle="dropdown">Color <span class="caret"></span></button>-->
                    <ul class="fc-color-picker" id="color-chooser1">
                      <li><a class="text-aqua" href="#"><i class="fa fa-square"></i></a></li>
                      <li><a class="text-blue" href="#"><i class="fa fa-square"></i></a></li>
                      <li><a class="text-light-blue" href="#"><i class="fa fa-square"></i></a></li>
                      <li><a class="text-teal" href="#"><i class="fa fa-square"></i></a></li>
                      <li><a class="text-yellow" href="#"><i class="fa fa-square"></i></a></li>
                      <li><a class="text-orange" href="#"><i class="fa fa-square"></i></a></li>
                      <li><a class="text-green" href="#"><i class="fa fa-square"></i></a></li>
                      <li><a class="text-lime" href="#"><i class="fa fa-square"></i></a></li>
                      <li><a class="text-red" href="#"><i class="fa fa-square"></i></a></li>
                      <li><a class="text-purple" href="#"><i class="fa fa-square"></i></a></li>
                      <li><a class="text-fuchsia" href="#"><i class="fa fa-square"></i></a></li>
                      <li><a class="text-muted" href="#"><i class="fa fa-square"></i></a></li>
                      <li><a class="text-navy" href="#"><i class="fa fa-square"></i></a></li>
                    </ul>
                  </div>
                </div>
              </div>
              <div id="uploader-demo1" style="position:relative;text-align: center;">
              <!-- <div class="file-item thumbnail upload-state-done"><img src=""></div> -->
                <!--用来存放item-->
                <div id="fileList1" class="uploader-list"></div>
                <div id="filePicker1">选择图片</div>
              </div>  
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
          <!-- <button type="button" class="btn btn-primary" onclick="update()">修改</button> -->
          <button type="button" id="add-new-event1" class="btn btn-primary" onclick="update()">修改</button>
          <button type="button" class="btn btn-danger" onclick="delete_event()">删除</button>
        </div>
      </div>
    </div>
  </div>
</div>
</div> 

<script type="text/javascript">
    $('.form_datetime').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
        showMeridian: 1
    });
	$('.form_date').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    });
	$('.form_time').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 1,
		minView: 0,
		maxView: 1,
		forceParse: 0
    });
</script>
<script>
  var currColor = "#3c8dbc"; //Red by default
  $(function () {
    /* ADDING EVENTS */
    //Color chooser button
    // var colorChooser = $("#color-chooser-btn");
    $("#color-chooser > li > a").click(function (e) {
      e.preventDefault();
      //Save color
      currColor = $(this).css("color");
      //Add color effect to button
      $('#add-new-event').css({"background-color": currColor, "border-color": currColor});
    });
    $("#color-chooser1 > li > a").click(function (e) {
      e.preventDefault();
      //Save color
      currColor = $(this).css("color");
      //Add color effect to button
      $('#add-new-event1').css({"background-color": currColor, "border-color": currColor});
    });
  });

    // $("#isallday").click(function(){//是否是全天事件
    //   if($("#sel_start").css("display")=="none"){
    //     $("#sel_start,#sel_end").show();
    //   }else{
    //      $("#sel_start,#sel_end").hide();
    //   }
    // });
    // $("#isend").click(function(){//是否有结束时间
    //   if($("#p_endtime").css("display")=="none"){
    //     $("#p_endtime").show();
    //   }else{
    //     $("#p_endtime").hide();
    //   }
    //});

    // $("#add-new-event").click(function (e) {
    //   e.preventDefault();
    //   //Get value and make sure it is not null
    //   var val = $("#new-event").val();
    //   if (val.length == 0) {
    //     return;
    //   }

    //   //Create events
    //   var event = $("<div />");
    //   event.css({"background-color": currColor, "border-color": currColor, "color": "#fff"}).addClass("external-event");
    //   event.html(val);
    //   $('#external-events').prepend(event);

    //   //Add draggable funtionality
    //   ini_events(event);

    //   //Remove event from text input
    //   $("#new-event").val("");
    // });
    //修改日程
  $(document).ready(function() {
    // var $ = jQuery,
    // var $index=0,
    // $image,
    $list1 = $('#fileList1');
    // $btn = $('#ctlBtn');
    // 优化retina, 在retina下这个值是2
    ratio = window.devicePixelRatio || 1;
    // 缩略图大小
    thumbnailWidth = 100 * ratio;
    thumbnailHeight = 100 * ratio;
    // Web Uploader实例
    uploader;
    // 初始化Web Uploader
    var uploader = WebUploader.create({
      // 自动上传。
      auto: true,
      // swf文件路径
      swf: '/static/fex-team-webuploader/dist/Uploader.swf',
      // 文件接收服务端。
      server: '/project/calendar/uploadimage',
      // 选择文件的按钮。可选。
      // 内部根据当前运行是创建，可能是input元素，也可能是flash.
      pick: '#filePicker1',
      // 只允许选择文件，可选。
      accept: {
        title: 'Images',
        extensions: 'gif,jpg,jpeg,bmp,png',
        mimeTypes: 'image/gif,image/jpg,image/jpeg,image/bmp,image/png'
      }
    });

    // uploader.addButton({
    //   id: '#filePicker1',
    //   innerHTML: '选择文件'
    // });
    // 当有文件添加进来的时候
    uploader.on( 'fileQueued', function( file ) {
      var $li = $(
        '<div id="' + file.id + '" class="file-item thumbnail">' +
            '<img>' +
            '<div class="info">' + file.name + '</div>' +
        '</div>'
      ),
      $img = $li.find('img');
      $("div.file-item").remove();
      $list1.append( $li );

      // 创建缩略图
      uploader.makeThumb( file, function( error, src ) {
        if ( error ) {
          $img.replaceWith('<span>不能预览</span>');
          return;
        }
        $img.attr( 'src', src );
      }, thumbnailWidth, thumbnailHeight );
    });

    uploader.on( 'startUpload', function() {//uploadBeforeSend——这个居然不行？
      var pid = {{.ProjectId}};
      uploader.option('formData', {
        "pid":pid,
      });        
    });

    // 文件上传过程中创建进度条实时显示。
    uploader.on( 'uploadProgress', function( file, percentage ) {
      var $li = $( '#'+file.id ),
          $percent = $li.find('.progress span');
      // 避免重复创建
      if ( !$percent.length ) {
        $percent = $('<p class="progress"><span></span></p>')
                  .appendTo( $li )
                  .find('span');
      }
      $percent.css( 'width', percentage * 100 + '%' );
    });

    // 文件上传成功，给item添加成功class, 用样式标记上传成功。
    uploader.on( 'uploadSuccess', function( file,response ) {
      // $img=$image.find('img');
      // $img.arrt('src',response.url);
      $( '#'+file.id ).addClass('upload-state-done');
      $("input#imgurl").remove();
      var th1="<input id='imgurl' type='hidden' value='" +response.url+"'/>";
      $list1.append(th1);
    });

    // 文件上传失败，显示上传出错。
    uploader.on( 'uploadError', function( file ) {
      var $li = $( '#'+file.id ),
          $error = $li.find('div.error');
      // 避免重复创建
      if ( !$error.length ) {
          $error = $('<div class="error"></div>').appendTo( $li );
      }
      $error.text('上传失败');
    });

    // 完成上传完了，成功或者失败，先删除进度条。
    uploader.on( 'uploadComplete', function( file ) {
      $( '#'+file.id ).find('.progress').remove();
    });

    // $('#filePicker').on('click',function(){
    //   $index=$(this).index('#filePicker');
    //   $image=$($('.img').get($index));
    //   uploader.reset();
    // })

    $('#filePicker1').mouseenter(function(){
      uploader.refresh();
    })
    $('#modalTable').on('hide.bs.modal',function(){
      $list1.text("");
      $("input#imgurl").remove();
    })
  })

  // 图片上传demo
  // jQuery(function() {
  $(document).ready(function() {
    // var $ = jQuery,
    // var $index=0,
    // $image,
    $list = $('#fileList');
    // $btn = $('#ctlBtn');
    // 优化retina, 在retina下这个值是2
    ratio = window.devicePixelRatio || 1;
    // 缩略图大小
    thumbnailWidth = 100 * ratio;
    thumbnailHeight = 100 * ratio;
    // Web Uploader实例
    uploader;
    // 初始化Web Uploader
    var uploader = WebUploader.create({
      // 自动上传。
      auto: true,
      // swf文件路径
      swf: '/static/fex-team-webuploader/dist/Uploader.swf',
      // 文件接收服务端。
      server: '/project/calendar/uploadimage',
      // 选择文件的按钮。可选。
      // 内部根据当前运行是创建，可能是input元素，也可能是flash.
      pick: '#filePicker',
      // 只允许选择文件，可选。
      accept: {
        title: 'Images',
        extensions: 'gif,jpg,jpeg,bmp,png',
        mimeTypes: 'image/gif,image/jpg,image/jpeg,image/bmp,image/png'
      }
    });

    // uploader.addButton({
    //   id: '#filePicker1',
    //   innerHTML: '选择文件'
    // });
    // 当有文件添加进来的时候
    uploader.on( 'fileQueued', function( file ) {
      var $li = $(
        '<div id="' + file.id + '" class="file-item thumbnail">' +
            '<img>' +
            '<div class="info">' + file.name + '</div>' +
        '</div>'
      ),
      $img = $li.find('img');
      $list.append( $li );

      // 创建缩略图
      uploader.makeThumb( file, function( error, src ) {
        if ( error ) {
          $img.replaceWith('<span>不能预览</span>');
          return;
        }
        $img.attr( 'src', src );
      }, thumbnailWidth, thumbnailHeight );
    });

    uploader.on( 'startUpload', function() {//uploadBeforeSend——这个居然不行？
      var pid = {{.ProjectId}};
      uploader.option('formData', {
        "pid":pid,
      });        
    });

    // 文件上传过程中创建进度条实时显示。
    uploader.on( 'uploadProgress', function( file, percentage ) {
      var $li = $( '#'+file.id ),
          $percent = $li.find('.progress span');
      // 避免重复创建
      if ( !$percent.length ) {
        $percent = $('<p class="progress"><span></span></p>')
                  .appendTo( $li )
                  .find('span');
      }
      $percent.css( 'width', percentage * 100 + '%' );
    });

    // 文件上传成功，给item添加成功class, 用样式标记上传成功。
    uploader.on( 'uploadSuccess', function( file,response ) {
      // $img=$image.find('img');
      // $img.arrt('src',response.url);
      $( '#'+file.id ).addClass('upload-state-done');
      $("input#imgurl").remove();
      var th1="<input id='imgurl' type='hidden' value='" +response.url+"'/>";
      $list.append(th1);
    });

    // 文件上传失败，显示上传出错。
    uploader.on( 'uploadError', function( file ) {
      var $li = $( '#'+file.id ),
          $error = $li.find('div.error');
      // 避免重复创建
      if ( !$error.length ) {
          $error = $('<div class="error"></div>').appendTo( $li );
      }
      $error.text('上传失败');
    });

    // 完成上传完了，成功或者失败，先删除进度条。
    uploader.on( 'uploadComplete', function( file ) {
      $( '#'+file.id ).find('.progress').remove();
    });

    // $('#filePicker').on('click',function(){
    //   $index=$(this).index('#filePicker');
    //   $image=$($('.img').get($index));
    //   uploader.reset();
    // })

    $('#filePicker').mouseenter(function(){
      uploader.refresh();
    })
    $('#modalTable').on('hide.bs.modal',function(){
      $list.text("");
    })
  })

      // 日程编辑中的图片上传demo——这个也有效
      // jQuery(function() {
      // var $ = jQuery,
  // $(document).ready(function() {
  //   $list1 = $('#fileList1');
  //   // $btn = $('#ctlBtn');
  //   // 优化retina, 在retina下这个值是2
  //   ratio = window.devicePixelRatio || 1;
  //   // 缩略图大小
  //   thumbnailWidth = 100 * ratio;
  //   thumbnailHeight = 100 * ratio;
  //   $('#modalTable1').on('shown.bs.modal',function(e){
  //     // Web Uploader实例
  //     uploader;
  //     // 初始化Web Uploader
  //     var uploader = WebUploader.create({
  //       // 自动上传。
  //       auto: true,
  //       // swf文件路径
  //       swf: '/static/fex-team-webuploader/dist/Uploader.swf',
  //       // 文件接收服务端。
  //       server: '/project/calendar/uploadimage',
  //       // 选择文件的按钮。可选。
  //       // 内部根据当前运行是创建，可能是input元素，也可能是flash.
  //       pick: '#filePicker1',
  //       // 只允许选择文件，可选。
  //       accept: {
  //           title: 'Images',
  //           extensions: 'gif,jpg,jpeg,bmp,png',
  //           mimeTypes: 'image/*'
  //       }
  //     });
  //     // 当有文件添加进来的时候
  //     uploader.on( 'fileQueued', function( file ) {
  //         var $li = $(
  //                 '<div id="' + file.id + '" class="file-item thumbnail">' +
  //                     '<img>' +
  //                     '<div class="info">' + file.name + '</div>' +
  //                 '</div>'
  //                 ),
  //             $img = $li.find('img');
  //         $list1.append( $li );

  //         // 创建缩略图
  //         uploader.makeThumb( file, function( error, src ) {
  //             if ( error ) {
  //                 $img.replaceWith('<span>不能预览</span>');
  //                 return;
  //             }
  //             $img.attr( 'src', src );
  //         }, thumbnailWidth, thumbnailHeight );
  //     });

  //     uploader.on( 'startUpload', function() {//uploadBeforeSend——这个居然不行？
  //       var pid = {{.ProjectId}};
  //       uploader.option('formData', {
  //         "pid":pid,
  //       });        
  //     });

  //     // 文件上传过程中创建进度条实时显示。
  //     uploader.on( 'uploadProgress', function( file, percentage ) {
  //          var $li = $( '#'+file.id ),
  //              $percent = $li.find('.progress span');

  //         // 避免重复创建
  //         if ( !$percent.length ) {
  //             $percent = $('<p class="progress"><span></span></p>')
  //                     .appendTo( $li )
  //                     .find('span');
  //         }
  //         $percent.css( 'width', percentage * 100 + '%' );
  //     });

  //     // 文件上传成功，给item添加成功class, 用样式标记上传成功。
  //     uploader.on( 'uploadSuccess', function( file,response ) {
  //         $( '#'+file.id ).addClass('upload-state-done');
  //         $("input#imgurl1").remove();
  //         var th1="<input id='imgurl1' type='hidden' value='" +response.url+"'/>";
  //         $list1.append(th1);
  //     });

  //     // 文件上传失败，显示上传出错。
  //     uploader.on( 'uploadError', function( file ) {
  //         var $li = $( '#'+file.id ),
  //             $error = $li.find('div.error');
  //         // 避免重复创建
  //         if ( !$error.length ) {
  //             $error = $('<div class="error"></div>').appendTo( $li );
  //         }
  //         $error.text('上传失败');
  //     });

  //     // 完成上传完了，成功或者失败，先删除进度条。
  //     uploader.on( 'uploadComplete', function( file ) {
  //         $( '#'+file.id ).find('.progress').remove();
  //     });

  //     // $('#filePicker1').mouseenter(function(){
  //     //     uploader.reset();
  //     // })
  //     $('#modalTable1').on('hide.bs.modal',function(){
  //       $list1.text("");
  //       uploader.destroy();//销毁uploader
  //     })
  //   })
  // })
</script>

<!-- <canvas id="canvas" width="200" height="200">你的浏览器不支持canvas元素，请更换更先进的浏览器。</canvas>
<script>
var canvas = document.getElementById('canvas');
if (canvas.getContext) {
    var ctx = canvas.getContext('2d');
    ctx.lineWidth = 8;
    ctx.shadowOffsetX = 3;
    ctx.shadowOffsetY = 3;
    ctx.shadowBlur = 2;
    ctx.font = '16px monospace';
    var startAngle = -Math.PI / 2;

    function drawClock() {
        var time = new Date();
        var hours = time.getHours();
        var am = true;
        if (hours >= 12) {
            hours -= 12;
            am = false;
        }
        var minutes = time.getMinutes();
        var seconds = time.getSeconds();

        ctx.clearRect(0, 0, 200, 200);

        ctx.beginPath();
        ctx.strokeStyle = "rgb(255, 0, 0)";
        ctx.shadowColor = "rgba(255, 128, 128, 0.5)";
        ctx.arc(100, 100, 90, startAngle, (hours / 6 + minutes / 360 + seconds / 21600 - 0.5) * Math.PI, false);
        ctx.stroke();

        ctx.beginPath();
        ctx.strokeStyle = "rgb(0, 255, 0)";
        ctx.shadowColor = "rgba(128, 255, 128, 0.5)";
        ctx.arc(100, 100, 75,startAngle, (minutes / 30 + seconds / 1800 - 0.5) * Math.PI, false);
        ctx.stroke();

        ctx.beginPath();
        ctx.strokeStyle = "rgb(0, 0, 255)";
        ctx.shadowColor = "rgba(128, 128, 255, 0.5)";
        ctx.arc(100, 100, 60,startAngle, (seconds / 30 - 0.5) * Math.PI, false);
        ctx.stroke();

        time = [];
        if (hours < 10) {
            time.push('0');
        }
        time.push(hours);
        time.push(':');

        if (minutes < 10) {
            time.push('0');
        }
        time.push(minutes);
        time.push(':');

        if (seconds < 10) {
            time.push('0');
        }
        time.push(seconds);

        if (am) {
            time.push('AM');
        } else {
            time.push('PM');
        }

        ctx.fillText(time.join(''), 50, 105);
    }

    drawClock();
    setInterval(drawClock, 1000);
}
</script> -->

<!-- </body> -->
</html>