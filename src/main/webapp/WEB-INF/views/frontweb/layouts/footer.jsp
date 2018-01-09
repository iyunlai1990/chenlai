<%@ page contentType="text/html;charset=UTF-8" %>
<meta charset="utf-8">
<div class="footer-social">
    <div class="footer-container clearfix">
        <div class="social-list">
            <a class="social weibo" target="blank" href="#">微博</a>

            <a class="social zhihu" target="blank"
               href="#">知乎</a>

            <a class="social rss" target="blank" href="#">RSS</a>

            <a class="social github" target="blank"
               href="#">Github</a>

            <a class="social twitter" target="blank" href="#">Twitter</a>
            <a target="blank" href="https://dev-cheats.com">开发者秘籍</a>
        </div>
    </div>
</div>
<div class="footer-meta">
    <div class="footer-container">
        <div class="meta-item meta-copyright">
            <div class="meta-copyright-info">
                <a href="/front" class="info-logo">
                    <img src="${ctxStatic}/tale/image/rose.png" alt="Vivi"/>

                </a>
                <div class="info-text">
                    <p>一生中最爱~~Vivi.</p>
                    <p>Powered by <a href="https://github.com/otale/tale" target="_blank" rel="nofollow">ChenLai</a>
                    </p>
                    <p>&copy; 2017 <a href="https://github.com/biezhi">chenlai</a></p>
                </div>
            </div>
        </div>

        <div class="meta-item meta-posts">
            <h3 class="meta-title">最新文章</h3>
            <c:forEach items="${fnc:getArticleList(1,null , 8, null)}" var="article">
                <li>
                    <a href="${pageContext.request.contextPath}/front/view-${article.category.id}-${article.id}${fns:getUrlSuffix()}" target="_blank">${article.title}</a>
                </li>
            </c:forEach>

        </div>

        <div class="meta-item meta-comments">
            <h3 class="meta-title">最新评论</h3>
            <c:forEach items="${fnc:getCommentList(1,8)}" var="comment">
                <li>
                    <a href="${pageContext.request.contextPath}/front/view-${comment.category.id}-${comment.contentId}${fns:getUrlSuffix()}#li-comment-${comment.id}" target="_blank">${comment.content}</a>
                </li>
            </c:forEach>

        </div>
    </div>
</div>

<script type='text/javascript'>
    //换成cmsutils里面自带的方法
</script>