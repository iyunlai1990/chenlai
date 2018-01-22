/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.entity.CmsArticleDataGuide;
import com.thinkgem.jeesite.modules.cms.service.CmsArticleDataGuideService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.cms.entity.CmsArticleDataGuide;
import com.thinkgem.jeesite.modules.cms.service.CmsArticleDataGuideService;

/**
 * 文章内容引用模块Controller
 * @author zyl
 * @version 2018-01-02
 */
@Controller
@RequestMapping(value = "${adminPath}/cms/cmsArticleDataGuide")
public class CmsArticleDataGuideController extends BaseController {

	@Autowired
	private CmsArticleDataGuideService cmsArticleDataGuideService;
	
	@ModelAttribute
	public CmsArticleDataGuide get(@RequestParam(required=false) String id) {
		CmsArticleDataGuide entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = cmsArticleDataGuideService.get(id);
		}
		if (entity == null){
			entity = new CmsArticleDataGuide();
		}
		return entity;
	}
	
	@RequiresPermissions("cms:cmsArticleDataGuide:view")
	@RequestMapping(value = {"list", ""})
	public String list(CmsArticleDataGuide cmsArticleDataGuide, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CmsArticleDataGuide> page = cmsArticleDataGuideService.findPage(new Page<CmsArticleDataGuide>(request, response), cmsArticleDataGuide); 
		model.addAttribute("page", page);
		return "modules/cms/cmsArticleDataGuideList";
	}

	@RequiresPermissions("cms:cmsArticleDataGuide:view")
	@RequestMapping(value = "form")
	public String form(CmsArticleDataGuide cmsArticleDataGuide, Model model) {
		model.addAttribute("cmsArticleDataGuide", cmsArticleDataGuide);
		return "modules/cms/cmsArticleDataGuideForm";
	}

	@RequiresPermissions("cms:cmsArticleDataGuide:edit")
	@RequestMapping(value = "save")
	public String save(CmsArticleDataGuide cmsArticleDataGuide, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, cmsArticleDataGuide)){
			return form(cmsArticleDataGuide, model);
		}
		cmsArticleDataGuideService.save(cmsArticleDataGuide);
		addMessage(redirectAttributes, "保存文章内容引用模块成功");
		return "redirect:"+ Global.getAdminPath()+"/cms/cmsArticleDataGuide/?repage";
	}
	
	@RequiresPermissions("cms:cmsArticleDataGuide:edit")
	@RequestMapping(value = "delete")
	public String delete(CmsArticleDataGuide cmsArticleDataGuide, RedirectAttributes redirectAttributes) {
		cmsArticleDataGuideService.delete(cmsArticleDataGuide);
		addMessage(redirectAttributes, "删除文章内容引用模块成功");
		return "redirect:"+Global.getAdminPath()+"/cms/cmsArticleDataGuide/?repage";
	}

}