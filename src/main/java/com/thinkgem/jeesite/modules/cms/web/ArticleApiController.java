/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.web;

import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.entity.*;
import com.thinkgem.jeesite.modules.cms.service.*;
import com.thinkgem.jeesite.modules.cms.utils.CmsUtils;
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
@RequestMapping(value = "${taleFront}/articleApi")
public class ArticleApiController extends BaseController{
	
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
	 * 用户文章列表
	 */
	@RequestMapping(value = "getArticleList")
	@ResponseBody
	public Map getArticleList(int pageNo ,int pageSize) {
		Article article = new Article();
		Category category = new Category();
		article.setCategory(category);
		Page<Article> articlePage = articleService.findPage(new Page<Article>(pageNo,pageSize),article);
		Map map = new HashMap<String,Object>();
		List<Article> articleList = articlePage.getList();
		map.put("list",articleList);
		map.put("pageNo",articlePage.getPageNo());
		map.put("pageSize",articlePage.getPageSize());
		map.put("count",articlePage.getCount());
		map.put("first",articlePage.getFirst());
		map.put("last",articlePage.getLast());
		map.put("prev",articlePage.getPrev());
		map.put("next",articlePage.getNext());
		map.put("firstPage",articlePage.isFirstPage());
		map.put("lastPage",articlePage.isLastPage());

		return map ;
	}


    /**
     * 根据关键字得到用户文章列表
     */
    @RequestMapping(value = "getArticleListByKeyword")
    @ResponseBody
    public Map getArticleListByKeyword(int pageNo ,int pageSize , String keyword) {
        Article article = new Article();
        Category category = new Category();
        article.setTitle(keyword);
        article.setCategory(category);
        Page<Article> articlePage = articleService.findPage(new Page<Article>(pageNo,pageSize),article);
        Map map = new HashMap<String,Object>();
        List<Article> articleList = articlePage.getList();
        map.put("list",articleList);
        map.put("pageNo",articlePage.getPageNo());
        map.put("pageSize",articlePage.getPageSize());
        map.put("count",articlePage.getCount());
        map.put("first",articlePage.getFirst());
        map.put("last",articlePage.getLast());
        map.put("prev",articlePage.getPrev());
        map.put("next",articlePage.getNext());
        map.put("firstPage",articlePage.isFirstPage());
        map.put("lastPage",articlePage.isLastPage());
        return map ;
    }

	/**
	 * 得到最新评论列表
	 */
	@RequestMapping(value = "getCommentList")
	@ResponseBody
	public Map getCommentList(int pageNo ,int pageSize) {
		Comment comment = new Comment();
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

}
