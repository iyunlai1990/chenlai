/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.web;

import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.entity.*;
import com.thinkgem.jeesite.modules.cms.service.*;
import com.thinkgem.jeesite.modules.cms.utils.CmsUtils;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.servlet.ValidateCodeServlet;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.entity.*;
import com.thinkgem.jeesite.modules.cms.service.*;
import com.thinkgem.jeesite.modules.cms.utils.CmsUtils;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 网站Controller
 * @author ThinkGem
 * @version 2013-5-29
 */
@Controller
@RequestMapping(value = "${taleFront}")
public class FrontWebController extends BaseController {
	
	@Autowired
	private ArticleService articleService;
	@Autowired
	private ArticleDataService articleDataService;
	@Autowired
	private LinkService linkService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private SiteService siteService;

	/**
	 * 网站首页
	 */
	@RequestMapping
	public String index(Article article, HttpServletRequest request, HttpServletResponse response, Model model) {
		/*Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		model.addAttribute("isIndex", true);*/
		/*Page<Article> articlePage = articleService.findPage(new Page<Article>(request, response), article, true);
		model.addAttribute("articlePage", articlePage);*/
		article.setCategory(new Category());
        List<Article> articleList = articleService.findListGroupByCategory(article);
        model.addAttribute("articleList", articleList);
		return "frontweb/index";
	}

	/**
	 * 内容列表
	 */
	@RequestMapping(value = "list-{categoryId}${urlSuffix}")
	public String list(@PathVariable String categoryId, @RequestParam(required=false, defaultValue="1") Integer pageNo,
			@RequestParam(required=false, defaultValue="15") Integer pageSize, Model model) {
		Category category = categoryService.get(categoryId);
		if (category==null){
			Site site = CmsUtils.getSite(Site.defaultSiteId());
			model.addAttribute("site", site);
			return "error/404";
		}
		Site site = siteService.get(category.getSite().getId());
		model.addAttribute("site", site);
		// 2：简介类栏目，栏目第一条内容
		if("2".equals(category.getShowModes()) && "article".equals(category.getModule())){
			// 如果没有子栏目，并父节点为跟节点的，栏目列表为当前栏目。
			List<Category> categoryList = Lists.newArrayList();
			if (category.getParent().getId().equals("1")){
				categoryList.add(category);
			}else{
				categoryList = categoryService.findByParentId(category.getParent().getId(), category.getSite().getId());
			}
			model.addAttribute("category", category);
			model.addAttribute("categoryList", categoryList);
			// 获取文章内容
			Page<Article> page = new Page<Article>(1, 1, -1);
			Article article = new Article(category);
			page = articleService.findPage(page, article, false);
			if (page.getList().size()>0){
				article = page.getList().get(0);
				article.setArticleData(articleDataService.get(article.getId()));
				articleService.updateHitsAddOne(article.getId());
			}
			model.addAttribute("article", article);
            CmsUtils.addViewConfigAttribute(model, category);
            CmsUtils.addViewConfigAttribute(model, article.getViewConfig());
			return "modules/cms/front/themes/"+site.getTheme()+"/"+getTpl(article);
		}else{
			List<Category> categoryList = categoryService.findByParentId(category.getId(), category.getSite().getId());
			// 展现方式为1 、无子栏目或公共模型，显示栏目内容列表
			if("1".equals(category.getShowModes())||categoryList.size()==0){
				// 有子栏目并展现方式为1，则获取第一个子栏目；无子栏目，则获取同级分类列表。
				if(categoryList.size()>0){
					category = categoryList.get(0);
				}else{
					// 如果没有子栏目，并父节点为跟节点的，栏目列表为当前栏目。
					if (category.getParent().getId().equals("1")){
						categoryList.add(category);
					}else{
						categoryList = categoryService.findByParentId(category.getParent().getId(), category.getSite().getId());
					}
				}
				model.addAttribute("category", category);
				model.addAttribute("categoryList", categoryList);
				// 获取内容列表
				if ("article".equals(category.getModule())){
					Page<Article> page = new Page<Article>(pageNo, pageSize);
					//System.out.println(page.getPageNo());
					page = articleService.findPage(page, new Article(category), false);
					model.addAttribute("page", page);
					// 如果第一个子栏目为简介类栏目，则获取该栏目第一篇文章
					if ("2".equals(category.getShowModes())){
						Article article = new Article(category);
						if (page.getList().size()>0){
							article = page.getList().get(0);
							article.setArticleData(articleDataService.get(article.getId()));
							articleService.updateHitsAddOne(article.getId());
						}
						model.addAttribute("article", article);
			            CmsUtils.addViewConfigAttribute(model, category);
			            CmsUtils.addViewConfigAttribute(model, article.getViewConfig());
						return "modules/cms/front/themes/"+site.getTheme()+"/"+getTpl(article);
					}
				}else if ("link".equals(category.getModule())){
					Page<Link> page = new Page<Link>(1, -1);
					page = linkService.findPage(page, new Link(category), false);
					model.addAttribute("page", page);
				}
				String view = "/frontList";
				if (StringUtils.isNotBlank(category.getCustomListView())){
					view = "/"+category.getCustomListView();
				}
	            CmsUtils.addViewConfigAttribute(model, category);
                site =siteService.get(category.getSite().getId());
                //System.out.println("else 栏目第一条内容 _2 :"+category.getSite().getTheme()+","+site.getTheme());
				return "modules/cms/front/themes/"+siteService.get(category.getSite().getId()).getTheme()+view;
				//return "modules/cms/front/themes/"+category.getSite().getTheme()+view;
			}
			// 有子栏目：显示子栏目列表
			else{
				model.addAttribute("category", category);
				model.addAttribute("categoryList", categoryList);
				String view = "/frontListCategory";
				if (StringUtils.isNotBlank(category.getCustomListView())){
					view = "/"+category.getCustomListView();
				}
	            CmsUtils.addViewConfigAttribute(model, category);
				return "modules/cms/front/themes/"+site.getTheme()+view;
			}
		}
	}

