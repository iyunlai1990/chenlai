<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ page contentType='text/html;charset=UTF-8' %>
<%@ include file='/WEB-INF/views/include/taglib.jsp'%>
<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2017/12/27
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType='text/html;charset=UTF-8' language='java' %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/WEB-INF/views/frontweb/include/head.jsp" %>
    <script type="text/javascript">
        $(function(){

            var data = [];
            var url = "/front/articleApi/getCategoryByDate?style=${style}" ;
            $.ajax({
                url: url,
                type: 'get',
                dataType: 'json',
                success: function (data, status) {
                    console.log(data);
                    $.each(data,function(n,item){
                       initData(item);
                    });
                    initChart();
                },
                fail: function (err, status) {
                    initChart();
                }
            });
            function bg3(){
                var r=Math.floor(Math.random()*256);
                var g=Math.floor(Math.random()*256);
                var b=Math.floor(Math.random()*256);
                return "rgb("+r+','+g+','+b+")";//所有方法的拼接都可以用ES6新特性`其他字符串{$变量名}`替换
            }
            var opacity = 0.8;
            function initData(jsonData) {
                var item = new Object();
                item.name=jsonData.value;
                item.value=jsonData.COUNT;
                item.color = bg3();
                data.push(item) ;
            }

            function initChart() {
                new iChart.Column3D({
                    render : 'canvasDiv',
                    data: data,
                    title : '${title}',
                    width : 800,
                    height : 400,
                    align:'left',
                    offsetx:50,
                    legend : {
                        enable : true
                    },
                    sub_option:{
                        label:{
                            color:'#111111'
                        },
                        listeners:{
                            /**
                             * r:iChart.Rectangle2D对象
                             * e:eventObject对象
                             * m:额外参数
                             */
                            click:function(r,e,m){
                                alert(r.get('name')+' '+r.get('value'));
                            }
                        }
                    },
                    coordinate:{
                        width:600,
                        scale:[{
                            position:'left',
                            scale_space:8,
                            listeners:{
                                parseText:function(t,x,y){
                                    //return {text:t+"%"}
                                }
                            }
                        }]
                    }
                }).draw();
            }


        });
    </script>
</head>
<body class='bg-grey' gtools_scp_screen_capture_injected='true'>

<div class="main-content common-page clearfix">
    <div id='canvasDiv'></div>
</div>



</body>
</html>
