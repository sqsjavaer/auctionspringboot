package com.baizhi.ssm.service.impl;

import com.baizhi.ssm.dao.AuctionDao;
import com.baizhi.ssm.entity.Auction;
import com.baizhi.ssm.entity.Record;
import com.baizhi.ssm.service.AuctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AuctionServiceImpl implements AuctionService {
     
	@Autowired
	private  AuctionDao auctionDao;
	public void setAuctionDao(AuctionDao auctionDao) {

		this.auctionDao = auctionDao;
	}

	@Override
	public List<Auction> getAll(Auction auction) {


        List<Auction> all = auctionDao.getAll(auction);

        return all;
	}

	@Override
	public void deleteAuctionById(int id){

	    auctionDao.deleteById(id);
	}

	@Override
	public Auction getOneById(int id) {

	    return auctionDao.selectOneById(id);
	}

	@Override
	public void updateOne(Auction auction) {

	    auctionDao.update(auction);
	}

	@Override
	public void addOne(Auction auction) {
	 auctionDao.insertOne(auction);
	}

	@Override
	public List<Record> getOne(int id) {
		
		return auctionDao.getOne(id);
	}

}
