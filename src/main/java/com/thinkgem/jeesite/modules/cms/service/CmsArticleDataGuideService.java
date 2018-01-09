/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.cms.entity.CmsArticleDataGuide;
import com.thinkgem.jeesite.modules.cms.dao.CmsArticleDataGuideDao;

/**
 * 文章内容引用模块Service
 * @author zyl
 * @version 2018-01-02
 */
@Service
@Transactional(readOnly = true)
public class CmsArticleDataGuideService extends CrudService<CmsArticleDataGuideDao, CmsArticleDataGuide> {

	public CmsArticleDataGuide get(String id) {
		return super.get(id);
	}
	
	public List<CmsArticleDataGuide> findList(CmsArticleDataGuide cmsArticleDataGuide) {
		return super.findList(cmsArticleDataGuide);
	}
	
	public Page<CmsArticleDataGuide> findPage(Page<CmsArticleDataGuide> page, CmsArticleDataGuide cmsArticleDataGuide) {
		return super.findPage(page, cmsArticleDataGuide);
	}
	
	@Transactional(readOnly = false)
	public void save(CmsArticleDataGuide cmsArticleDataGuide) {
		super.save(cmsArticleDataGuide);
	}
	
	@Transactional(readOnly = false)
	public void delete(CmsArticleDataGuide cmsArticleDataGuide) {
		super.delete(cmsArticleDataGuide);
	}
	
}