	/**
	 * 内容列表（通过url自定义视图）
	 */
	@RequestMapping(value = "listc-{categoryId}-{customView}${urlSuffix}")
	public String listCustom(@PathVariable String categoryId, @PathVariable String customView, @RequestParam(required=false, defaultValue="1") Integer pageNo,
			@RequestParam(required=false, defaultValue="15") Integer pageSize, Model model) {
		Category category = categoryService.get(categoryId);
		if (category==null){
			Site site = CmsUtils.getSite(Site.defaultSiteId());
			model.addAttribute("site", site);
			return "error/404";
		}
		Site site = siteService.get(category.getSite().getId());
		model.addAttribute("site", site);
		List<Category> categoryList = categoryService.findByParentId(category.getId(), category.getSite().getId());
		model.addAttribute("category", category);
		model.addAttribute("categoryList", categoryList);
        CmsUtils.addViewConfigAttribute(model, category);
		return "modules/cms/front/themes/"+site.getTheme()+"/frontListCategory"+customView;
	}

	/**
	 * 显示内容
	 */
	@RequestMapping(value = "view-{categoryId}-{contentId}${urlSuffix}")
	public String view(@PathVariable String categoryId, @PathVariable String contentId, Model model) {
		Category category = categoryService.get(categoryId);
		if (category==null){
			Site site = CmsUtils.getSite(Site.defaultSiteId());
			model.addAttribute("site", site);
			return "error/404";
		}
		model.addAttribute("site", category.getSite());
		if ("article".equals(category.getModule())){
			// 如果没有子栏目，并父节点为跟节点的，栏目列表为当前栏目。
			List<Category> categoryList = Lists.newArrayList();
			if (category.getParent().getId().equals("1")){
				categoryList.add(category);
			}else{
				categoryList = categoryService.findByParentId(category.getParent().getId(), category.getSite().getId());
			}
			// 获取文章内容
			Article article = articleService.get(contentId);
			if (article==null || !Article.DEL_FLAG_NORMAL.equals(article.getDelFlag())){
				return "error/404";
			}
			// 文章阅读次数+1
			articleService.updateHitsAddOne(contentId);
			// 获取推荐文章列表
			List<Object[]> relationList = articleService.findByIds(articleDataService.get(article.getId()).getRelation());
			// 将数据传递到视图
			model.addAttribute("category", categoryService.get(article.getCategory().getId()));
			model.addAttribute("categoryList", categoryList);
			article.setArticleData(articleDataService.get(article.getId()));
			model.addAttribute("article", article);
			model.addAttribute("relationList", relationList); 
            CmsUtils.addViewConfigAttribute(model, article.getCategory());
            CmsUtils.addViewConfigAttribute(model, article.getViewConfig());
            Site site = siteService.get(category.getSite().getId());
            model.addAttribute("site", site);
            /*Comment comment = new Comment();
            comment.setContentId(article.getId()+"");
			Page<Comment> commentPage = commentService.findPage(new Page<Comment>(), comment);
			model.addAttribute("commentPage", commentPage);*/

//			return "modules/cms/front/themes/"+category.getSite().getTheme()+"/"+getTpl(article);
            //return "modules/cms/front/themes/"+site.getTheme()+"/"+getTpl(article);
			return "frontweb/articleDetails";
		}
		return "error/404";
	}
	
