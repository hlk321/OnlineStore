package com.oaec.b2c.service.impl;

import com.oaec.b2c.dao.BrandDao;
import com.oaec.b2c.dao.CategoryDao;
import com.oaec.b2c.dao.ProductDao;
import com.oaec.b2c.dao.impl.BrandDaoImpl;
import com.oaec.b2c.dao.impl.CategoryDaoImpl;
import com.oaec.b2c.dao.impl.ProductDaoImpl;
import com.oaec.b2c.service.ProductService;

import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements ProductService {

    private ProductDao productDao = new ProductDaoImpl();
    private BrandDao brandDao = new BrandDaoImpl();
    private CategoryDao categoryDao = new CategoryDaoImpl();

    @Override
    public List<Map<String, Object>> query(String name,String classId,String brandId,Integer page) {
        if(brandId != null){
            return productDao.queryByBrandId(Integer.parseInt(brandId));
        }
        if(classId != null){
            if((classId.equals("2000")) || (classId.equals("2001"))){
                return productDao.queryByFClassId(Integer.parseInt(classId));
            }else {
                return productDao.queryByClassId(Integer.parseInt(classId));
            }
        }


        if(name == null){
            return productDao.queryAll(page);
        }else{
            return productDao.queryLike(name);
        }

    }

    @Override
    public Map<String, Object> getProduct(String productId) {

        Map<String, Object> product = productDao.queryByProductId(Integer.parseInt(productId));
        Integer brandId = Integer.parseInt(product.get("BRAND_ID").toString());
        Integer classId = Integer.parseInt(product.get("CLASS_ID").toString());
        Map<String, Object> brand = brandDao.queryByBrandId(brandId);
        Map<String, Object> catrgory = categoryDao.queryByClassId(classId);
        product.put("brand",brand);
        product.put("category",catrgory);
        return product;
    }

    @Override
    public List<Map<String, Object>> hot() {
        return productDao.queryHot();
    }


}
