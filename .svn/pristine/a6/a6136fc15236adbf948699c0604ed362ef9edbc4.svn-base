<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}/page"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
<title>统计分析 | zbtMonitor</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${ctx}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ctx}/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${ctx}/css/style.css" />
<link rel="stylesheet" href="${ctx}/css/media.css" />
<link href="${ctx}/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
<style>
	label{display: inline-block !important;margin-left: 1em;width: 5em !important;height: 2em !important;line-height: 2em !important;}
	.typeKind{width: 6em !important; height: 2em !important;text-align: center !important;line-height: 2em !important; }
	input.checkbox{line-height: 2em !important;}]
</style>

</head>
<body>

<div id="content">
  <div id="content-header">
    <div id="breadcrumb"><a href="${ctx}/jsp/index.jsp" title="返回首页" class="tip-bottom"><i class="icon-home"></i> 首页</a> </div>
    <h1>统计分析</h1>
  </div>
  <div class="container-fluid">
    <hr>
    <form action="">
    	<span class="label label-info typeKind">媒体类型：</span>
    	<label for="mediaType-1"><input type="checkbox" name="mediaType-1" id="mediaType-1" value="" /> 新闻</label>
    	<label for="mediaType-2"><input type="checkbox" name="mediaType-2" id="mediaType-2" value="" /> 论坛</label>
    	<label for="mediaType-3"><input type="checkbox" name="mediaType-3" id="mediaType-3" value="" /> 博客</label>
    	<label for="mediaType-4"><input type="checkbox" name="mediaType-4" id="mediaType-4" value="" /> 微博</label>
    	<label for="mediaType-5"><input type="checkbox" name="mediaType-5" id="mediaType-5" value="" /> 微信</label>
    </form>
    	<br />
    <form action="" class="controls">
    	<span class="label label-info typeKind">起止时间：</span>
    	<label for="timeType1"><input type="radio" name="timeType" id="timeType1" value="" /> 当天</label>
    	<label for="timeType2"><input type="radio" name="timeType" id="timeType2" value="" /> 一周内</label>
    	<label for="custom"><input type="radio" name="timeType" id="custom" value="" data-date="12-02-2016" class="input-append date datepicker"/> 自定义</label>
    	<input type="text" id="from" style="display: none;" class="kaishi"/> <input type="text" id="to" class="jieshu" style="display: none;"/>
    	
    </form>
    

    
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-signal"></i> </span>
            <h5>总体舆情走势</h5>
          </div>
          <div class="widget-content">
            <div id="placeholder"></div>
            <p id="choices"></p>
          </div>
        </div>
      </div>
    </div>
    
    <div class="row-fluid">
      <div class="span6">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-signal"></i> </span>
            <h5>不同属性信息走势</h5>
          </div>
          <div class="widget-content">
            <div class="chart"></div>
          </div>
        </div>
      </div>
      <div class="span6">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-signal"></i> </span>
            <h5>正负面情感占比</h5>
          </div>
          <div class="widget-content">
            <div class="pie"></div>
          </div>
        </div>
      </div>
    </div>
    
    <div class="row-fluid">
      <div class="span6">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-signal"></i> </span>
            <h5>媒体覆盖占比</h5>
          </div>
          <div class="widget-content">
            <div class="pie"></div>
          </div>
        </div>
      </div>
      <div class="span6">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-signal"></i> </span>
            <h5>媒体类型分析</h5>
          </div>
          <div class="widget-content">
            <div class="bars"></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!--Footer-part-->
<div class="row-fluid">
  <div id="footer" class="span12"> 2016 &copy; 步长制药. Copyright <a href="index.jsp">电商部</a> </div>
</div>
<!--end-Footer-part-->
<script src="${ctx}/js/jquery.min.js"></script> 
<script src="${ctx}/js/jquery.ui.custom.js" type="text/javascript" charset="utf-8"></script>
<script src="${ctx}/js/bootstrap.min.js"></script> 
<script src="${ctx}/js/jquery.flot.min.js"></script> 
<script src="${ctx}/js/jquery.flot.pie.min.js"></script> 
<script src="${ctx}/js/charts.js"></script> 
<script src="${ctx}/js/jquery.flot.resize.min.js"></script> 
<script src="${ctx}/js/matrix.js"></script> 
<script src="${ctx}/js/jquery.peity.min.js"></script> 
<script src="${ctx}/js/bootstrap-datepicker.js" type="text/javascript" charset="utf-8"></script>

