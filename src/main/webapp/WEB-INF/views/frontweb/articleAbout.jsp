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
</head>
<body class='bg-grey' gtools_scp_screen_capture_injected='true'>
<!--[if lt IE 8]>
<div class='browsehappy' role='dialog'>
    当前网页 <strong>不支持</strong> 你正在使用的浏览器. 为了正常的访问, 请 <a href='http://browsehappy.com/' target='_blank'>升级你的浏览器</a>。
</div>
<![endif]-->
<header id='header' class='header bg-white'>
    <%@ include file='/WEB-INF/views/frontweb/layouts/header.jsp' %>
</header>
<article class='main-content page-page' itemscope itemtype='http://schema.org/Article'>
    <div class='post-header'>
        <h1 class='post-title' itemprop='name headline'>
            <a href='${pageContext.request.contextPath}/front/view-${article.category.id}-${article.id}${fns:getUrlSuffix()}'>${article.title}</a>
        </h1>
        <div class='post-data'>
            <time datetime='2017-02-25' itemprop='datePublished'>发布于 <fmt:formatDate value="${article.createDate}" pattern="yyyy-MM-dd"/></time>
            / <a href='/category/%E9%BB%98%E8%AE%A4%E5%88%86%E7%B1%BB'>${article.category.name}</a> / <a id="commentList" href='#comments'>  ${commentPage.list.size()}条评论</a> /
            ${article.hits}浏览
        </div>
    </div>
    <div id='post-content' class='post-content' itemprop='articleBody'>
        <p class='post-tags'></p>
        <p></p>
        ${article.articleData.content}
    </div>
</article>
<div id='post-bottom-bar' class='post-bottom-bar'>
    <div class='bottom-bar-inner'>
        <div class='bottom-bar-items social-share left'>
            <span class='bottom-bar-item'>Share : </span>
            <span class='bottom-bar-item bottom-bar-facebook'><a href='https://www.facebook.com/sharer/sharer.php?u=https://tale.biezhi.me/article/15' target='_blank' title='最近听的歌' rel='nofollow'>facebook</a></span>
            <span class='bottom-bar-item bottom-bar-twitter'><a href='https://twitter.com/intent/tweet?url=https://tale.biezhi.me/article/15&text=最近听的歌' target='_blank' title='最近听的歌' rel='nofollow'>Twitter</a></span>
            <span class='bottom-bar-item bottom-bar-weibo'><a href='http://service.weibo.com/share/share.php?url=https://tale.biezhi.me/article/15&amp;title=最近听的歌' target='_blank' title='最近听的歌' rel='nofollow'>Weibo</a></span>
            <span class='bottom-bar-item bottom-bar-qrcode'><a href='//pan.baidu.com/share/qrcode?w=300&amp;h=300&amp;url=https://tale.biezhi.me/article/15' target='_blank' rel='nofollow'>QRcode</a></span>
        </div>
        <div class='bottom-bar-items right'>
            <span class='bottom-bar-item'><a href='https://tale.biezhi.me/article/14' title='步步向上的一年'>→</a></span>
            <span class='bottom-bar-item'></span>
            <span class='bottom-bar-item'><a href='#footer'>↓</a></span>
            <span class='bottom-bar-item'><a href='#'>↑</a></span>
        </div>
    </div>
</div>
<div id='15' class='comment-container'>
    <div id='comments' class='clearfix'>
        <span class='response'></span>

        <form method='post' id='comment-form' class='comment-form' role='form' onsubmit='return TaleComment.subComment();'>
            <input type='hidden' name='category.id' id='category.id' value='${article.category.id}'/>
            <input type='hidden' name='contentId' id='contentId' value='${article.id}'/>
            <input type='hidden' name='title' value='${article.title}'/>
            <input name='name' maxlength='12' id='name' class='form-control input-control clearfix'
                   placeholder='姓名 (*)' value='' required/>
            <input type='email' name='mail' id='mail' class='form-control input-control clearfix' placeholder='邮箱 (*)'
                   value='' required/>
            <input type='url' name='url' id='url' class='form-control input-control clearfix' placeholder='网址 (http://)'
                   value=''/>
            <textarea name='content' id='textarea' class='form-control' placeholder='基佬，留下你的评论.' required minlength='5' maxlength='2000'></textarea>
            <button class='submit' id='misubmit'>提交</button>
        </form>


        <ol class='comment-list'>

        </ol>


        <div class="lists-navigator clearfix">
            <ol class="page-navigator">
            </ol>

        </div>


    </div>
