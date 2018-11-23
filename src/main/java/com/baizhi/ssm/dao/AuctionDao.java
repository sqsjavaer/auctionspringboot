package com.baizhi.ssm.dao;

import com.baizhi.ssm.entity.Auction;
import com.baizhi.ssm.entity.Record;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface AuctionDao {
     
	List<Auction>getAll(@Param("auction") Auction auction);
	 void   deleteById(int id);
	 Auction  selectOneById(int id);
	 void update(Auction auction);
	 void  insertOne(Auction auction);
	 List<Record>  getOne(int aid);


}