	/**
	 * 内容评论
	 */
	@RequestMapping(value = "comment", method=RequestMethod.GET)
	public String comment(String theme, Comment comment, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Comment> page = new Page<Comment>(request, response);
		Comment c = new Comment();
		c.setCategory(comment.getCategory());
		c.setContentId(comment.getContentId());
		c.setDelFlag(Comment.DEL_FLAG_NORMAL);
		page = commentService.findPage(page, c);
		model.addAttribute("page", page);
		model.addAttribute("comment", comment);
		return "modules/cms/front/themes/"+theme+"/frontComment";
	}

    /**
     * 内容评论
     */
    @RequestMapping(value = "commentJson")
    @ResponseBody
    public Map commentJson(int pageNo ,int pageSize,String articleId) {
        Comment comment = new Comment();
        comment.setContentId(articleId);
        Page<Comment> commentPage = commentService.findPage(new Page<Comment>(pageNo,pageSize),comment);
        Map map = new HashMap<String,Object>();
        List<Comment> commentList = commentPage.getList();
        map.put("list",commentList);
        map.put("pageNo",commentPage.getPageNo());
		map.put("pageSize",commentPage.getPageSize());
        map.put("count",commentPage.getCount());
		map.put("first",commentPage.getFirst());
		map.put("last",commentPage.getLast());
		map.put("prev",commentPage.getPrev());
		map.put("next",commentPage.getNext());
		map.put("firstPage",commentPage.isFirstPage());
		map.put("lastPage",commentPage.isLastPage());
        return map;
    }

	/**
	 * 内容评论保存
	 */
	@RequestMapping(value = "comment", method=RequestMethod.POST)
    @ResponseBody
	public String commentSave(Comment comment, String validateCode,@RequestParam(required=false) String replyId, HttpServletRequest request) {
        if (StringUtils.isNotBlank(replyId)){
            Comment replyComment = commentService.get(replyId);
            if (replyComment != null){
                comment.setContent("<div class=\"reply\">"+replyComment.getName()+":<br/>"
                        +replyComment.getContent()+"</div>"+comment.getContent());
            }
        }
        comment.setIp(request.getRemoteAddr());
        comment.setCreateDate(new Date());
        comment.setDelFlag(Comment.DEL_FLAG_AUDIT);//不用审核直接正常
        commentService.save(comment);
        return "{success:success}";

	}


    private String getTpl(Article article){
        if(StringUtils.isBlank(article.getCustomContentView())){
            String view = null;
            Category c = article.getCategory();
            boolean goon = true;
            do{
                if(StringUtils.isNotBlank(c.getCustomContentView())){
                    view = c.getCustomContentView();
                    goon = false;
                }else if(c.getParent() == null || c.getParent().isRoot()){
                    goon = false;
                }else{
                    c = c.getParent();
                }
            }while(goon);
            return StringUtils.isBlank(view) ? Article.DEFAULT_TEMPLATE : view;
        }else{
            return article.getCustomContentView();
        }
    }