</div>
<script type='text/javascript'>
    (function () {
        window.TaleComment = {
            reply: function (coid) {
                $('#comment-form input[name=coid]').val(coid);
                $('html,body').animate({scrollTop: $('div.comment-container').offset().top}, 500);
                $('#comment-form #textarea').focus();
            },
            subComment: function () {
                $.ajax({
                    type: 'post',
                    url: '/front/comment',
                    data: $('#comment-form').serialize(),
                    async: false,
                    success: function (result) {
                        $('#comment-form #textarea').val("");
                        initCommentList(1);
                    },
                    error : function(XMLHttpRequest, textStatus, errorThrown) {
                        //这个error函数调试时非常有用，如果解析不正确，将会弹出错误框
                        //alert(XMLHttpRequest.responseText);
                        //alert(XMLHttpRequest.status);
                       // alert(XMLHttpRequest.readyState);
                        //alert(textStatus); // parser error;
                        $('#comment-form #textarea').val("");
                        initCommentList(1);
                    }
                });
                return false;
            }
        };
    })();

    function getCommentCookie(name) {
        var arr, reg = new RegExp('(^| )' + name + '=([^;]*)(;|$)');
        if (arr = document.cookie.match(reg))
            return unescape(decodeURI(arr[2]));
        else
            return null;
    }

    function addCommentInputValue() {
        document.getElementById('name').value = getCommentCookie('tale_remember_author');
        document.getElementById('mail').value = getCommentCookie('tale_remember_mail');
        document.getElementById('url').value = getCommentCookie('tale_remember_url');
    }

    addCommentInputValue();


    initCommentList(1);
    function initCommentList(pageNo){
        $.ajax({
            type: 'post',
            url: "/front/commentJson?pageNo="+pageNo+"&&pageSize=10&&articleId=${article.id}",
            async: false,
            dataType: 'json',
            success: function (data) {
                var itemList = "" ;
                $.each(data.list, function(idx, obj) {
                    itemList = itemList + "<li id=\"li-comment-"+obj.id+"\" class=\"comment-body comment-parent comment-odd\">";
                    itemList = itemList +"<div id=\"comment-52\">";
                    itemList = itemList + "    <div class=\"comment-view\" onclick=\"\">";
                    itemList = itemList +"     <div class=\"comment-header\">";
                    itemList = itemList + "    <img class=\"avatar\" src=\"https://tale.biezhi.me/static/admin/images/unicorn.png?s=80&r=G&d=\" title=\""+obj.name+"\" width=\"80\" height=\"80\">";
                    itemList = itemList +  "  <span class=\"comment-author\">";
                    itemList = itemList +   "  <a href=\"\" target=\"_blank\" rel=\"external nofollow\">"+obj.name+"</a>";
                    itemList = itemList +    "</span>";
                    itemList = itemList + "   </div>";
                    itemList = itemList + "    <div class=\"comment-content\">";
                    itemList = itemList + "   <span class=\"comment-author-at\"></span>";
                    itemList = itemList + "   <p></p><p>"+obj.content+"</p>";
                    itemList = itemList + "   <p></p>";
                    itemList = itemList + "   </div>";
                    itemList = itemList + "    <div class=\"comment-meta\">";
                    itemList = itemList + "   <time class=\"comment-time\">"+obj.createDate+"</time>";
                    itemList = itemList + "   <span class=\"comment-reply\">";
                    itemList = itemList +  "  <a rel=\"nofollow\" onclick=\"TaleComment.reply('"+obj.id+"');\">回复</a>";
                    itemList = itemList +  "  </span>";
                    itemList = itemList +  "  </div>";
                    itemList = itemList +  "  </div>";
                    itemList = itemList +  "   </div>";
                    itemList = itemList +  "  </li>";
                    $('.comment-list').html(itemList);
                });
                //更新评论数
                $("#commentList").html(data.count +" 条评论");
                //重新初始化分页
                var pageHtml = "" ;
                if(data.last > 1){ //如果有两页以上就可以显示分布的信息，如果没有则不
                    if(data.pageNo == 1 ){//如果是第一页，则不显示上一页

                    }else{
                        pageHtml = pageHtml + " <li class=\"prev\"><a href=\"#comments\" onclick=\"initCommentList("+(data.pageNo-1)+")\">←</a></li> " ;
                    }

                    for (var i=data.first;i<=data.last;i++)
                    {
                        if(i == data.pageNo){
                            pageHtml = pageHtml + "<li class=\"current\"><a href=\"#comments\" onclick=\"initCommentList("+i+")\">"+i+"</a></li>" ;
                        }else{
                            pageHtml = pageHtml + "<li><a href=\"#comments\" onclick=\"initCommentList("+i+")\">"+i+"</a></li>" ;
                        }

                    }

                    if(data.pageNo == data.last){ // 如可是最后一页则不显示，下一页

                    }else{
                        pageHtml = pageHtml + "<li class=\"next\"><a href=\"#comments\" onclick=\"initCommentList("+(data.pageNo+1)+")\">→</a></li>";
                    }


                }

                $(".page-navigator").html(pageHtml);
            }
        });
    }
</script>

<div id="directory-content" class="directory-content">
    <div id="directory"><ul>
        <li><a href="#directory065311886742411461">1 一. 2014 总结</a><ul>
            <li><a href="#directory065311886742411462">1.1 技术</a></li>
            <li><a href="#directory065311886742411463">1.2 生活</a></li>
            <li><a href="#directory065311886742411464">1.3 二. 2015 展望</a></li>
        </ul></li>
    </ul></div>
</div>

<footer id='footer' class='footer bg-white'>
    <%@ include file='/WEB-INF/views/frontweb/layouts/footer.jsp' %>
</footer>


</body>
</html>