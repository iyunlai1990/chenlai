/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.cms.entity.CmsArticleDataGuide;

/**
 * 文章内容引用模块DAO接口
 * @author zyl
 * @version 2018-01-02
 */
@MyBatisDao
public interface CmsArticleDataGuideDao extends CrudDao<CmsArticleDataGuide> {
	
}