	/**
	 * 跳转到搜索页面
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"jumpArticleSearch"})
	public String jumpArticleSearch(Article article ,HttpServletRequest request, HttpServletResponse response, Model model) {

		Category category = new Category();
		article.setCategory(category);
		Page<Article> articlePage = articleService.findPage(new Page<Article>(request,response),article);
		model.addAttribute("article",article);
		model.addAttribute("articlePage",articlePage);
		return "frontweb/articleSearch";
	}



    /**
     * 文章类型列表
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = {"jumpArticleCategory"})
    public String jumpArticleCategory(Category category ,HttpServletRequest request, HttpServletResponse response, Model model) {
        String categoryId = category.getId();
        Article article = new Article();

        category = categoryService.findById(category.getId());
        category.setParentIds(categoryId);
        article.setCategory(category);
        Page<Article> articlePage = articleService.findPage(new Page<Article>(request,response),article);
        model.addAttribute("article",article);
        model.addAttribute("category",category);
        model.addAttribute("articlePage",articlePage);
        return "frontweb/articleCategory";
    }


    /**
     * 跳转到归类
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = {"jumpArticleCategoryList"})
    public String jumpArticleCategoryList(HttpServletRequest request, HttpServletResponse response, Model model) {
        Category category =  new Category() ;
        category.setSite(new Site("1")); //默认站点``
		category.setParent(new Category("l"));//父节点为顶级栏目
        //Page<Category> categoryPage = categoryService.find(new Page<Category>(request,response),category);
		Page<Category> categoryPage = categoryService.findPage(new Page<Category>(request,response),category);
        model.addAttribute("categoryList",categoryPage.getList());
        return "frontweb/articleCategoryList";
    }



    /**
     * 跳转到关于
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = {"jumpArticleAbout"})
    public String jumpArticleAbout(HttpServletRequest request, HttpServletResponse response, Model model) {
        Category category = categoryService.get("67bafbc23b14479b91c93be1a2446d10");
        if (category == null) {
            Site site = CmsUtils.getSite(Site.defaultSiteId());
            model.addAttribute("site", site);
            return "error/404";
        }
        model.addAttribute("site", category.getSite());
        if ("article".equals(category.getModule())) {
            // 如果没有子栏目，并父节点为跟节点的，栏目列表为当前栏目。
            List<Category> categoryList = Lists.newArrayList();
            if (category.getParent().getId().equals("1")) {
                categoryList.add(category);
            } else {
                categoryList = categoryService.findByParentId(category.getParent().getId(), category.getSite().getId());
            }
            // 获取文章内容
			Article article = articleService.get(DictUtils.getDictValue("关于我","specialLink",""));
            if (article == null || !Article.DEL_FLAG_NORMAL.equals(article.getDelFlag())) {
                return "error/404";
            }
            // 文章阅读次数+1
            articleService.updateHitsAddOne("98a778fb661c44279347c5002493e53f");
            // 获取推荐文章列表
            List<Object[]> relationList = articleService.findByIds(articleDataService.get(article.getId()).getRelation());
            // 将数据传递到视图
            model.addAttribute("category", categoryService.get(article.getCategory().getId()));
            model.addAttribute("categoryList", categoryList);
            article.setArticleData(articleDataService.get(article.getId()));
            model.addAttribute("article", article);
            model.addAttribute("relationList", relationList);
            CmsUtils.addViewConfigAttribute(model, article.getCategory());
            CmsUtils.addViewConfigAttribute(model, article.getViewConfig());
            Site site = siteService.get(category.getSite().getId());
            model.addAttribute("site", site);
            /*Comment comment = new Comment();
            comment.setContentId(article.getId()+"");
			Page<Comment> commentPage = commentService.findPage(new Page<Comment>(), comment);
			model.addAttribute("commentPage", commentPage);*/

//			return "modules/cms/front/themes/"+category.getSite().getTheme()+"/"+getTpl(article);
            //return "modules/cms/front/themes/"+site.getTheme()+"/"+getTpl(article);
            return "frontweb/articleAbout";
        }
        return "error/404";
    }


    /**
     * 跳转到有连接
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = {"jumpArticleFrientLink"})
    public String jumpArticleFrientLink(HttpServletRequest request, HttpServletResponse response, Model model) {
        Category category = categoryService.get("67bafbc23b14479b91c93be1a2446d10");
        if (category == null) {
            Site site = CmsUtils.getSite(Site.defaultSiteId());
            model.addAttribute("site", site);
            return "error/404";
        }
        model.addAttribute("site", category.getSite());
        if ("article".equals(category.getModule())) {
            // 如果没有子栏目，并父节点为跟节点的，栏目列表为当前栏目。
            List<Category> categoryList = Lists.newArrayList();
            if (category.getParent().getId().equals("1")) {
                categoryList.add(category);
            } else {
                categoryList = categoryService.findByParentId(category.getParent().getId(), category.getSite().getId());
            }
            // 获取文章内容
            Article article = articleService.get(DictUtils.getDictValue("友情连接","specialLink",""));
            if (article == null || !Article.DEL_FLAG_NORMAL.equals(article.getDelFlag())) {
                return "error/404";
            }
            // 文章阅读次数+1
            articleService.updateHitsAddOne("5a3f252ff72e44baa26f4b6936a357cb");
            // 获取推荐文章列表
            List<Object[]> relationList = articleService.findByIds(articleDataService.get(article.getId()).getRelation());
            // 将数据传递到视图
            model.addAttribute("category", categoryService.get(article.getCategory().getId()));
            model.addAttribute("categoryList", categoryList);
            article.setArticleData(articleDataService.get(article.getId()));
            model.addAttribute("article", article);
            model.addAttribute("relationList", relationList);
            CmsUtils.addViewConfigAttribute(model, article.getCategory());
            CmsUtils.addViewConfigAttribute(model, article.getViewConfig());
            Site site = siteService.get(category.getSite().getId());
            model.addAttribute("site", site);
            /*Comment comment = new Comment();
            comment.setContentId(article.getId()+"");
			Page<Comment> commentPage = commentService.findPage(new Page<Comment>(), comment);
			model.addAttribute("commentPage", commentPage);*/

