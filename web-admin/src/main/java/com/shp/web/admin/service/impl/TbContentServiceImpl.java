package com.shp.web.admin.service.impl;

import com.shp.commons.dto.BaseResult;
import com.shp.commons.dto.PageInfo;
import com.shp.domain.TbContent;
import com.shp.domain.User;
import com.shp.web.admin.dao.TbContentDao;
import com.shp.web.admin.service.TbContentService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.shp.commons.constant.ConstantUtils.STATUS_SUCCESS;

@Service
@Transactional(readOnly = true)
public class TbContentServiceImpl implements TbContentService {
    @Autowired
    private TbContentDao tbContentDao;
    //获取全部
    @Override
    public List<TbContent> selectAll() {
        return tbContentDao.selectAll();
    }
    //通过id获取
    @Override
    public TbContent getById(Long id) {
        return tbContentDao.getById(id);
    }
    //插入
    @Override
    @Transactional(readOnly = false)
    public BaseResult save(TbContent tbContent) {
        //通过验证
        BaseResult baseResult = check(tbContent);
        if(baseResult.getStatus()==STATUS_SUCCESS){
            //新增信息
            if(tbContent.getId()==null){
                tbContentDao.insert(tbContent);
            }
            //编辑信息
            else {
                tbContentDao.update(tbContent);
            }
            baseResult.setMessage("编辑信息成功");
        }
        return baseResult;
    }
    //删除
    @Override
    @Transactional(readOnly = false)
    public void delete(Long id) {
        tbContentDao.delete(id);
    }
    //修改
 /*   @Override
    public void update(TbContent tbContent) {

    }*/
    //批量删除
    @Override
    public void deleteMulti(String[] idArray) {
        tbContentDao.deleteMulti(idArray);
    }
    //使用Datatable，并分页
    @Override
    public PageInfo<TbContent> dataTableSearch(int start, int length,int draw,TbContent tbContent) {
        int count=tbContentDao.dataTableCount(tbContent);
        Map<String,Object> params = new HashMap<>();
        params.put("start",start);
        params.put("length",length);
        params.put("tbContent",tbContent);

        PageInfo<TbContent> pageInfo = new PageInfo<>();
        pageInfo.setDraw(draw);
        pageInfo.setRecordsTotal(count);
        pageInfo.setRecordsFiltered(count);
        pageInfo.setData(tbContentDao.dataTableSearch(params));
        return pageInfo;
    }
    //查询总数
    @Override
    public int dataTableCount(TbContent tbContent) {
        return tbContentDao.dataTableCount(tbContent);
    }
    //有效性验证
    public BaseResult check(TbContent tbContent){
        BaseResult baseResult = BaseResult.success();
        //类目表非空验证
        if (tbContent.getCategoryId()==null){
            baseResult=BaseResult.fail("类目不能为空,请重新输入");
        }
        //主标题非空验证
        else if(StringUtils.isBlank(tbContent.getTitle())){
            baseResult=BaseResult.fail("主标题不能为空,请重新输入");
        }
        //小标题非空验证
        else if(StringUtils.isBlank(tbContent.getSubTitle())){
            baseResult=BaseResult.fail("小标题不能为空,请重新输入");
        }
        //标题描述非空验证
        else if(StringUtils.isBlank(tbContent.getTitleDesc())){
            baseResult=BaseResult.fail("描述不能为空,请重新输入");
        }
        return baseResult;
    }
}
