package com.mhr.dao.impl;

import com.mhr.common.C3P0Utils;
import com.mhr.common.RandomDataUtils;
import com.mhr.dao.HomeDao;
import com.mhr.entiy.BclassBean;
import com.mhr.entiy.BookBean;
import com.mhr.entiy.MsgBean;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class HomeDaoImpl implements HomeDao {
    DataSource dataSource = C3P0Utils.getDataSource();
    QueryRunner queryRunner = new QueryRunner(dataSource);


    @Override
    public List<BookBean> searchBooksByRandom(int num, String name) throws Exception{
        //https://blog.csdn.net/liqing0013/article/details/83040946 随机查询
        String sql = "select * from book where b_name like ? order by RAND() limit ?";
        String likename= "%" +  name.trim() + "%";
        Object[] params = {likename,num};
        List<BookBean> query = queryRunner.query(sql, new BeanListHandler<BookBean>(BookBean.class), params);
        return query;
    }

    @Override
    public int countBooks() throws Exception {
        String sql = "select count(1) from book";
        Long num = (Long) queryRunner.query(sql,new ScalarHandler());
        return num.intValue();
    }

    @Override
    public List<MsgBean> searchMsgByDate(int num, String date,int limit) throws Exception {
        String sql = "select * from msg where date = ?  ";
        // 当limit == 0 时查询的是重要通知
        ArrayList<Object> arrayList = new ArrayList();
        date = "2021-01-01";
        arrayList.add(date);
        if (limit == 0){
            sql += " and admin_id = ?   order by date desc limit ?";
            arrayList.add(limit);
        }else if(limit == 1){
            limit = 0;
            sql += " and admin_id != ?   order by date desc limit ?";
            arrayList.add(limit);
        }else {
            sql += "and admin_id is null  order by date desc limit ?";
        }
        arrayList.add(num);
        List<MsgBean> query = queryRunner.query(sql, new BeanListHandler<MsgBean>(MsgBean.class), arrayList.toArray());
        return query;
    }

    @Override
    public void easyinsert() throws Exception {
        //插入类别表数据
        String[] paramsClass = {"马克思主义、列宁主义、毛泽东思想、邓小平理论", "哲学、宗教", "社会科学总论", "政治、法律", "军事", "经济", "文化、科学、教育、体育", "语言、文字", "文学", "艺术", "历史、地理", "自然科学总论", "数理科学和化学", "天文学、地球科学", "生物科学", "医药、卫生", "农业科学", "工业技术", "交通运输", "航空、航天", "环境科学、劳动保护科学（安全科学）", "综合性图书"        };
        String[] params = {};
        List list = java.util.Arrays.asList(paramsClass);
        String sql = "insert into bclass(c_id,c_name) values(?,?)";
//        for (int i = 1; i < list.size(); i++) {
//            queryRunner.update(sql,i,list.get(i));
//            System.out.println(list.get(i));
//        }
        //插入 1000 个用户
//        sql = "insert into user(u_id,u_name,u_password,u_email,u_phone,u_comment,u_sex,u_address,u_tag,u_birth,s_id)" +
//                "values(?,?," +"?,?," +"?,?," +"?,?," +"?,?," +"?)";
//        for (int i = 0; i < 1000; i++) {
//            queryRunner.update(sql,i,RandomDataUtils.getRandomJianName(),"123",RandomDataUtils.getRandomEmail(),RandomDataUtils.getRandomPhone(),
//                    "很好",RandomDataUtils.getRandomSex(),RandomDataUtils.getRandomProvince(),RandomDataUtils.getRandomTag(),RandomDataUtils.getRandomBirth(),
//                    "2018"+i);
//        }
        //插入 校园卡 数据
//        sql = "insert into schoolcard(s_id,s_money,s_password,s_state,b_id,b_lendDate,b_backDate,s_bill)" +
//                "values(?,?,?,?,?,?,?,?)";
//
//        for (int i = 0; i < 1000; i++) {
//            Random r = new Random();
//            String lendDate = RandomDataUtils.getRandomLenDate(6);
//            String[] split = lendDate.split(",");
//            queryRunner.update(sql,"2018"+i,r.nextInt(200),"123",1,r.nextInt(100),split[0],split[1],r.nextInt(1000));
//        }
        //插入 msg 数据
//        for (int i = 0; i < 1000; i++) {
//            sql = "insert into msg (admin_id,u_id,msg,date) values(?,?,?,?)";
//            //重要通知
//            if(i <= 200 ){
//                queryRunner.update(sql,0,null,RandomDataUtils.getRandomMsg(),RandomDataUtils.getRandomDateDay());
//            }else if( i <= 400){
//                //admin
//                queryRunner.update(sql,1,null,RandomDataUtils.getRandomMsg(),RandomDataUtils.getRandomDateDay());
//            }else {
//                queryRunner.update(sql,null,i,RandomDataUtils.getRandomMsg(),RandomDataUtils.getRandomDateDay());
//            }
//        }
        //插入 bpublic 数据
//        sql = "insert into bpublic(b_id,b_readNum,b_lendCount,b_support,b_attention) values(?,?,?,?,?)";
//        Random r = new Random();
//        for (int i = 0; i < 1000   ; i++) {
//            queryRunner.update(sql,i,r.nextInt(100),r.nextInt(100),r.nextInt(10000),r.nextInt(10000));
//        }

        //插入图书表数据
        sql = "insert  into book(b_id,b_name,b_author,b_publish,b_info,b_language,b_price,b_pdate,b_num,c_id,u_comment,u_tag,u_id)" +
                "values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
        Random r = new Random();
        for (int i = 0; i < 250; i++) {
            queryRunner.update(sql,i,RandomDataUtils.getRandomBName(),RandomDataUtils.getRandomJianName(),RandomDataUtils.getRandomPublish(),RandomDataUtils.getRandomMsg(),"汉语",r.nextInt(200),RandomDataUtils.getRandomBirth(),r.nextInt(100),r.nextInt(12),null,RandomDataUtils.getRandomTag(),i);
        }
    }

    @Override
    public Object[]  searchManageCategory() throws  Exception{
        //分类名 随机限定5个
        String sql = "select c_id,c_name FROM bclass where c_id IN (SELECT c_id FROM `book` GROUP BY c_id)  order by RAND() limit 5";
        List<BclassBean> bclass = queryRunner.query(sql, new BeanListHandler<BclassBean>(BclassBean.class));
        //tag
        sql = "SELECT  distinct   SUBSTRING_INDEX( u_tag , ',',1 ) as u_tag FROM    book  order by RAND() limit 5";
        List<BookBean> taglist = queryRunner.query(sql, new BeanListHandler<BookBean>(BookBean.class));
        //出版社
        sql = "SELECT DISTINCT b_publish  FROM  book  GROUP BY b_publish  order by RAND() limit 5";
        List<BookBean> b_publish = queryRunner.query(sql,new BeanListHandler<BookBean>(BookBean.class));
        //出版日期
        sql = "SELECT DISTINCT b_pdate  FROM  book  GROUP BY b_pdate  order by RAND() limit 5";
        List<BookBean> b_pdate = queryRunner.query(sql,new BeanListHandler<BookBean>(BookBean.class));
        //other
        Object[] objects = {bclass,taglist,b_publish,b_pdate};
        return objects;
    }

    @Override
    public List<BookBean> searchBooksByCondition(BookBean bookBean) throws  Exception{

        String sql = " select * from book where b_id = ? or b_pdate = ? or b_name like ? or c_id = ? or b_author like ? or b_publish like ? or u_tag like ? ";
        String likeName = null, likeautor = null , likepublish = null , liketag = null;
        if (null != bookBean.getB_name() && "" != bookBean.getB_name().trim() )
            likeName = "%" + bookBean.getB_name().trim() + "%";
        if (null != bookBean.getB_author() && "" != bookBean.getB_author().trim())
            likeautor = "%" + bookBean.getB_author().trim() + "%";
        if (null != bookBean.getB_publish() && "" != bookBean.getB_publish().trim())
            likepublish = "%" + bookBean.getB_publish().trim() + "%";
        if (null != bookBean.getU_tag() && "" != bookBean.getU_tag().trim())
            liketag = "%" + bookBean.getU_tag().trim() + "%";
        Integer integer = null;
        if (0 != bookBean.getC_id()){
            integer = bookBean.getC_id();
        }
        Object[] params = {bookBean.getB_id(),bookBean.getB_pdate(),likeName,integer,likeautor,likepublish,liketag};
        List<BookBean> query = queryRunner.query(sql, new BeanListHandler<BookBean>(BookBean.class), params);
        return query;
    }

    @Override
    public List<BookBean> searchBooksByConditionCateogry(String c_name) throws Exception{
        String sql = "select * FROM book WHERE c_id = (select c_id FROM bclass WHERE  c_name like ? )";
        String likename = "%" + c_name.trim() + "%";
        List<BookBean> query = queryRunner.query(sql, new BeanListHandler<BookBean>(BookBean.class), likename);
        return query;
    }


}