//			return "modules/cms/front/themes/"+category.getSite().getTheme()+"/"+getTpl(article);
            //return "modules/cms/front/themes/"+site.getTheme()+"/"+getTpl(article);
            return "frontweb/articleLink";
        }
        return "error/404";
    }


	/**
	 * 只显示内容
	 */
	@RequestMapping(value = "viewbody-{categoryId}-{contentId}${urlSuffix}")
	public String viewbody(@PathVariable String categoryId, @PathVariable String contentId, Model model) {
		Category category = categoryService.get(categoryId);
		if (category==null){
			Site site = CmsUtils.getSite(Site.defaultSiteId());
			model.addAttribute("site", site);
			return "error/404";
		}
		model.addAttribute("site", category.getSite());
		if ("article".equals(category.getModule())){
			// 如果没有子栏目，并父节点为跟节点的，栏目列表为当前栏目。
			List<Category> categoryList = Lists.newArrayList();
			if (category.getParent().getId().equals("1")){
				categoryList.add(category);
			}else{
				categoryList = categoryService.findByParentId(category.getParent().getId(), category.getSite().getId());
			}
			// 获取文章内容
			Article article = articleService.get(contentId);
			if (article==null || !Article.DEL_FLAG_NORMAL.equals(article.getDelFlag())){
				return "error/404";
			}
			// 文章阅读次数+1
			articleService.updateHitsAddOne(contentId);
			article.setArticleData(articleDataService.get(article.getId()));
			model.addAttribute("article", article);
			return "frontweb/articleBody";
		}
		return "error/404";
	}



	/**
	 * 跳转到日期分类
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"articleCategoryByDate"})
	public String articleCategoryByDate(String style ,HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("style", style);
		switch (Integer.valueOf(style)){
			case 1 :
				model.addAttribute("title", "年度文章总数");
				return "frontweb/articleCategoryByDate";
			case 2 :
				model.addAttribute("title", "月度文章总数");
				return "frontweb/articleCategoryByDate";
			case 3 :
				model.addAttribute("title", "天度文章总数");
				return "frontweb/articleCategoryByDate";
			case 4 :
				model.addAttribute("title", "周文章总数");
				return "frontweb/articleCategoryByDate";
			default:
				model.addAttribute("title", "年度文章总数");
				return "frontweb/articleCategoryByDate";
		}
	}

	/**
	 * 跳转到更多
	 * @return
	 */
	@RequestMapping(value = {"more"})
	public String more(HttpServletRequest request, HttpServletResponse response, Model model) {
		return "frontweb/more";
	}


	/**
	 * 根据时间列表查询文章总数
	 */
	@RequestMapping(value = {"articleListByDate"})
	public String articleListByDate(String createDate ,HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("createDate", createDate);
		Article article = new Article();
		article.setCreateDate(new Date(createDate));
		Page<Article> page = articleService.findPage(new Page<Article>(request, response), article, true);
		model.addAttribute("page", page);
		return "frontweb/articleDateList";
	}




}
