package com.baizhi.ssm.controller;

import com.baizhi.ssm.entity.Auction;
import com.baizhi.ssm.entity.Record;
import com.baizhi.ssm.service.AuctionService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;


@Controller
public class AuctionController {


    @Autowired
    private AuctionService auctionService;

    @RequestMapping("/getAll")
    public String getAllAuction(Auction auction, Map map, @RequestParam(defaultValue = "1")  Integer pageNum, Integer pageSize) {
        /*if (pageNum == null) {
            pageNum = 1;
        }*/
        if (pageSize == null) {
            pageSize = 5;
        }

        PageHelper.startPage(pageNum, pageSize);
        List<Auction> alist = auctionService.getAll(auction);
        PageInfo<Auction> pageInfo = new PageInfo<>(alist);


        map.put("list", alist);
        map.put("pageInfo", pageInfo);
        map.put("auc",auction);
        return "showAuction";
    }

    @SuppressWarnings("deprecation")
    @RequestMapping("/add")
    public String addAuc(HttpServletRequest request, Auction auction, MultipartFile imgFile) throws IllegalStateException, IOException {

        String realPath = request.getRealPath("images");

        String fileName = imgFile.getOriginalFilename();
        fileName = new Date().getTime() + fileName;

        imgFile.transferTo(new File(realPath + "//" + fileName));

        auction.setAuction_pic(fileName);
        auctionService.addOne(auction);

        return "redirect:/getAll.do";
    }

    @RequestMapping("/delete")
    public String delete(int id) {
        auctionService.deleteAuctionById(id);
        return "redirect:/getAll.do";
    }

    @RequestMapping("/update")
    public String update(HttpServletRequest request, Auction auction, BindingResult bindingResult, MultipartFile imgFile) throws IllegalStateException, IOException {
       // System.out.println(auction + "%%%%%%%%%%%%%%%%%%%%%%%%%");
        if (imgFile != null) {
            String realPath = request.getRealPath("images");
            String fileName = imgFile.getOriginalFilename();
            fileName = new Date().getTime() + fileName;
            imgFile.transferTo(new File(realPath + "//" + fileName));
            auction.setAuction_pic(fileName);
        }
        auctionService.updateOne(auction);

        return "redirect:/getAll.do";
    }

    @RequestMapping("/getOne")
    public String getOne(int id, Map map) {

        Auction auction = auctionService.getOneById(id);
        map.put("auction", auction);
        return "showOne";
    }

    @RequestMapping("/getAllOrder")
    public String getAllOrder(int id, Map map) {
        List<Record> list = auctionService.getOne(id);
        Auction auction = auctionService.getOneById(id);

        map.put("auc", auction);
        map.put("list", list);

        return "oneAuction";
    }

}
