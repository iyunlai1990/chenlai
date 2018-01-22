<%@ page contentType="text/html;charset=UTF-8" %><meta charset="utf-8">
<div class="navbar-container">
    <a href="/front" class="navbar-logo">
        <img src="${ctxStatic}/tale/image/rose.png" alt="Vivi"/>
        Vivi
    </a>
    <div class="navbar-menu">
        <a href="/front/jumpArticleCategoryList">归档</a>
        <a href="/front/jumpArticleFrientLink">友链</a>
        <a href="/front/jumpArticleAbout">关于</a>
        <c:if test="${fns:getUser().name != null}">
            <a href="/a" target="_blank">${fns:getUser().name}</a>
        </c:if>
        <a href="javascript:void(0)" onclick="more()">更多</a>

    </div>
    <div class="navbar-search" onclick="">
        <span class="icon-search"></span>
        <form role="search" onsubmit="return false;">
                <span class="search-box">
                    <input type="text" id="search-inp" class="input" placeholder="搜索..." maxlength="30"
                           autocomplete="off">
                </span>
        </form>
    </div>
    <div class="navbar-mobile-menu" onclick="">
        <span class="icon-menu cross"><span class="middle"></span></span>
        <ul class="navbar-ul">
            <li><a href="/front/jumpArticleCategoryList">归档</a></li>
            <li><a href="/front/jumpArticleFrientLink">友链</a></li>
            <li><a href="/front/jumpArticleAbout" >关于</a></li>
        </ul>
    </div>
</div>

<script type="text/javascript">
    var header = new Headroom(document.getElementById("header"), {
        tolerance: 10,
        offset: 80,
        classes: {
            initial: "animated",
            pinned: "slideDown",
            unpinned: "slideUp"
        }
    });
    header.init();
    $('#search-inp').keypress(function (e) {
        var key = e.which; //e.which是按键的值
        if (key == 13) {
            var q = $(this).val();
            if (q && q != '') {
                window.location.href = '/front/jumpArticleSearch?title=' + q;
            }
        }
    });
</script>
<script data-no-instant>
    InstantClick.on('change', function (isInitialLoad) {
        var blocks = document.querySelectorAll('pre code');
        for (var i = 0; i < blocks.length; i++) {
            hljs.highlightBlock(blocks[i]);
        }
        if (isInitialLoad === false) {
            if (typeof ga !== 'undefined') ga('send', 'pageview', location.pathname + location.search);
        }
    });
    InstantClick.init('mousedown');
</script>

<script type="text/javascript">
    //页面一打开就执行，放入ready是为了layer所需配件（css、扩展模块）加载完毕
    layer.ready(function(){
       /* $('.navbar-menu a').mouseover(function(){
            $(this).addClass("hvr-bob");
        });
        $('.navbar-logo').mouseover(function(){
            $(this).addClass("hvr-bob");
        });*/

        //对导航栏当前状态进行判断
        var now_href = window.location.href ;
        $(".navbar-menu a").each(function(){
            if(now_href.indexOf($(this).attr("href"))>-1){
                $(this).addClass("current");
            }
            else{
                //alert(now_href.indexOf($(this).attr("href"))+"---"+$(this).attr("href"));
            }
        });
    });
    function more() {
        layer.open({
            type: 2,
            title: '更多选择',
            maxmin: true,
            area: ['800px', '500px'],
            content: 'http://layer.layui.com/test/welcome.html',
            end: function(){
                layer.tips('Hi', '#about', {tips: 1})
            }
        });
    }
</script>