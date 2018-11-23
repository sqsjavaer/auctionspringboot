package com.baizhi.ssm.service;

import java.util.List;

import com.baizhi.ssm.entity.Auction;
import com.baizhi.ssm.entity.Record;

public interface AuctionService {
   
	  List<Auction>getAll(Auction auction);
	  
	  void deleteAuctionById(int id);
	  Auction getOneById(int id);
	  void  updateOne(Auction auction); 
	  void   addOne(Auction auction);
	  
	  List<Record>  getOne(int id);
}