<!--Turning-series-chart-js-->
<script type="text/javascript">
$(function () {
    var datasets = {
        "新闻": {
            label: "新闻",
            data: [[1988, 483994], [1989, 479060], [1990, 457648], [1991, 401949], [1992, 424705], [1993, 402375], [1994, 377867], [1995, 357382], [1996, 337946], [1997, 336185], [1998, 328611], [1999, 329421], [2000, 342172], [2001, 344932], [2002, 387303], [2003, 440813], [2004, 480451], [2005, 504638], [2006, 528692]]
        },        
        "论坛": {
            label: "论坛",
            data: [[1988, 218000], [1989, 203000], [1990, 171000], [1992, 42500], [1993, 37600], [1994, 36600], [1995, 21700], [1996, 19200], [1997, 21300], [1998, 13600], [1999, 14000], [2000, 19100], [2001, 21300], [2002, 23600], [2003, 25100], [2004, 26100], [2005, 31100], [2006, 34700]]
        },
        "博客": {
            label: "博客",
            data: [[1988, 62982], [1989, 62027], [1990, 60696], [1991, 62348], [1992, 58560], [1993, 56393], [1994, 54579], [1995, 50818], [1996, 50554], [1997, 48276], [1998, 47691], [1999, 47529], [2000, 47778], [2001, 48760], [2002, 50949], [2003, 57452], [2004, 60234], [2005, 60076], [2006, 59213]]
        },
        "微博": {
            label: "微博",
            data: [[1988, 55627], [1989, 55475], [1990, 58464], [1991, 55134], [1992, 52436], [1993, 47139], [1994, 43962], [1995, 43238], [1996, 42395], [1997, 40854], [1998, 40993], [1999, 41822], [2000, 41147], [2001, 40474], [2002, 40604], [2003, 40044], [2004, 38816], [2005, 38060], [2006, 36984]]
        },
        "微信": {
            label: "微信",
            data: [[1988, 3813], [1989, 3719], [1990, 3722], [1991, 3789], [1992, 3720], [1993, 3730], [1994, 3636], [1995, 3598], [1996, 3610], [1997, 3655], [1998, 3695], [1999, 3673], [2000, 3553], [2001, 3774], [2002, 3728], [2003, 3618], [2004, 3638], [2005, 3467], [2006, 3770]]
        },
        
    };

    // hard-code color indices to prevent them from shifting as
    // countries are turned on/off
    var i = 0;
    $.each(datasets, function(key, val) {
        val.color = i;
        ++i;
    });
    
    // insert checkboxes 
    var choiceContainer = $("#choices");
    $.each(datasets, function(key, val) {
        choiceContainer.append('<br/><input type="checkbox" name="' + key +
                               '" checked="checked" id="id' + key + '">' +
                               '<label for="id' + key + '">'
                                + val.label + '</label>');
    });
    choiceContainer.find("input").click(plotAccordingToChoices);

    
    function plotAccordingToChoices() {
        var data = [];

        choiceContainer.find("input:checked").each(function () {
            var key = $(this).attr("name");
            if (key && datasets[key])
                data.push(datasets[key]);
        });

        if (data.length > 0)
            $.plot($("#placeholder"), data, {
                yaxis: { min: 0 },
                xaxis: { tickDecimals: 0 }
            });
    }

    plotAccordingToChoices();
});
</script> 
<!--Turning-series-chart-js-->

<script type="text/javascript">

window.onload=function(){
    var shijian=document.getElementById('custom');
    var jieshu=document.getElementsByClassName('jieshu')[0];
    var kaishi=document.getElementsByClassName('kaishi')[0];
    var dangtian=document.getElementById('timeType1');
    var yizhou=document.getElementById('timeType2');
    shijian.onclick=function(){
            if(jieshu.style.display=='inline-block'){ 
                    jieshu.style.display='none'; 
                    kaishi.style.display='none';
                }
                else{
                    jieshu.style.display='inline-block';
                    kaishi.style.display='inline-block';
                }
        };
    
    dangtian.onclick=function(){
    	jieshu.style.display='none'; 
        kaishi.style.display='none';
        jieshu.value="";
    	kaishi.value="";
    };
    yizhou.onclick=function(){
    	jieshu.style.display='none'; 
        kaishi.style.display='none';
        jieshu.value="";
    	kaishi.value="";
    };
};



</script>
<script type="text/javascript">
	 $(function() {
    $( "#from" ).datepicker({
      defaultDate: "+1w",
      changeMonth: true,
      numberOfMonths: 1,
      onClose: function( selectedDate ) {
        $( "#to" ).datepicker( "option", "minDate", selectedDate );
      }
    });
    $( "#to" ).datepicker({
      defaultDate: "+1w",
      changeMonth: true,
      numberOfMonths: 1,
      onClose: function( selectedDate ) {
        $( "#from" ).datepicker( "option", "maxDate", selectedDate );
      }
    });
  });
</script>
</body>
</html>


