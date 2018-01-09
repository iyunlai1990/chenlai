/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 文章内容引用模块Entity
 * @author zyl
 * @version 2018-01-02
 */
public class CmsArticleDataGuide extends DataEntity<CmsArticleDataGuide> {
	
	private static final long serialVersionUID = 1L;
	private CmsArticleDataGuide parent;		// 父级编号
	private String parentIds;		// 所有父级编号
	private String articleDataId;		// 文章内容id
	private String articledivtitle;		// 内容块标题
	private String articledivhref;		// 内容块引用
	
	public CmsArticleDataGuide() {
		super();
	}

	public CmsArticleDataGuide(String id){
		super(id);
	}

	@JsonBackReference
	public CmsArticleDataGuide getParent() {
		return parent;
	}

	public void setParent(CmsArticleDataGuide parent) {
		this.parent = parent;
	}
	
	@Length(min=1, max=2000, message="所有父级编号长度必须介于 1 和 2000 之间")
	public String getParentIds() {
		return parentIds;
	}

	public void setParentIds(String parentIds) {
		this.parentIds = parentIds;
	}
	
	@Length(min=1, max=100, message="文章内容id长度必须介于 1 和 100 之间")
	public String getArticleDataId() {
		return articleDataId;
	}

	public void setArticleDataId(String articleDataId) {
		this.articleDataId = articleDataId;
	}
	
	@Length(min=0, max=255, message="内容块id长度必须介于 0 和 255 之间")
	public String getArticledivtitle() {
		return articledivtitle;
	}

	public void setArticledivtitle(String articledivtitle) {
		this.articledivtitle = articledivtitle;
	}
	
	@Length(min=0, max=255, message="内容块引用长度必须介于 0 和 255 之间")
	public String getArticledivhref() {
		return articledivhref;
	}

	public void setArticledivhref(String articledivhref) {
		this.articledivhref = articledivhref;
	}
	
}